$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
$spring_home = Join-Path $env:ChocolateyPackageFolder "spring-2.2.4.RELEASE"

Uninstall-ChocolateyEnvironmentVariable "SPRING_HOME" Machine
Uninstall-BinFile "spring" "$spring_home\bin\spring.bat"
