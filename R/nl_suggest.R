#' Get a list of suggestions for geolocations in NL
#'
#' @param q search terms that should be geolocated
#' @param ... parameters passed to geolocation service
#' @param type restrict type of geolocation to
#' @inheritParams query
#' @export
nl_suggest <- function(q
                      , ...
                      , rows = NULL
                      , type = NULL
                      , verbose = TRUE
                      ){
  l <- list(...)
  l <- type_filter(l, type)
  params <- as_params(q = q, .list = l)
  q_url <- paste0(file.path(API, "suggest"), "?", params)
  if (verbose){
    message(q_url)
  }
  jsonlite::read_json(q_url, simplifyVector = TRUE)
}

#TODO currently result is simple list, should be made of type "suggestions", with
# specific methods, like print, summary
