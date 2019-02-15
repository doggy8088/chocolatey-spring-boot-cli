$ErrorActionPreference = 'Stop';

Start-ChocolateyProcessAsAdmin 'Get-AppxPackage -Name *FluentTerminal* | Remove-AppxPackage -AllUsers' -ValidExitCodes @(0)
Start-ChocolateyProcessAsAdmin '& certutil -delstore TrustedPeople 1ec0504f23d8f58f4b2cbe942f41d279' -ValidExitCodes @(0)
Start-ChocolateyProcessAsAdmin 'Remove-Item -Path "hkcu:\Software\Classes\Directory\shell\Open Fluent Terminal here" -Force -Recurse' -ValidExitCodes @(0)
Start-ChocolateyProcessAsAdmin 'Remove-Item -Path "hkcu:\Software\Classes\Directory\Background\shell\Open Fluent Terminal here" -Force -Recurse' -ValidExitCodes @(0)
Start-ChocolateyProcessAsAdmin 'Remove-Item -Path "hkcu:\Software\Classes\Directory\LibraryFolder\shell\Open Fluent Terminal here" -Force -Recurse' -ValidExitCodes @(0)
