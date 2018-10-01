#' Geocode adresses
#'
#' \code{nl_geocode} return for vector of addresses
#' the most probable object/location.
#' This function is more user friendly than the barebones webservices
#' (\code{\link{nl_free}}), and uses the same function signature as
#' \code{ggmap::geocode}.
#'
#' \code{type} can be one or more of the following: "provincie", "gemeente"
#' , "woonplaats", "weg", "postcode", "adres", "perceel", "hectometerpaal",
#' "wijk", "buurt", "waterschapsgrens", "appartementsrecht".
#'
#' @return The return type can be specified and can be of type "sf" or "data.frame",
#' depending on the value of \code{output}.
#' @export
#' @param location string with location to be found
#' @param output Should the output be a \code{\link{data.frame}} or
#'  \code{\link[sf]{sf}} object in wgs84 or Rijksdriehoekstelsel format?
#' @param type restrict the type of object that is returned from the service,
#' see details for possible types.
#' @param ... will be passed to \code{\link{nl_free}}.
#' @param messaging Print the urls fired to the webserver (consistent with `ggmap::geocode`)
#' @param verbose identical to \code{messaging} (consistent with other nlgeoder
#' functions)
#' @inheritParams query
#' @example ./examples/nl_geocode.R
nl_geocode <- function( location
                      , output = c("wgs84", "rd", "data.frame")
                      #, source = c("google", "dsk") not needed
                      , messaging = FALSE
                      #, force = ifelse(source == "dsk", FALSE, TRUE), sensor = FALSE, override_limit = FALSE
                      #, client = ""
                      #, signature = ""
                      #, nameType = c("long", "short")
                      #, data
                      , type = "adres"
                      , ...
                      , verbose = messaging
                      ){
  location <- as.character(location) # to prevent that a factor will become an integer
  df <- lapply(as.character(location), function(loc){
    #browser()
    res <- nl_free(q = loc, type = type, ..., rows = 1, verbose = verbose)
    # TODO check if the docs is available
    if (res$response$numFound){
      res$response$docs[1,]
    }
  })
  df <- bind_rows(.list = df)
  output = match.arg(output)
  if (output == "data.frame"){
    return(df)
  }

  if (requireNamespace("sf", quietly = TRUE)){
    wkt <-
      switch( output
            , rd = "centroide_rd"
            , "centroide_ll"
            )
    crs <- switch(output, rd = 28992, 4326)
    sf::st_as_sf(df, wkt = wkt, crs = crs)
  } else {
    stop("You'll need package 'sf'.")
  }
}

#' @rdname nl_geocode
#' @export
nl_geocode_rd <- function( location
                        , messaging = FALSE
                        , type = "adres"
                        , ...
                        , verbose = messaging
                        ){
  nl_geocode(location, output = "rd", messaging = messaging, type= type, ..., verbose = verbose)
}

#' @rdname nl_geocode
#' @export
nl_geocode_df <- function( location
                           , messaging = FALSE
                           , type = "adres"
                           , ...
                           , verbose = messaging
){
  nl_geocode(location, output = "data.frame", messaging = messaging, type= type, ..., verbose = verbose)
}

# hack to implement bind_rows functionality (leaning on jsonlite)
bind_rows <- function(..., .list){
  x_l <- lapply(.list, as.list)
  y <- jsonlite::toJSON(x_l, auto_unbox = TRUE)
  jsonlite::fromJSON(y) # automagically knits together the lists as a data.frame.
}
