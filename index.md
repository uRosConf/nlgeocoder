# nlgeocoder

## Installation

You can install nlgeocoder from CRAN with

``` r
install.packages("nlgeocoder")
```

Development version (use at own risk!) can be installed from github
with:

``` r
# install.packages("devtools")
devtools::install_github("uRos2018/nlgeocoder")
```

## Example

### Geocoding nl addresses

``` r
library(nlgeocoder)
address <- nl_geocode( c("Henri Faasdreef 312", "Leidschenveen"))
address[c("weergavenaam")] # this is a sf object
#> Simple feature collection with 2 features and 1 field
#> Geometry type: POINT
#> Dimension:     XY
#> Bounding box:  xmin: 4.399247 ymin: 52.06491 xmax: 4.40042 ymax: 52.06593
#> Geodetic CRS:  WGS 84
#>                                      weergavenaam              centroide_ll
#> 1       Henri Faasdreef 312, 2492JP 's-Gravenhage  POINT (4.40042 52.06593)
#> 2 Laan van Leidschenveen 27, 2493CT 's-Gravenhage POINT (4.399247 52.06491)
colnames(address)
#>  [1] "bron"                   "woonplaatscode"         "type"                  
#>  [4] "woonplaatsnaam"         "wijkcode"               "huis_nlt"              
#>  [7] "openbareruimtetype"     "buurtnaam"              "gemeentecode"          
#> [10] "rdf_seealso"            "weergavenaam"           "straatnaam_verkort"    
#> [13] "id"                     "gekoppeld_perceel"      "gemeentenaam"          
#> [16] "buurtcode"              "wijknaam"               "identificatie"         
#> [19] "openbareruimte_id"      "waterschapsnaam"        "provinciecode"         
#> [22] "postcode"               "provincienaam"          "nummeraanduiding_id"   
#> [25] "waterschapscode"        "adresseerbaarobject_id" "huisnummer"            
#> [28] "provincieafkorting"     "centroide_rd"           "straatnaam"            
#> [31] "score"                  "gekoppeld_appartement"  "centroide_ll"
```

### Suggestions

``` r
## basic example code
adres <- nl_suggest("Dam, Amsterdam")
head(adres$response$docs, 2)
#>   type            weergavenaam                                   id    score
#> 1  weg          Dam, Amsterdam weg-ab6df5babb15e466f3699b5d2c22e110 9.380681
#> 2  weg Damloperspad, Amsterdam weg-c57e61425c421a206015596b41c92259 6.352306
#>   adrestype
#> 1      <NA>
#> 2      <NA>
```

### lookup

``` r
obj <- nl_lookup("weg-ab6df5babb15e466f3699b5d2c22e110")
names(obj)
#>  [1] "bron"               "woonplaatscode"     "type"              
#>  [4] "woonplaatsnaam"     "nwb_id"             "openbareruimtetype"
#>  [7] "gemeentecode"       "rdf_seealso"        "weergavenaam"      
#> [10] "straatnaam_verkort" "id"                 "gemeentenaam"      
#> [13] "identificatie"      "openbareruimte_id"  "provinciecode"     
#> [16] "provincienaam"      "centroide_ll"       "provincieafkorting"
#> [19] "centroide_rd"       "straatnaam"
```
