# Leaflet function to add pdok tiles

This function adds PDOK tile layers to
[`leaflet::leaflet()`](https://rstudio.github.io/leaflet/reference/leaflet.html).
It is a small wrapper around
[`leaflet::addTiles()`](https://rstudio.github.io/leaflet/reference/map-layers.html)
that sets the correct urls for the layers.

## Usage

``` r
addPdokTiles(
  map,
  type = c("brt", "aerial", "pastel", "gray"),
  group = match.arg(type),
  options,
  ...
)
```

## Arguments

- map:

  leaflet object

- type:

  one of the PDOK tiles: currently: "brt", "aerial", "pastel" or "gray"

- group:

  group is set equal to type

- options:

  passed to
  [`leaflet::addTiles()`](https://rstudio.github.io/leaflet/reference/map-layers.html)

- ...:

  Passed to
  [`leaflet::addTiles()`](https://rstudio.github.io/leaflet/reference/map-layers.html).

## Details

PDOK provides tiles that can be used as a tile layer in several
geovisualization tools including `leaflet`. The layers differ from other
tile layers such as Openstreetmap, Google and cartomap in the following
manner:

- The tiles are restricted to the Netherlands: tiles accross the Dutch
  border are "grayed out". This is useful for cartographic applications
  that are restricted to Dutch geo-information.

- The tiles are open source and based on open sourced geo-information.
