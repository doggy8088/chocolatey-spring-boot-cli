$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
$spring_home = Join-Path $env:ChocolateyPackageFolder "spring-2.1.3.RELEASE"

Install-ChocolateyEnvironmentVariable "SPRING_HOME" "$spring_home" Machine
Install-BinFile "spring" "$spring_home\bin\spring.bat"
