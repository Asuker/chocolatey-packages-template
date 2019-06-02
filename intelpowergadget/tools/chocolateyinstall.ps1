$ErrorActionPreference = 'Stop';
$tempDir = "$(Get-PackageCacheLocation)"
$tempFile = "$(Join-Path $tempDir intelpowergadget.zip)"
$url32      = 'https://software.intel.com/file/612178/download'
$checksum32 = 'CB224ADB799D2029679B02201C3B517224124283D9EB4F64A1FEC2182C6DF5CE'

$downloadArgs = @{
  packageName   = 'intelpowergadget'
  fileFullPath  = $tempFile
  url           = $url32
  checksum      = $checksum32
  checksumType  = 'sha256'
}
$unzipArgs = @{
  fileFullPath = $tempFile
  destination  = $tempDir
}
$installArgs = @{
  packageName    = 'intelpowergadget'
  fileType       = 'msi'
  silentArgs     = '/quiet', 'ALLUSERS=1'
  file           = $(Join-Path $tempDir PowerGadget.msi)
  validExitCodes = @(0, 3010, 1641, 1603)
}

Get-ChocolateyWebFile @downloadArgs
Get-ChocolateyUnzip @unzipArgs
Install-ChocolateyInstallPackage @installArgs
