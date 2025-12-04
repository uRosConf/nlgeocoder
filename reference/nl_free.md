# Free geocoding search

This function wraps the "free" pdok service, and allows for free search.
For syntax and examples see the documentation of pdok. A more
easy/convenient but simpler function for geocoding is
[`nl_geocode()`](https://urosconf.github.io/nlgeocoder/reference/nl_geocode.md).

## Usage

``` r
nl_free(
  q,
  rows = NULL,
  start = NULL,
  fq = NULL,
  lat = NULL,
  lon = NULL,
  type = NULL,
  fl = NULL,
  df = NULL,
  ...,
  verbose = FALSE
)
```

## Arguments

- q:

  query to geocoding service.

- rows:

  maximum number of rows to be returned. Default is 10.

- start:

  start index.Default is 0.

- fq:

  apply a filter to the query, e.g. fq=bron:BAG. The default filter is
  'type:(municipality OR town OR neiborhood OR road OR postcode OR
  adress)'. Use fq=\* to remove the default filter.

- lat:

  enter a decimal degree (latitude, in WGS84). Together with lon this
  will define a point to search from. Search results will be ordered by
  distance from this point. For example: 'lat=52.09&lon=5.12'

- lon:

  enter a decimal degree (longitude, in WGS84). Together with lat this
  will define point to search from. Search results will be ordered by
  distance from this point. For example: 'lat=52.09&lon=5.12'

- type:

  restrict the results on a specific type.

- fl:

  fields to return.

- df:

  field that should be search in.

- ...:

  parameters passed to the pdok webservice

- verbose:

  `logical` should the function print out messages.

## Value

The result of the pdok free webservice converted to a R list object.

## See also

[`nl_geocode()`](https://urosconf.github.io/nlgeocoder/reference/nl_geocode.md)

## Examples

``` r
l <- nl_free("Henri Faasdreef 312")
l$response$numFound
#> [1] 9197
l$response$docs["weergavenaam"]
#>                                  weergavenaam
#> 1   Henri Faasdreef 312, 2492JP 's-Gravenhage
#> 2              Henri Faasdreef, 's-Gravenhage
#> 3       Henri Faasdreef, 2492JP 's-Gravenhage
#> 4         Henri Faasdreef 194T, 's-Gravenhage
#> 5  Henri Faasdreef 200A, 2492JP 's-Gravenhage
#> 6  Henri Faasdreef 222A, 2492JP 's-Gravenhage
#> 7    Henri Faasdreef 46, 2492JP 's-Gravenhage
#> 8    Henri Faasdreef 48, 2492JP 's-Gravenhage
#> 9    Henri Faasdreef 50, 2492JP 's-Gravenhage
#> 10   Henri Faasdreef 52, 2492JP 's-Gravenhage
```
