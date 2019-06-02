import-module au

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri 'https://github.com/StreamWhatYouHear/SWYH/releases' -UseBasicParsing
  $url32     = $download_page.links | ? href -match 'SWYH_.*.exe$' | select -First 1 -expand href
  (Split-Path -Path "$url32" -Leaf) -match 'SWYH_(?<version>.*).exe'
  return @{
    Version = $matches['version']
    URL32 = "https://github.com$url32"
  }
}

function global:au_SearchReplace {
  @{
    "tools\chocolateyInstall.ps1" = @{
      "(?i)(^\`$url32\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
      "(?i)(^\`$checksum32\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
    }
  }
}

update
