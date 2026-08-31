$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$installDir32 = "$(Join-Path $toolsDir x64)"

regsvr32.exe "$(Join-Path $toolsDir XySubFilter.dll)" /u /s
if (Get-OSArchitectureWidth -eq 64) {
  regsvr32.exe "$(Join-Path $installDir32 XySubFilter.dll)" /u /s
}
