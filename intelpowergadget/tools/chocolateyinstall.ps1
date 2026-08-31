$ErrorActionPreference = 'Stop';
$url32 = 'http://software.intel.com/content/dam/develop/external/us/en/documents/IntelPowerGadget_3.5.9.msi'
$checksum32 = '3855df25893ffbd0e304c4a518e015cd1522e1af8e29deefd0cb290c05a2fa60'

$installArgs = @{
    packageName    = 'intelpowergadget'
    fileType       = 'msi'
    softwareName   = 'Intel® Power Gadget*'
    url            = $url32
    checksum       = $checksum32
    checksumType   = 'sha256'
    silentArgs     = '/quiet /norestart ALLUSERS=1'
    validExitCodes = @(0, 3010, 1641, 1603)
}

Install-ChocolateyPackage @installArgs
