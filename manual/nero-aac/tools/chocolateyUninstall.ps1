$ErrorActionPreference = 'Stop';
$programsDir = "$([environment]::GetFolderPath([environment+specialfolder]::CommonPrograms))"

if ($programsDir) {
  Remove-Item -Recurse "$programsDir\Nero AAC Codec"
}
