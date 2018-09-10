#' Free geocoding search
#'
#' This function wraps the pdok service, and allows for free search.
#' @export
#' @inheritParams query
#' @param q query to geocoding service.
#' @seealso \code{\link{nl_geocode}}
nl_free <- function( q
                   , start   = NULL
                   , fq      = NULL
                   , lat     = NULL
                   , lon     = NULL
                   , ...
                   , verbose = FALSE
                   ){
  l <- list(...)
  params <- as_params(q = q, .list = l, start = start, fq = fs, lat= lat, lon = lon)
  q_url <- paste0(file.path(API, "free"), "?", params)
  if (verbose){
    message(q_url)
  }
  jsonlite::read_json(q_url, simplifyVector = TRUE)
}
