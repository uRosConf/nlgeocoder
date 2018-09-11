#' Get a list of suggestions for geolocations in NL
#'
#' @param q search terms that should be geolocated
#' @param ... parameters passed to geolocation service
#' @param type restrict type of geolocation to
#' @inheritParams query
#' @param verbose Should the functions print messages on what it is retrieving.
#' @param fl the columns that should be returned (aka select on columms of result)
#' @param sort how the data should be sorted
#' @param qf the fields that should be queried
#' @param bf the boosting of the fields.
#' @export
nl_suggest <- function( q
                      , ...
                      , rows    = NULL
                      , type    = NULL
                      , verbose = TRUE
                      , fl      = NULL
                      , sort    = NULL
                      , qf      = NULL
                      , bq      = NULL
                      ){
  l <- list(...)
  l$rows = rows
  l$type = type
  l <- type_filter(l, type)
  params <- as_params(q = q, .list = l, fl = fl, sort = sort, rows=rows, qf = qf, bq = bq)
  q_url <- paste0(file.path(API, "suggest"), "?", params)
  if (verbose){
    message(q_url)
  }
  jsonlite::read_json(q_url, simplifyVector = TRUE)
}
