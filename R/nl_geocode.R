#' geocode function
#'
#' This function is more user friendly than the barebones webservices,
#' and uses the same function signature as ggmap::geocode.
#'
#' type can be one of the following:"provincie", "gemeente", "woonplaats",
#' weg;postcode;adres;perceel;hectometerpaal;wijk;buurt;waterschapsgrens;appartementsrecht.
#' The return type can be specified and can be of type "sf" or "data.frame".
#' @export
#' @param location string with location to be found
#' @param output How should the
#' @param type retrict the type of object that is returned from the service.
#' @param ... will be passed to \code{\link{nl_free}}.
#' @inheritParams query
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
  df <- lapply(location, function(loc){
    res <- nl_free(q = loc, type = type, ..., rows = 1, verbose = verbose)
    # TODO check if the docs is available
    res$response$docs[1,]
  })
  df <- bind_rows(.list = df)
  output = match.arg(output)
  if (output == "data.frame"){
    return(df)
  }

  if (requireNamespace("sf")){
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

bind_rows <- function(..., .list){
  x_l <- lapply(.list, as.list)
  y <- jsonlite::toJSON(x_l)
  jsonlite::fromJSON(y)
}

# if (requireNamespace("sf")){
#   sf::sf.colors(10)
# } else {
#   stop("For returning sf object, the package sf is needed.")
# }
