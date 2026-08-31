$ErrorActionPreference = 'Stop';
$url32 = 'https://github.com/StreamWhatYouHear/SWYH/releases/download/1.5.0/SWYH_1.5.0.exe'
$checksum32 = '267f72ff5ccb056855574a1eb9b52d7916a3057b79f687cd5e1cc0c113bbe9ca'

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
