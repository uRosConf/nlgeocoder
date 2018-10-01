#' Look up a geo object
#'
#' Retrieve detailed properties of a geo object found with \code{\link{nl_suggest}} or
#' \code{\link{nl_free}}.
#' @export
#' @param id of object found in nl_suggest or nl_free
#' @param ... extra parameters are passed to the lookup service of pdok.
#' @param output What type of output should be returned
#' @param verbose should the function print message while retrieving the data?
#' @inheritParams query
#' @return Depending on the value of \code{output} the raw search
#' results in R format or the properties of the specific object as
#' a R list object.
#' @example ./examples/nl_lookup.R
nl_lookup <- function(id,..., output=c("list", "raw"), verbose = FALSE){
  if (length(id) > 1){
    warning("Only using the first id")
    id <- id[1]
  }
  output <- match.arg(output)
  raw <- (output == "raw")

  l <- list(...)
  params <- as_params(id = id, .list = l)
  q_url <- paste0(file.path(API, "lookup"), "?", params)
  if (verbose){
    message(q_url)
  }
  res_lookup <- jsonlite::read_json(q_url)

  # if raw is used, the re
  if (raw){
    return(res_lookup)
  }

  if (res_lookup$response$numFound){
    res <- res_lookup$response$docs[[1]]
    res
  } else {
    NULL
  }
}
