#' Get a list of suggestion for geolocations in NL
#'
#' @param q search terms that should be geolocated
#' @param ... parameters passed to geolocation service
#' @param type restrict type of geolocation to
#' @export
nl_suggest <- function(q, ..., type = NULL, verbose = TRUE){
  l <- list(...)
  l <- type_filter(l, type)
  params <- as_params(q = q, .list = l)
  q_url <- paste0(file.path(URL, "suggest"), "?", params)
  if (verbose){
    message(q_url)
  }
  jsonlite::read_json(q_url, simplifyVector = TRUE)
}

