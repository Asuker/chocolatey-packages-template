$ErrorActionPreference = 'Stop';
$url32 = 'http://api.dengine.net/1/builds?dl=doomsday_2.3.1_x86.msi'
$checksum32 = 'abe45c8433f2a565ed0ec03d4ba3b45cc420238867159c23cde964f9cc203047'
$url64 = 'http://api.dengine.net/1/builds?dl=doomsday_2.3.1_x64.msi'
$checksum64 = '3b46c0e4fd3e11bea20f31ee4e6adf19602660c82c57816684e00d6695ed3816'

$packageArgs = @{
    packageName    = 'doomsday'
    fileType       = 'msi'
    url            = $url32
    url64bit       = $url64
    softwareName   = 'Doomsday*'
    checksum       = $checksum32
    checksumType   = 'sha256'
    checksum64     = $checksum64
    checksumType64 = 'sha256'
    silentArgs     = "/quiet /norestart ALLUSERS=1"
    validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
