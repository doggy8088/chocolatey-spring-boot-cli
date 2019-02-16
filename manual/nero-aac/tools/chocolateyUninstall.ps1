$ErrorActionPreference = 'Stop';
$programsDir = "$([environment]::GetFolderPath([environment+specialfolder]::CommonPrograms))"

if ($programsDir) {
  Start-ChocolateyProcessAsAdmin "Remove-Item `"$programsDir\Nero AAC Codec`" -Recurse"
}
