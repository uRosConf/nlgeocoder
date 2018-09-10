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

  res <- nl_free(q = location, type = type, ..., verbose = verbose)
  # TODO convert the result into a sf object.
  res
}
