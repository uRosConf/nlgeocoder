# Geocode Dutch addresses

`nl_geocode` provides a quick and easy way to geocode labels of
locations in The Netherlands. It will return points or centroids with
metadata, but no polylines or polygons. `nl_geocode` uses the pdok
webservice for geo location and is designed to be similar to ggmap: for
each (address) label the most probable location (i.e. according to the
pdok service) will be returned.

## Geocode addresses

By default, `nl_geocode` will search for addresses.

``` r
library(nlgeocoder)

res <- nl_geocode("Martinikerkhof 3 Groningen")
print(res["weergavenaam"])
  Simple feature collection with 1 feature and 1 field
  Geometry type: POINT
  Dimension:     XY
  Bounding box:  xmin: 6.568567 ymin: 53.21927 xmax: 6.568567 ymax: 53.21927
  Geodetic CRS:  WGS 84
                          weergavenaam              centroide_ll
  1 Martinikerkhof 3, 9712JG Groningen POINT (6.568567 53.21927)
```

For addresses a lot of information is available:

``` r
colnames(res)
   [1] "bron"                   "woonplaatscode"         "type"                  
   [4] "woonplaatsnaam"         "wijkcode"               "huis_nlt"              
   [7] "openbareruimtetype"     "buurtnaam"              "gemeentecode"          
  [10] "rdf_seealso"            "weergavenaam"           "straatnaam_verkort"    
  [13] "id"                     "gekoppeld_perceel"      "gemeentenaam"          
  [16] "buurtcode"              "wijknaam"               "identificatie"         
  [19] "openbareruimte_id"      "waterschapsnaam"        "provinciecode"         
  [22] "postcode"               "provincienaam"          "nummeraanduiding_id"   
  [25] "waterschapscode"        "adresseerbaarobject_id" "huisnummer"            
  [28] "provincieafkorting"     "centroide_rd"           "straatnaam"            
  [31] "score"                  "centroide_ll"
```

You can also search for multiple addresses at once.

``` r
locations <- c("Martinikerkhof 3", "st jansstr 4 groningen", "9726AE 4", "9711 ME 1")
res <- nl_geocode(locations)
data.frame(query = locations, result = res$weergavenaam)
                     query                              result
  1       Martinikerkhof 3  Martinikerkhof 3, 9712JG Groningen
  2 st jansstr 4 groningen Sint Jansstraat 4, 9712JN Groningen
  3               9726AE 4   Stationsplein 4, 9726AE Groningen
  4              9711 ME 1    Museumeiland 1, 9711ME Groningen
```

As you can see, the address doesn’t need to be an exact match.
Uppercases are ignored.

## Search for different type of locations

Besides addresses, you can also search for places, municipalities,
provinces, roads and many more. See the [LocatieServer API
documentation](https://github.com/PDOK/locatieserver/wiki/API-Locatieserver)
complete list of types you can choose from.

You can restrict the output of `nl_geocode` to municipalities only:

``` r
res <- nl_geocode("Groningen", type = "gemeente") 
res[c("weergavenaam","type")] 
  Simple feature collection with 1 feature and 2 fields
  Geometry type: POINT
  Dimension:     XY
  Bounding box:  xmin: 6.620635 ymin: 53.21859 xmax: 6.620635 ymax: 53.21859
  Geodetic CRS:  WGS 84
          weergavenaam     type              centroide_ll
  1 Gemeente Groningen gemeente POINT (6.620635 53.21859)
```

You can also restrict the output to places:

``` r
res <- nl_geocode("Groningen", type = "woonplaats") 
res$weergavenaam
  [1] "Groningen, Groningen, Groningen"
res$type
  [1] "woonplaats"
```

If you are only interested in results in a particular area (for instance
a province or municipality) you can use the `fq` parameter.

``` r
res <- nl_geocode("Hoofdstraat", fq = "provincienaam:Groningen") 
res$weergavenaam
  [1] "Hoofdstraat, Beerta"
res$provincienaam
  [1] "Groningen"
```

## Return coordinates in a spatial dataframe with CRS WGS84 or RD_New

By default, `nl_geocode` will return a `sf` object with coordinates in
the coordinate reference system WGS84 (EPSG:4326).

``` r
res <- nl_geocode("Martinikerkhof 3 Groningen") 
st_crs(res)["epsg"]
  $<NA>
  NULL
```

It also possible to specify that the coordinates should be in RD_New
(EPSG:28992), the Dutch coordinate reference system.

``` r
res <- nl_geocode("Martinikerkhof 3 Groningen", output = "rd") 
st_crs(res)["epsg"]
  $<NA>
  NULL
```

You can also use the `nl_geocode_rd` function instead:

``` r
res <- nl_geocode_rd("Martinikerkhof 3 Groningen") 
st_crs(res)["epsg"]
  $<NA>
  NULL
```

## Return coordinates in a dataframe

You can use the parameter `output` to indicate that you only want the
labels, and not the geometry.

``` r
res <- nl_geocode("Martinikerkhof 3 Groningen", output = "data.frame") 
class(res)
  [1] "data.frame"
```

## Plot the output on a map

Plotting the output on a map, because by default `nl_geocode` returns an
`sf` object.

``` r
data("addresses")
```

| POI              | Address                    |
|:-----------------|:---------------------------|
| Martinitoren     | Martinikerkhof 3 Groningen |
| Provinciehuis    | st. jansstr 4 groningen    |
| Groninger Museum | 9711 ME 1                  |
| Centraal Station | 9726 AE 4                  |
| Groninger Forum  | Hereplein 73 Groningen     |

``` r
library(leaflet)
poi_geocoded <- nl_geocode(addresses$Address)

leaflet(width = "100%", height=600) %>% 
  addPdokTiles("gray") %>% 
  addCircleMarkers( data = poi_geocoded
                  , popup = paste("<b>",addresses$POI, "</b><br/>", poi_geocoded$weergavenaam)
                  )
```
