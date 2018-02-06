$ErrorActionPreference = 'Stop';

$packageName= 'uncrustify'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://sourceforge.net/projects/uncrustify/files/uncrustify/uncrustify-0.66.1/uncrustify-0.66.1-win32.zip/download'
$url64      = 'https://sourceforge.net/projects/uncrustify/files/uncrustify/uncrustify-0.66.1/uncrustify-0.66.1-win64.zip/download'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url
  url64bit      = $url64

  softwareName  = 'uncrustify*'

  checksum      = 'ced262b6023555aa9716d7104d23bf28104a5304'
  checksumType  = 'sha1'
  checksum64    = '6627a5b80d3573fd2fd8e6c84879ec39876a5773'
  checksumType64= 'sha1'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyZipPackage @packageArgs
