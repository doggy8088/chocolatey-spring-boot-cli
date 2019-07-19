$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$installDir = "$env:ChocolateyPackageFolder\install"
$packageZip = "$toolsDir\FluentTerminal.App_0.5.3.0_Test.zip"

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
    "Windows 10/Server 2016" {
        # Ok
    }
    default {
        # Windows XP, Windows 2003, Windows Vista, Windows 7, or unknown?
        throw "$packageName is not supported on $ProductName, ($EditionId), Windows Kernel: $osVersion"
    }
}

# Version check OK, go ahead and install
echo "Enabling App Sideloading"
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock" /t REG_DWORD /f /v "AllowAllTrustedApps" /d "1"
Get-ChocolateyUnzip $packageZip $installDir
Remove-Item $packageZip
& "$installDir\Install.ps1" -Force -ForceContextMenu
if ( -not $? ) { Exit 1 }
Remove-Item $installDir -Recurse
echo "Installation complete"
