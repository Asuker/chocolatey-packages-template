import-module au

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri 'https://software.intel.com/en-us/articles/intel-power-gadget-20' -UseBasicParsing
  $url32     = $download_page.links | ? title -match 'Power Gadget .* for Windows$' | select -First 1
  $url32.title -match 'Gadget (?<version>.*) for'
  return @{
    Version = $matches['version']
    URL32 = "https://software.intel.com$($url32.href)"
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
