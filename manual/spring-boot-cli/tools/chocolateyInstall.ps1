$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
$packageDir = Split-Path $toolsDir
$spring_home = Join-Path $packageDir "spring-2.0.4.RELEASE"

Get-ChocolateyUnzip "$toolsDir/spring-boot-cli-2.0.4.RELEASE-bin.zip" $packageDir
Install-ChocolateyEnvironmentVariable "SPRING_HOME" $spring_home Machine
Install-BinFile "spring" "$spring_home/bin/spring.bat"
