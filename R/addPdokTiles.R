#' Leaflet function to add pdok tiles
#'
#' This function adds PDOK tile layers to \code{\link[leaflet]{leaflet}}.
#' It is a small wrapper around \code{\link[leaflet]{addTiles}} that sets
#' the correct urls for the layers.
#'
#' PDOK provides tiles that can be used as a tile layer in several
#' geovisualization tools including \code{leaflet}.
#' The layers differ from other tile layers such as Openstreetmap, Google and
#' cartomap in the following manner:
#' \itemize{
#'   \item The tiles are restricted to the Netherlands: tiles accross the Dutch
#'   border are "grayed out". This is useful for cartographic applications
#'   that are restricted to Dutch geo-information.
#'   \item The tiles are open source and based on open sourced geo-information.
#' }
#'
#' @param map leaflet object
#' @param type one of the PDOK tiles: currently: "brt", "aerial", "pastel" or "gray"
#' @param group group is set equal to type
#' @param options passed to \code{\link[leaflet]{addTiles}}
#' @param ... Passed to \code{\link[leaflet]{addTiles}}.
#' @export
addPdokTiles <- function(map,  type = c("brt", "aerial", "pastel", "gray"), group = match.arg(type), options, ...){
  if (requireNamespace("leaflet", quietly = TRUE)){
    urlTemplate = switch( match.arg(type)
                        , aerial = "//service.pdok.nl/hwh/luchtfotorgb/wmts/v1_0/Actueel_orthoHR/EPSG:3857/{z}/{x}/{y}.jpeg"
                        , pastel = "//service.pdok.nl/brt/achtergrondkaart/wmts/v2_0/pastel/EPSG:3857/{z}/{x}/{y}.png"
                        , gray   = "//service.pdok.nl/brt/achtergrondkaart/wmts/v2_0/grijs/EPSG:3857/{z}/{x}/{y}.png"
                        , "//service.pdok.nl/brt/achtergrondkaart/wmts/v2_0/standaard/EPSG:3857/{z}/{x}/{y}.png"
                        )

    if (missing(options)){
      options <- leaflet::tileOptions(minZoom = 6, maxZoom = 18)
    }

    leaflet::addTiles( map = map
                     , urlTemplate = urlTemplate
                     , attribution = "<a href='https://www.pdok.nl/'>PDOK</a>"
                     , group       = group
                     , options     = options
                     , ...
                     )
  } else {
    stop("Please install leaflet.")
  }
}
