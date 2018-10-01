#' Get a list of suggestions for geolocations in NL
#'
#' \code{nl_suggest} returns a list of suggestions for a location description.
#'
#' \code{type} can be one or more of the following: "provincie", "gemeente"
#' , "woonplaats", "weg", "postcode", "adres", "perceel", "hectometerpaal",
#' "wijk", "buurt", "waterschapsgrens", "appartementsrecht".
#' @param q search terms that should be geolocated
#' @param ... parameters passed to geolocation service
#' @param type restrict type of geolocation to
#' @inheritParams query
#' @param verbose Should the functions print messages on what it is retrieving.
#' @param fl the columns that should be returned (aka select on columms of result)
#' @param sort how the data should be sorted
#' @param qf the fields that should be queried
#' @param bq the boosting of the query.
#' @export
#' @return The result of the pdok suggest webservice converted to a R list object.
#' @example ./examples/nl_suggest.R
nl_suggest <- function( q
                      , ...
                      , rows    = NULL
                      , type    = NULL
                      , verbose = FALSE
                      , fl      = NULL
                      , sort    = NULL
                      , qf      = NULL
                      , bq      = NULL
                      ){
  l <- list(...)
  l <- type_filter(l, type)
  params <- as_params(q = q, .list = l, fl = fl, sort = sort, rows=rows, type = type, qf = qf, bq = bq)
  q_url <- paste0(file.path(API, "suggest"), "?", params)
  if (verbose){
    message(q_url)
  }
  jsonlite::read_json(q_url, simplifyVector = TRUE)
}
