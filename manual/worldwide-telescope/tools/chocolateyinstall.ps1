$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://wwtweb.blob.core.windows.net/drops/WWTSetup.5.5.03.msi'

#===============================================================================
# Ensure that user is not on Windows XP/Vista
#
# The following version check code is lifted straight from the 'powershell' install script
#===============================================================================

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
  "XP" {
    throw "$packageName is not supported on $ProductName, ($EditionId), Windows Kernel: $osVersion"
  }
  "2003" {
    throw "$packageName is not supported on $ProductName, ($EditionId), Windows Kernel: $osVersion"
  }
  "Vista/2008" {
    throw "$packageName is not supported on $ProductName, ($EditionId), Windows Kernel: $osVersion"
  }
}
#===============================================================================

# Windows version is OK, proceed

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  url           = $url
  softwareName  = 'WorldWide Telescope'
  checksum      = '47FE3DAFB826898331998C6FD4612526B25AB842B3B01E9C8B318D80100D73E7'
  checksumType  = 'sha256'
  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`" AUTOUPDATE=0"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs

# Disable automatic updates (direct registry update since the AUTOUPDATE=0 MSI parameter is ignored by the installer)
# https://github.com/WorldWideTelescope/wwt-windows-client/issues/133
$path = "HKCU:\Software\Microsoft\WorldWide Telescope"
if (Test-Path $path) {
  New-ItemProperty -Path $path -Name "AutoUpdates" -Value 0 -PropertyType DWORD -Force
}
