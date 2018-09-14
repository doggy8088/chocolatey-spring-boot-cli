
$ErrorActionPreference = 'Stop';
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url         = 'https://web.archive.org/web/20160923100008/http://ftp6.nero.com/tools/NeroAACCodec-1.5.1.zip'
$programsDir = "$([environment]::GetFolderPath([environment+specialfolder]::CommonPrograms))"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $env:ChocolateyPackageFolder
  url           = $url
  checksum      = 'E0496AD856E2803001A59985368D21B22F4FBDD55589C7F313D6040CEFFF648B'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

$shortcutArgs = @{
  ShortcutFilePath = "$programsDir\Nero AAC Codec\readme.lnk"
  TargetPath       = "$env:ChocolateyPackageFolder\readme.txt"
}

Install-ChocolateyShortcut @shortcutArgs

$shortcutArgs = @{
  ShortcutFilePath = "$programsDir\Nero AAC Codec\license.lnk"
  TargetPath       = "$env:ChocolateyPackageFolder\license.txt"
}

Install-ChocolateyShortcut @shortcutArgs

$shortcutArgs = @{
  ShortcutFilePath = "$programsDir\Nero AAC Codec\Nero AAC Encoder Tutorial.lnk"
  TargetPath       = "$env:ChocolateyPackageFolder\NeroAAC_tut.pdf"
}

Install-ChocolateyShortcut @shortcutArgs

$shortcutArgs = @{
  ShortcutFilePath = "$programsDir\Nero AAC Codec\Nero AAC on Hydrogrenaudio Knowledgebase.lnk"
  TargetPath       = "https://wiki.hydrogenaud.io/index.php?title=Nero_AAC"
}

Install-ChocolateyShortcut @shortcutArgs
