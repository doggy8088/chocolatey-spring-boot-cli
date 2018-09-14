$toolsDir = Split-Path $MyInvocation.MyCommand.Definition
$spring_home = Join-Path $env:ChocolateyPackageFolder "spring-2.0.5.RELEASE"

Get-ChocolateyUnzip "$toolsDir\spring-boot-cli-2.0.5.RELEASE-bin.zip" "$env:ChocolateyPackageFolder"
Remove-Item -path "$toolsDir\spring-boot-cli-2.0.5.RELEASE-bin.zip"
Install-ChocolateyEnvironmentVariable "SPRING_HOME" "$spring_home" Machine
Install-BinFile "spring" "$spring_home\bin\spring.bat"
