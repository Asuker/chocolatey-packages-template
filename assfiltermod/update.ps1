import-module au

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri 'https://github.com/Blitzker/assfiltermod/releases' -UseBasicParsing
  $url32     = $download_page.links | ? href -match '_x32.zip$' | select -First 1 -expand href
  $url64     = $download_page.links | ? href -match '_x64.zip$' | select -First 1 -expand href
  (Split-Path -Path "$url32" -Leaf) -match '_v(?<version>.*)_x'
  return @{
    Version = $matches['version']
    URL32 = "https://github.com$url32"
    URL64 = "https://github.com$url64"
  }
}

function global:au_SearchReplace {
  @{
    "tools\chocolateyInstall.ps1" = @{
      "(?i)(^\`$url32\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
      "(?i)(^\`$checksum32\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
      "(?i)(^\`$url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
      "(?i)(^\`$checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
    }
  }
}

update
