
<!-- README.md is generated from README.Rmd. Please edit that file -->

[![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/nllocation)](https://cran.r-project.org/package=nllocation)
[![travis
build](https://travis-ci.org/edwindj/nllocation.svg?branch=master)](https://travis-ci.org/edwindj/nllocation)

# nlgeocoder

## Installation

You can install nlgeocoder from github with:

``` r
# install.packages("devtools")
devtools::install_github("uRos2018/nlgeocoder")
```

## Example

``` r
## basic example code
library(nlgeocoder)
adres <- nl_suggest("Dam, Amsterdam")
#> https://geodata.nationaalgeoregister.nl/locatieserver/v3/suggest?q=Dam,%20Amsterdam
adres$response$docs
#>     type                          weergavenaam
#> 1    weg                        Dam, Amsterdam
#> 2    weg               Damloperspad, Amsterdam
#> 3    weg                     Damrak, Amsterdam
#> 4    weg                Damraksteeg, Amsterdam
#> 5    weg                  Damstraat, Amsterdam
#> 6    weg      Van Bommel-Van Dampad, Amsterdam
#> 7    weg A.DAM-TUINDORP-OOSTZAAN 18, Amsterdam
#> 8  adres               Dam 1, 1012JS Amsterdam
#> 9  adres               Dam 2, 1012NP Amsterdam
#> 10 adres               Dam 3, 1012JS Amsterdam
#>                                      id    score
#> 1  weg-ab6df5babb15e466f3699b5d2c22e110 21.70456
#> 2  weg-c57e61425c421a206015596b41c92259 14.84300
#> 3  weg-81c29298a0fcc1e5f933da43c190788a 14.84300
#> 4  weg-908372751cb39d33819744f4400da09b 14.84300
#> 5  weg-a0f50ff1c3d1d97ae4c928cdca94ded0 14.84300
#> 6  weg-4298e0302c111356578bc0daa820d82e 14.04860
#> 7  weg-f080ca30531a364d765d803019e94404 13.99955
#> 8  adr-2a8dc1af055da20b8bcdc8e4dbda1eaa 11.93003
#> 9  adr-d9cc6c8c2d7a6b6034b73bc3154fd128 11.93003
#> 10 adr-a2c3c366316e77065f51a1f15d5abbd9 11.93003
```
