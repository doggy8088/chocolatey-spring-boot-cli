$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$installDir = Join-Path -Path $(Get-ToolsLocation) -ChildPath $packageName
$fileLocation = Join-Path $toolsDir 'simhv39-0-exe.zip'

Write-Host "Installing SimH to '$installDir'"
Get-ChocolateyUnzip -PackageName $packageName -FileFullPath $fileLocation -Destination $installDir

Write-Host "Adding '$installDir' to user path"
Install-ChocolateyPath $installDir 'User'

Remove-Item -ea 0 $fileLocation
