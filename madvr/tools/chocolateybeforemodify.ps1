$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

regsvr32.exe "$(Join-Path $toolsDir madVR.ax)" /u /s
if (Get-OSArchitectureWidth -eq 64) {
  regsvr32.exe "$(Join-Path $toolsDir madVR64.ax)" /u /s
}
