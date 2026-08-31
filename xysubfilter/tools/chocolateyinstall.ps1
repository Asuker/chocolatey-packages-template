$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$installDir32   = "$(Join-Path $toolsDir x86)"
$url32      = 'https://github.com/Cyberbeing/xy-VSFilter/releases/download/3.1.0.752/XySubFilter_3.1.0.752_x86.zip'
$checksum32 = 'B6ED1D9F548B8726A70BA09E48250793407413CD2C71B054F098E4908C382BAE'
$url64      = 'https://github.com/Cyberbeing/xy-VSFilter/releases/download/3.1.0.752/XySubFilter_3.1.0.752_x64.zip'
$checksum64 = '13CAE8C9E5CE367E74771A803BE6AA821F922E7897E14CFF9A1F2529FC185F66'

$packageArgs = @{
  packageName    = 'xysubfilter'
  unzipLocation  = $toolsDir
  fileType       = 'zip'
  url            = $url32
  checksumType   = 'sha256'
  checksum       = $checksum32
  url64bit       = $url64
  checksumType64   = 'sha256'
  checksum64       = $checksum64
}

$packageArgs32 = @{
  packageName   = 'xysubfilter'
  unzipLocation = $installDir32
  fileType      = 'zip'
  url           = $url32
  checksumType  = 'sha256'
  checksum      = $checksum32
}

Install-ChocolateyZipPackage @packageArgs
regsvr32.exe "$(Join-Path $toolsDir XySubFilter.dll)" /s

if (Get-OSArchitectureWidth -eq 64) {
  Install-ChocolateyZipPackage @packageArgs32
  regsvr32.exe "$(Join-Path $installDir32 XySubFilter.dll)" /s
}
