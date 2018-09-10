
<!-- README.md is generated from README.Rmd. Please edit that file -->

    ## Loading required package: testthat

[![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/nlgeocoder)](https://cran.r-project.org/package=nlgeocoder)
[![travis
build](https://travis-ci.org/uRos2018/nlgeocoder.svg?branch=master)](https://travis-ci.org/uRos2018/nlgeocoder)

# nlgeocoder

## Installation

You can install nlgeocoder from github with:

``` r
# install.packages("devtools")
devtools::install_github("uRos2018/nlgeocoder")
```

## Example

### Geocoding

``` r
library(nlgeocoder)
adres <- nl_geocode( c("Henri Faasdreef 312", "Leidschenveen"))
#> Loading required namespace: sf
adres # this is a sf object
#> Simple feature collection with 2 features and 32 fields
#> geometry type:  POINT
#> dimension:      XY
#> bbox:           xmin: 4.40042 ymin: 52.06465 xmax: 4.400575 ymax: 52.06593
#> epsg (SRID):    4326
#> proj4string:    +proj=longlat +datum=WGS84 +no_defs
#>   bron woonplaatscode  type woonplaatsnaam wijkcode huis_nlt
#> 1  BAG           1245 adres  's-Gravenhage WK051844      312
#> 2  BAG           1245 adres  's-Gravenhage WK051844       20
#>   openbareruimtetype buurtnaam gemeentecode
#> 1                Weg De Velden         0518
#> 2                Weg De Velden         0518
#>                                weergavenaam     straatnaam_verkort
#> 1 Henri Faasdreef 312, 2492JP 's-Gravenhage           Henri Faasdr
#> 2  Laan van Leidschenveen 20, 's-Gravenhage Laan van Leidschenveen
#>                                     id gekoppeld_perceel  gemeentenaam
#> 1 adr-604fd61e727850a5bd8c68a7bc509d83     GVH43-BD-6124 's-Gravenhage
#> 2 adr-afa3fc1caf3af44de53821b3135d4a16     GVH44-BE-5354 's-Gravenhage
#>    buurtcode              wijknaam                     identificatie
#> 1 BU05184419 Wijk 44 Leidschenveen 0518010000452341-0518200000452339
#> 2 BU05184419 Wijk 44 Leidschenveen 0518010001757445-0518200001757491
#>   openbareruimte_id  waterschapsnaam provinciecode postcode provincienaam
#> 1  0518300000202273 HHS van Delfland          PV28   2492JP  Zuid-Holland
#> 2  0518300000202933 HHS van Delfland          PV28       NA  Zuid-Holland
#>   nummeraanduiding_id waterschapscode adresseerbaarobject_id huisnummer
#> 1    0518200000452339              15       0518010000452341        312
#> 2    0518200001757491              15       0518010001757445         20
#>   provincieafkorting                centroide_rd             straatnaam
#> 1                 ZH POINT(87336.752 453530.196)        Henri Faasdreef
#> 2                 ZH POINT(87345.457 453388.237) Laan van Leidschenveen
#>     score huisletter gekoppeld_appartement              centroide_ll
#> 1 44.8015         NA                  NULL  POINT (4.40042 52.06593)
#> 2 18.9708       NULL                  NULL POINT (4.400575 52.06465)
```

### Suggestions

``` r
## basic example code
adres <- nl_suggest("Dam, Amsterdam")
#> https://geodata.nationaalgeoregister.nl/locatieserver/v3/suggest?q=Dam,%20Amsterdam
head(adres$response$docs, 2)
#>   type            weergavenaam                                   id
#> 1  weg          Dam, Amsterdam weg-ab6df5babb15e466f3699b5d2c22e110
#> 2  weg Damloperspad, Amsterdam weg-c57e61425c421a206015596b41c92259
#>      score
#> 1 21.70456
#> 2 14.84300
```

### lookup

``` r
nl_lookup("weg-ab6df5babb15e466f3699b5d2c22e110")
#> $bron
#> [1] "BAG/NWB"
#> 
#> $identificatie
#> [1] "0363300000003186"
#> 
#> $openbareruimte_id
#> [1] "0363300000003186"
#> 
#> $provinciecode
#> [1] "PV27"
#> 
#> $woonplaatscode
#> [1] "3594"
#> 
#> $type
#> [1] "weg"
#> 
#> $woonplaatsnaam
#> [1] "Amsterdam"
#> 
#> $provincienaam
#> [1] "Noord-Holland"
#> 
#> $nwb_id
#> [1] "031209"
#> 
#> $centroide_ll
#> [1] "POINT(4.89304914 52.372973)"
#> 
#> $openbareruimtetype
#> [1] "Weg"
#> 
#> $gemeentecode
#> [1] "0363"
#> 
#> $weergavenaam
#> [1] "Dam, Amsterdam"
#> 
#> $provincieafkorting
#> [1] "NH"
#> 
#> $centroide_rd
#> [1] "POINT(121348.243 487347.752)"
#> 
#> $straatnaam_verkort
#> [1] "Dam"
#> 
#> $id
#> [1] "weg-ab6df5babb15e466f3699b5d2c22e110"
#> 
#> $straatnaam
#> [1] "Dam"
#> 
#> $gemeentenaam
#> [1] "Amsterdam"
```
