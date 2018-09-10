#' Look up a geo object
#'
#' Retrieve detailed properties of a geo object found with suggest or free.
#' @export
#' @param id of object found in nl_suggest or nl_free
nl_lookup <- function(id, ..., verbose = FALSE){
  l <- list(...)
  params <- as_params(id = id, .list = l)
  q_url <- paste0(file.path(API, "lookup"), "?", params)
  if (verbose){
    message(q_url)
  }
  #TODO currently return value is too complicated: should only return the response not
  # the para/meta data of the query itself.
  jsonlite::read_json(q_url)
}
