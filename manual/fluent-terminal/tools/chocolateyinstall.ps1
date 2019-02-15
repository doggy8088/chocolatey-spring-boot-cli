$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$installDir = "$env:ChocolateyPackageFolder\install"
$packageZip = "$toolsDir\FluentTerminal.App_0.3.1.0_Test.zip"

Get-ChocolateyUnzip $packageZip $installDir
Remove-Item $packageZip
Move-Item -Path "$toolsDir\Install.ps1" -Destination $installDir -Force
Start-ChocolateyProcessAsAdmin "& `"$installDir\Install.ps1`" -Force -ForceContextMenu" -Minimized -ValidExitCodes @(0) 
Remove-Item $installDir -Recurse
