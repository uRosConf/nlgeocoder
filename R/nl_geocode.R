#' geocode function
#'
#' Which is more user friendly than the barebones webservices,
#' uses the same function signature as ggmap geocode.
#'
#' type can be one of the following:"provincie", "gemeente", "woonplaats",
#' weg;postcode;adres;perceel;hectometerpaal;wijk;buurt;waterschapsgrens;appartementsrecht.
#' The return type can be specified.
#' @export
#' @param location string with location to be found
#' @param output How should the
#' @param type retrict the type of object that is returned from the service.
#' @param ... will be passed to \code{\link{nl_free}}.
#' @inheritParams query
nl_geocode <- function( location
                      , output = c("latlon", "rd", "data.frame")
                      #, source = c("google", "dsk") not needed
                      , messaging = FALSE
                      #, force = ifelse(source == "dsk", FALSE, TRUE), sensor = FALSE, override_limit = FALSE
                      #, client = ""
                      #, signature = ""
                      #, nameType = c("long", "short")
                      #, data
                      , type = "adres"
                      , ...
                      , verbose = !messaging
                      ){
  df <- lapply(location, function(loc){
    res <- nl_free(q = loc, type = type, ..., verbose = verbose)
    # TODO check if the docs is available
    res$response$docs[1,]
  })
  df
}

my_bindrows <- function(x){
  y <- jsonlite::toJSON(x, dataframe = "rows")
  jsonlite::fromJSON(y, simplifyDataFrame = T, flatten = TRUE)
}




# if (requireNamespace("sf")){
#   sf::sf.colors(10)
# } else {
#   stop("For returning sf object, the package sf is needed.")
# }
