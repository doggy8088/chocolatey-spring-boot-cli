$ErrorActionPreference = 'Stop'; # stop on all errors

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$rootPath   = "$(Split-Path -parent $toolsDir)"
$spring_home = Join-Path $rootPath "spring-2.7.3"

Uninstall-BinFile "spring" "$spring_home\bin\spring.bat"
