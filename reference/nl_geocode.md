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
r <- nl_geocode(addresses$Address, output = "data.frame")
r["weergavenaam"]
#>                          weergavenaam
#> 1  Martinikerkhof 3, 9712JG Groningen
#> 2 Sint Jansstraat 4, 9712JN Groningen
#> 3    Museumeiland 1, 9711ME Groningen
#> 4   Stationsplein 4, 9726AE Groningen
#> 5      Hereplein 73, 9711GD Groningen
names(r)
#>  [1] "bron"                   "woonplaatscode"         "type"                  
#>  [4] "woonplaatsnaam"         "wijkcode"               "huis_nlt"              
#>  [7] "openbareruimtetype"     "buurtnaam"              "gemeentecode"          
#> [10] "rdf_seealso"            "weergavenaam"           "straatnaam_verkort"    
#> [13] "id"                     "gekoppeld_perceel"      "gemeentenaam"          
#> [16] "buurtcode"              "wijknaam"               "identificatie"         
#> [19] "openbareruimte_id"      "waterschapsnaam"        "provinciecode"         
#> [22] "postcode"               "provincienaam"          "centroide_ll"          
#> [25] "nummeraanduiding_id"    "waterschapscode"        "adresseerbaarobject_id"
#> [28] "huisnummer"             "provincieafkorting"     "centroide_rd"          
#> [31] "straatnaam"             "score"                 

# or if you have sf installed
if (requireNamespace("sf", quietly = TRUE)){
  r_sf <- nl_geocode(addresses$Address, output = "wgs84")
  print(r_sf)
}
#> Simple feature collection with 5 features and 31 fields
#> Geometry type: POINT
#> Dimension:     XY
#> Bounding box:  xmin: 6.563506 ymin: 53.21085 xmax: 6.57079 ymax: 53.21978
#> Geodetic CRS:  WGS 84
#>   bron woonplaatscode  type woonplaatsnaam wijkcode huis_nlt openbareruimtetype
#> 1  BAG           1070 adres      Groningen WK001400        3                Weg
#> 2  BAG           1070 adres      Groningen WK001400        4                Weg
#> 3  BAG           1070 adres      Groningen WK001400        1            Terrein
#> 4  BAG           1070 adres      Groningen WK001400        4                Weg
#> 5  BAG           1070 adres      Groningen WK001400       73                Weg
#>          buurtnaam gemeentecode
#> 1 Binnenstad-Noord         0014
#> 2 Binnenstad-Noord         0014
#> 3  Binnenstad-Zuid         0014
#> 4   Stationsgebied         0014
#> 5  Binnenstad-Zuid         0014
#>                                                                         rdf_seealso
#> 1 http://bag.basisregistraties.overheid.nl/bag/id/nummeraanduiding/0014200010875280
#> 2 http://bag.basisregistraties.overheid.nl/bag/id/nummeraanduiding/0014200010876294
#> 3 http://bag.basisregistraties.overheid.nl/bag/id/nummeraanduiding/0014200010874379
#> 4 http://bag.basisregistraties.overheid.nl/bag/id/nummeraanduiding/0014200022192119
#> 5 http://bag.basisregistraties.overheid.nl/bag/id/nummeraanduiding/0014200010875730
#>                          weergavenaam straatnaam_verkort
#> 1  Martinikerkhof 3, 9712JG Groningen     Martinikerkhof
#> 2 Sint Jansstraat 4, 9712JN Groningen       Sint Jansstr
#> 3    Museumeiland 1, 9711ME Groningen       Museumeiland
#> 4   Stationsplein 4, 9726AE Groningen        Stationspln
#> 5      Hereplein 73, 9711GD Groningen            Herepln
#>                                     id gekoppeld_perceel gemeentenaam
#> 1 adr-93da60c34b4a807de3e8c9aa24f32caf      GNG00-G-7027    Groningen
#> 2 adr-ddd2067f9f58de177db654e421cee64c      GNG00-G-6650    Groningen
#> 3 adr-94d3ee58c729b959d2c03aec6bd634ff      GNG00-I-4700    Groningen
#> 4 adr-992595b6e3782b5dde204cf42df9f775     GNG00-C-12634    Groningen
#> 5 adr-487a5b565f812215d60142ee3d6912fa              NULL    Groningen
#>    buurtcode wijknaam                     identificatie openbareruimte_id
#> 1 BU00140000  Centrum 0014010011064644-0014200010875280  0014300010785543
#> 2 BU00140000  Centrum 0014010011068697-0014200010876294  0014300010785900
#> 3 BU00140001  Centrum 0014010011066455-0014200010874379  0014300010785599
#> 4 BU00140008  Centrum 0014010022191371-0014200022192119  0014300010785952
#> 5 BU00140001  Centrum 0014010011068152-0014200010875730  0014300010785210
#>            waterschapsnaam provinciecode postcode provincienaam
#> 1 Waterschap Hunze en Aa's          PV20   9712JG     Groningen
#> 2 Waterschap Hunze en Aa's          PV20   9712JN     Groningen
#> 3 Waterschap Hunze en Aa's          PV20   9711ME     Groningen
#> 4 Waterschap Hunze en Aa's          PV20   9726AE     Groningen
#> 5 Waterschap Hunze en Aa's          PV20   9711GD     Groningen
#>   nummeraanduiding_id waterschapscode adresseerbaarobject_id huisnummer
#> 1    0014200010875280              33       0014010011064644          3
#> 2    0014200010876294              33       0014010011068697          4
#> 3    0014200010874379              33       0014010011066455          1
#> 4    0014200022192119              33       0014010022191371          4
#> 5    0014200010875730              33       0014010011068152         73
#>   provincieafkorting                 centroide_rd      straatnaam   score
#> 1                 GR POINT(233908.029 582053.016)  Martinikerkhof 15.9020
#> 2                 GR POINT(234055.579 582111.908) Sint Jansstraat 13.4316
#> 3                 GR POINT(233753.948 581294.228)    Museumeiland 11.3217
#> 4                 GR POINT(233585.306 581110.904)   Stationsplein 11.4506
#> 5                 GR POINT(233972.276 581462.946)       Hereplein 16.7290
#>                centroide_ll
#> 1 POINT (6.568567 53.21927)
#> 2  POINT (6.57079 53.21978)
#> 3 POINT (6.566075 53.21247)
#> 4 POINT (6.563506 53.21085)
#> 5 POINT (6.569384 53.21396)
```
