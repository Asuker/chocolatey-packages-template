﻿$ErrorActionPreference = 'Stop';

$toolsPath = Split-Path $MyInvocation.MyCommand.Definition

$args = @(
  '-addstore'
  'TrustedPublisher'
  "$(Resolve-Path $toolsPath)\openvpn.cer"
)
Start-ChocolateyProcessAsAdmin -ExeToRun 'certutil' -Statements $args

$packageArgs = @{
  packageName    = 'nextdns'
  fileType       = 'exe'
  silentArgs     = '/S'
  validExitCodes = @(0)
  url            = 'https://nextdns.io/download/windows/stable'
  checksum       = '2ea1c11845c75a05fd2769a168bbe227301572a79b8fbbc43522343998c9cb21'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
