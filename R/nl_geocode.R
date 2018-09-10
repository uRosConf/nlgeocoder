#' geocode function
#'
#' Which is more user friendly than the barebones webservices,
#' uses the same function signature as ggmap geocode.
#'
#' The return type can be specified.
#' @export
nl_geocode <- function( location
                      , output = c("latlon", "latlona", "more", "all")
                      #, source = c("google", "dsk") not needed
                      , messaging = FALSE
                      #, force = ifelse(source == "dsk", FALSE, TRUE), sensor = FALSE, override_limit = FALSE
                      #, client = ""
                      #, signature = ""
                      #, nameType = c("long", "short")
                      #, data
                      , ...
                      , verbose = !messaging
                      ){

  res <- nl_free(q = lociation, ..., verbose = verbose)
  # TODO convert the result into a sf object.
}
