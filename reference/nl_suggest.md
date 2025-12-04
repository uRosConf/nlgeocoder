# Get a list of suggestions for geolocations in NL

`nl_suggest` returns a list of suggestions for a location description.

## Usage

``` r
nl_suggest(
  q,
  ...,
  rows = NULL,
  type = NULL,
  verbose = FALSE,
  fl = NULL,
  sort = NULL,
  qf = NULL,
  bq = NULL
)
```

## Arguments

- q:

  search terms that should be geolocated

- ...:

  parameters passed to geolocation service

- rows:

  maximum number of rows to be returned. Default is 10.

- type:

  restrict type of geolocation to a type (see details for possible
  types)

- verbose:

  Should the functions print messages on what it is retrieving.

- fl:

  the columns that should be returned (aka select on columms of result)

- sort:

  how the data should be sorted

- qf:

  the fields that should be queried

- bq:

  the boosting of the query.

## Value

The result of the pdok suggest webservice converted to a R list object.

## Details

`type` can be one or more of the following: "provincie", "gemeente" ,
"woonplaats", "weg", "postcode", "adres", "perceel", "hectometerpaal",
"wijk", "buurt", "waterschapsgrens", "appartementsrecht".

## Examples

``` r
sug <- nl_suggest("Henri Faasdreef")

# how many objects have a score?
sug$response$numFound
#> [1] 83

# get suggestions
sug$response$docs
#>     type                               weergavenaam
#> 1    weg             Henri Faasdreef, 's-Gravenhage
#> 2  adres        Henri Faasdreef 194T, 's-Gravenhage
#> 3  adres Henri Faasdreef 200A, 2492JP 's-Gravenhage
#> 4  adres Henri Faasdreef 222A, 2492JP 's-Gravenhage
#> 5  adres   Henri Faasdreef 46, 2492JP 's-Gravenhage
#> 6  adres   Henri Faasdreef 48, 2492JP 's-Gravenhage
#> 7  adres   Henri Faasdreef 50, 2492JP 's-Gravenhage
#> 8  adres   Henri Faasdreef 52, 2492JP 's-Gravenhage
#> 9  adres   Henri Faasdreef 54, 2492JP 's-Gravenhage
#> 10 adres   Henri Faasdreef 56, 2492JP 's-Gravenhage
#>                                      id     score  adrestype
#> 1  weg-f633e85f07eda4e68a00fb13f9d128f5 13.016963       <NA>
#> 2  adr-1d3163476d43616d78b557e3677772b4  9.380773 hoofdadres
#> 3  adr-a54cd6b2f28d51ed4a846b18a277574e  8.227918 hoofdadres
#> 4  adr-f91cc969743132a5bef901e9652aa665  8.227918 hoofdadres
#> 5  adr-f153b063bda514bdfbd1f1aa30195dda  8.164828 hoofdadres
#> 6  adr-a918509f36018befde09ecf3289b585b  8.164828 hoofdadres
#> 7  adr-29ce30ea148498820add258ab527809a  8.164828 hoofdadres
#> 8  adr-b6abc14b0cfe9d98d375da89ac73fca7  8.164828 hoofdadres
#> 9  adr-b528df1688412211f0e1bb903fc3f4f0  8.164828 hoofdadres
#> 10 adr-5d62d284842ccb673a92aef8d9971e04  8.164828 hoofdadres
```
