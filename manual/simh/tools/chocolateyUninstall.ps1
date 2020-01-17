$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$installDir = Join-Path -Path $(Get-ToolsLocation) -ChildPath $packageName

Write-Host "Removing SimH from '$installDir'"
Remove-Item $installDir -Recurse -Force -ea 0

$newPath = $Env:Path.Replace(";$installDir", '')
if ($newPath -eq $Env:PATH) { return }

# If the package was installed in non-admin mode
# we probably won't ever get here
Write-Host "Removing SimH from user PATH"
[System.Environment]::SetEnvironmentVariable('PATH', $newPath, 'User')
