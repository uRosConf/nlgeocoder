
<!-- README.md is generated from README.Rmd. Please edit that file -->

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

### Geocoding nl addresses

``` r
library(nlgeocoder)
address <- nl_geocode( c("Henri Faasdreef 312", "Leidschenveen"))
#> Loading required namespace: sf
address[c("weergavenaam")] # this is a sf object
#> Simple feature collection with 2 features and 1 field
#> geometry type:  POINT
#> dimension:      XY
#> bbox:           xmin: 4.40042 ymin: 52.06465 xmax: 4.400575 ymax: 52.06593
#> epsg (SRID):    4326
#> proj4string:    +proj=longlat +datum=WGS84 +no_defs
#>                                weergavenaam              centroide_ll
#> 1 Henri Faasdreef 312, 2492JP 's-Gravenhage  POINT (4.40042 52.06593)
#> 2  Laan van Leidschenveen 20, 's-Gravenhage POINT (4.400575 52.06465)
names(address)
#>  [1] "bron"                   "woonplaatscode"        
#>  [3] "type"                   "woonplaatsnaam"        
#>  [5] "wijkcode"               "huis_nlt"              
#>  [7] "openbareruimtetype"     "buurtnaam"             
#>  [9] "gemeentecode"           "weergavenaam"          
#> [11] "straatnaam_verkort"     "id"                    
#> [13] "gekoppeld_perceel"      "gemeentenaam"          
#> [15] "buurtcode"              "wijknaam"              
#> [17] "identificatie"          "openbareruimte_id"     
#> [19] "waterschapsnaam"        "provinciecode"         
#> [21] "postcode"               "provincienaam"         
#> [23] "nummeraanduiding_id"    "waterschapscode"       
#> [25] "adresseerbaarobject_id" "huisnummer"            
#> [27] "provincieafkorting"     "centroide_rd"          
#> [29] "straatnaam"             "score"                 
#> [31] "centroide_ll"
```

### Suggestions

``` r
## basic example code
adres <- nl_suggest("Dam, Amsterdam")
head(adres$response$docs, 2)
#>   type            weergavenaam                                   id
#> 1  weg          Dam, Amsterdam weg-ab6df5babb15e466f3699b5d2c22e110
#> 2  weg Damloperspad, Amsterdam weg-c57e61425c421a206015596b41c92259
#>      score
#> 1 21.70482
#> 2 14.84322
```

### lookup

``` r
obj <- nl_lookup("weg-ab6df5babb15e466f3699b5d2c22e110")
names(obj)
#>  [1] "bron"               "identificatie"      "openbareruimte_id" 
#>  [4] "provinciecode"      "woonplaatscode"     "type"              
#>  [7] "woonplaatsnaam"     "provincienaam"      "nwb_id"            
#> [10] "centroide_ll"       "openbareruimtetype" "gemeentecode"      
#> [13] "weergavenaam"       "provincieafkorting" "centroide_rd"      
#> [16] "straatnaam_verkort" "id"                 "straatnaam"        
#> [19] "gemeentenaam"
```
