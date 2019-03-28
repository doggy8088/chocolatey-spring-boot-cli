$ErrorActionPreference = 'Stop';

Get-AppxPackage -Name *FluentTerminal* | Remove-AppxPackage -AllUsers
& certutil -delstore TrustedPeople 1ec0504f23d8f58f4b2cbe942f41d279
reg delete "HKCU\Software\Classes\Directory\shell\Open Fluent Terminal here" /f
reg delete "HKCU\Software\Classes\Directory\Background\shell\Open Fluent Terminal here" /f
reg delete "HKCU\Software\Classes\LibraryFolder\Background\shell\Open Fluent Terminal here" /f
