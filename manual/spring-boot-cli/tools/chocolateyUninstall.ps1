$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
$spring_home = Join-Path $env:ChocolateyPackageFolder "spring-2.0.7.RELEASE"

Uninstall-ChocolateyEnvironmentVariable "SPRING_HOME" Machine
Uninstall-BinFile "spring" "$spring_home\bin\spring.bat"
