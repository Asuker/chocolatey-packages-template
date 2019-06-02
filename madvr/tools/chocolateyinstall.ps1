﻿$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = 'madvr'
  unzipLocation = $toolsDir
  fileType      = 'zip'
  url           = 'https://www.videohelp.com/download/madVR09217.zip'
  checksum      = '87E088F7B5DE20D0A9065C73015D7FB7C225870380DD3169C70171B77E74BB97'
  checksumType  = 'sha256'
  options = @{
      Headers = @{
        Referer = 'https://www.videohelp.com/software/madVR'
      }
  }
}

Install-ChocolateyZipPackage @packageArgs

regsvr32.exe "$(Join-Path $toolsDir madVR.ax)" /s
if (Get-OSArchitectureWidth -eq 64) {
  regsvr32.exe "$(Join-Path $toolsDir madVR64.ax)" /s
}

$files = get-childitem $toolsDir -include *.exe -recurse
foreach ($file in $files) {
  New-Item "$file.gui" -type file -force | Out-Null
}
