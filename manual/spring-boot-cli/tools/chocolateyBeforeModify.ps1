# Remove this release when either upgrading or uninstalling

$spring_home = Join-Path $env:ChocolateyPackageFolder "spring-2.1.3.RELEASE"
Start-ChocolateyProcessAsAdmin "Remove-Item `"$spring_home`" -Recurse" -validExitCodes @(0)
