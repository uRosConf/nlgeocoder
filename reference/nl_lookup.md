# Look up a geo object

Retrieve detailed properties of a geo object found with
[`nl_suggest()`](https://urosconf.github.io/nlgeocoder/reference/nl_suggest.md)
or
[`nl_free()`](https://urosconf.github.io/nlgeocoder/reference/nl_free.md).

## Usage

``` r
nl_lookup(id, ..., output = c("list", "raw"), verbose = FALSE)
```

## Arguments

- id:

  of object found in nl_suggest or nl_free

- ...:

  extra parameters are passed to the lookup service of pdok.

- output:

  What type of output should be returned

- verbose:

  should the function print message while retrieving the data?

## Value

Depending on the value of `output` the raw search results in R format or
the properties of the specific object as a R list object.

## Examples

``` r
obj <- nl_lookup("weg-f633e85f07eda4e68a00fb13f9d128f5")
names(obj)
#>  [1] "bron"               "woonplaatscode"     "type"              
#>  [4] "woonplaatsnaam"     "nwb_id"             "openbareruimtetype"
#>  [7] "gemeentecode"       "rdf_seealso"        "weergavenaam"      
#> [10] "straatnaam_verkort" "id"                 "gemeentenaam"      
#> [13] "identificatie"      "openbareruimte_id"  "provinciecode"     
#> [16] "provincienaam"      "centroide_ll"       "provincieafkorting"
#> [19] "centroide_rd"       "straatnaam"        
obj$weergavenaam
#> [1] "Henri Faasdreef, 's-Gravenhage"
```
