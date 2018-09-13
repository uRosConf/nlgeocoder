#' Leaflet function to add pdok tiles
#'
#' @param map leaflet object
#' @param type one of the PDOK tiles: currently: "brt", "aerial", "pastel" or "gray"
#' @param group group is set equal to type
#' @param ... Passed to \code{\link[leaflet]{addTiles}}.
#' @export
addPdokTiles <- function(map,  type = c("brt", "aerial", "pastel", "gray"), group = match.arg(type), ...){
  if (requireNamespace("leaflet", quietly = TRUE)){
    urlTemplate = switch( match.arg(type)
                        , aerial = "//geodata.nationaalgeoregister.nl/luchtfoto/rgb/wmts/Actueel_ortho25/EPSG:3857/{z}/{x}/{y}.jpeg"
                        , pastel = "//geodata.nationaalgeoregister.nl/tiles/service/wmts/brtachtergrondkaartpastel/EPSG:3857/{z}/{x}/{y}.png"
                        , gray   = "//geodata.nationaalgeoregister.nl/tiles/service/wmts/brtachtergrondkaartgrijs/EPSG:3857/{z}/{x}/{y}.png"
                        , "//geodata.nationaalgeoregister.nl/tiles/service/wmts/brtachtergrondkaart/EPSG:3857/{z}/{x}/{y}.png"
                        )
    leaflet::addTiles( map = map
                     , urlTemplate = urlTemplate
                     , attribution = "<a href='https://www.pdok.nl/'>PDOK</a>"
                     , group = group
                     , ...
                     )
  } else {
    stop("Please install leaflet.")
  }
}
