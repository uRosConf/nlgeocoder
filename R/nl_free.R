#' Free geocoding search
#'
#' This function wraps the pdok service, and allows for free search. For syntax and examples
#' see the documentation of pdok. A more easy/convenient but simpler function for geocoding is
#' \code{\link{nl_geocode}}.
#' @export
#' @param q query to geocoding service.
#' @param ... parameters passed to the pdok webservice
#' @param type restrict the results on a specific type.
#' @param fl fields to return.
#' @param df field that should be search in.
#' @param verbose \code{logical} should the function print out messages.
#' @inheritParams query
#' @seealso \code{\link{nl_geocode}}
#' @example ./examples/nl_free.R
nl_free <- function( q
                   , rows    = NULL
                   , start   = NULL
                   , fq      = NULL
                   , lat     = NULL
                   , lon     = NULL
                   , type    = NULL
                   , fl      = NULL
                   , df      = NULL
                   , ...
                   , verbose = FALSE
                   ){
  l <- list(...)
  # if (!is.null(fq)){
  #     fq[which(fq == "municipality")] <- "gemeente"
  #     fq[which(fq == "town")] <- "woonplaats"
  #     fq[which(fq == "neighborhood")] <- "buurtnaam"
  #     fq[which(fq == "road")] <- "weg"
  #     fq[which(fq == "adress")] <- "adres"
  # }

  if (length(fl)){
    fl <- paste0(fl, collapse = ",")
  }

  l <- type_filter(l, type)
  params <- as_params(q = q, .list = l, start = start, fq = fq, df = df, fl = fl, lat = lat, lon = lon, rows=rows)
  q_url <- paste0(file.path(API, "free"), "?", params)
  if (verbose){
    message(q_url)
  }
  jsonlite::read_json(q_url, simplifyVector = TRUE)
}
