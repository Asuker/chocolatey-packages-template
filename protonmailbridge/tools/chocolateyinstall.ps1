$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = 'protonmailbridge'
  fileType       = 'exe'
  silentArgs     = '/quiet'
  validExitCodes = @(0)
  url            = 'https://protonmail.com/download/Bridge-Installer.exe'
  checksum       = 'A3E9354E13B0875D42ED4BC8E5666926F994A9518F5232A0820D89E5AADAF34F'
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
