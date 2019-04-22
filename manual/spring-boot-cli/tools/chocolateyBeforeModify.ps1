# Remove this release when either upgrading or uninstalling

$spring_home = Join-Path $env:ChocolateyPackageFolder "spring-2.1.4.RELEASE"
Start-ChocolateyProcessAsAdmin "Remove-Item `"$spring_home`" -Recurse" -validExitCodes @(0)
