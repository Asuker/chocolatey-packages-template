Import-Module au

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri 'https://dengine.net/windows' -UseBasicParsing
    $url32 = $download_page.links | ? href -match '_x86.msi$' | select -First 1 -expand href
    $url64 = $download_page.links | ? href -match '_x64.msi$' | select -First 1 -expand href
    (Split-Path -Path "$url32" -Leaf) -match 'doomsday_(?<version>.*)_x86.msi'
    return @{
        Version = $matches['version']
        URL32   = $url32
        URL64   = $url64
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
