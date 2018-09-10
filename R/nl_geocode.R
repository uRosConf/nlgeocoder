#' geocode function
#'
#' Which is more user friendly than the barebones webservices,
#' uses the same function signature as ggmap geocode.
#'
#' The return type can be specified.
#' @export
nl_geocode <- function( location
                      , output = c("latlon", "latlona", "rd", "rda", "all")
                      #, source = c("google", "dsk") not needed
                      , messaging = FALSE
                      #, force = ifelse(source == "dsk", FALSE, TRUE), sensor = FALSE, override_limit = FALSE
                      #, client = ""
                      #, signature = ""
                      #, nameType = c("long", "short")
                      #, data
                      , type = NULL
                      , ...
                      , verbose = !messaging
                      ){

  res <- nl_free(q = location, type = type, ..., verbose = verbose)
  # TODO convert the result into a sf object.
  res
}
