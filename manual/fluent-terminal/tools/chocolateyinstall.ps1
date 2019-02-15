$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$installDir = "$env:ChocolateyPackageFolder\install"
$packageZip = "$toolsDir\FluentTerminal.App_0.3.1.0_Test.zip"

# The following version check code is lifted straight from the 'powershell' install script

$osversionLookup = @{
"5.1.2600" = "XP";
"5.1.3790" = "2003";
"6.0.6001" = "Vista/2008";
"6.1.7600" = "Win7/2008R2";
"6.1.7601" = "Win7 SP1/2008R2 SP1"; # SP1 or later.
"6.2.9200" = "Win8/2012";
"6.3.9600" = "Win8.1/2012R2";
"10.0.*" = "Windows 10/Server 2016"
}

$os = Get-WmiObject Win32_OperatingSystem
$osVersion = $os.version

$ProductName = (Get-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion' -Name 'ProductName').ProductName
$EditionId = (Get-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion' -Name 'EditionID').EditionId

#This will show us if we are running on Nano Server (Kernel version alone won't show this)
Write-Output "Running on: $ProductName, ($EditionId), Windows Kernel: $osVersion"

if( ([version]$osVersion).Major -eq "10" ) {
    $osVersion = "$(([version]$osVersion).Major).$(([version]$osVersion).Minor).*"
}

switch ($osversionLookup[$osVersion]) {
    "Win8/2012" {
        # Ok
    }
    "Win8.1/2012R2" {
        # Ok
    }
    "Windows 10/Server 2016" {
        # Ok
    }
    default {
        # Windows XP, Windows 2003, Windows Vista, Windows 7, or unknown?
        throw "$packageName is not supported on $ProductName, ($EditionId), Windows Kernel: $osVersion"
    }
}

# Version check OK, go ahead and install
Get-ChocolateyUnzip $packageZip $installDir
Remove-Item $packageZip
Move-Item -Path "$toolsDir\Install.ps1" -Destination $installDir -Force
Start-ChocolateyProcessAsAdmin "& `"$installDir\Install.ps1`" -Force -ForceContextMenu" -Minimized -ValidExitCodes @(0)
Remove-Item $installDir -Recurse
