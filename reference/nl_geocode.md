# Geocode adresses

`nl_geocode` returns for a vector of addresses the most probable
object/location. This function is more user friendly than the barebones
webservices
([`nl_free()`](https://urosconf.github.io/nlgeocoder/reference/nl_free.md)),
and uses the same function signature as `ggmap::geocode`.

## Usage

``` r
nl_geocode(
  location,
  output = c("wgs84", "rd", "data.frame"),
  messaging = FALSE,
  type = "adres",
  ...,
  verbose = messaging
)

nl_geocode_rd(
  location,
  messaging = FALSE,
  type = "adres",
  ...,
  verbose = messaging
)

nl_geocode_df(
  location,
  messaging = FALSE,
  type = "adres",
  ...,
  verbose = messaging
)
```

## Arguments

- location:

  string with location to be found

- output:

  Should the output be a
  [`data.frame()`](https://rdrr.io/r/base/data.frame.html) or
  [`sf::sf()`](https://r-spatial.github.io/sf/reference/sf.html) object
  in wgs84 or Rijksdriehoekstelsel format?

- messaging:

  Print the urls fired to the webserver (consistent with
  `ggmap::geocode`)

- type:

  restrict the type of object that is returned from the service, see
  details for possible types.

- ...:

  will be passed to
  [`nl_free()`](https://urosconf.github.io/nlgeocoder/reference/nl_free.md).

- verbose:

  identical to `messaging` (consistent with other nlgeoder functions)

## Value

The return type can be specified and can be of type "sf" or
"data.frame", depending on the value of `output`.

## Details

`type` can be one or more of the following: "provincie", "gemeente" ,
"woonplaats", "weg", "postcode", "adres", "perceel", "hectometerpaal",
"wijk", "buurt", "waterschapsgrens", "appartementsrecht".

## Examples

``` r
data("addresses")

r <- nl_geocode(addresses$Address)
r["weergavenaam"]
#> Simple feature collection with 5 features and 1 field
#> Geometry type: POINT
#> Dimension:     XY
#> Bounding box:  xmin: 6.563506 ymin: 53.21085 xmax: 6.57079 ymax: 53.21978
#> Geodetic CRS:  WGS 84
#>                          weergavenaam              centroide_ll
#> 1  Martinikerkhof 3, 9712JG Groningen POINT (6.568567 53.21927)
#> 2 Sint Jansstraat 4, 9712JN Groningen  POINT (6.57079 53.21978)
#> 3    Museumeiland 1, 9711ME Groningen POINT (6.566075 53.21247)
#> 4   Stationsplein 4, 9726AE Groningen POINT (6.563506 53.21085)
#> 5      Hereplein 73, 9711GD Groningen POINT (6.569384 53.21396)
names(r)
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
#> [31] "score"                  "centroide_ll"          
```
