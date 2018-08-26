$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
$packageDir = Split-Path $toolsDir
$spring_home = Join-Path $packageDir "spring-2.0.4.RELEASE"

Uninstall-ChocolateyEnvironmentVariable "SPRING_HOME" Machine
Uninstall-BinFile "spring" "$spring_home/bin/spring.bat"
