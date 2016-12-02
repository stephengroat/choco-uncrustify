
$ErrorActionPreference = 'Stop';

$packageName= 'uncrustify'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://sourceforge.net/projects/uncrustify/files/uncrustify/uncrustify-0.64/uncrustify-0.64-win32.zip/download'
$url64      = 'https://sourceforge.net/projects/uncrustify/files/uncrustify/uncrustify-0.64/uncrustify-0.64-win64.zip/download'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url
  url64bit      = $url64

  softwareName  = 'uncrustify*'

  checksum      = '3a76aa568eb3c5fefeb9e726133c8c2c48d4e0f7'
  checksumType  = 'sha1'
  checksum64    = '1dcddc67c87d50e58d0147a60b8b8b430ad2f360'
  checksumType64= 'sha1'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyZipPackage @packageArgs
