# Remove this release when either upgrading or uninstalling

# use this for a while to clean up older installs
#$spring_home = Join-Path $env:ChocolateyPackageFolder "spring-2.2.1.RELEASE"
$spring_home = Join-Path $env:ChocolateyPackageFolder "spring-2.?.?.RELEASE"

#Start-ChocolateyProcessAsAdmin "Remove-Item `"$spring_home`" -Recurse" -validExitCodes @(0)
Remove-Item "$spring_home" -Recurse
