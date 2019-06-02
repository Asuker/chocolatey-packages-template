$ErrorActionPreference = 'Stop';
$url32 = 'https://github.com/StreamWhatYouHear/SWYH/releases/download/1.4.16069.0/SWYH_1.4.16069.exe'
$checksum32 = '547756D4BB7E02EA72A0B91AFEC457AD12D334B519A39116FA1D2503700BDE18'

$packageArgs = @{
  packageName    = 'streamwhatyouhear'
  fileType       = 'exe'
  silentArgs     = '/verysilent'
  validExitCodes = @(0)
  url            = $url32
  checksum       = $checksum32
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
