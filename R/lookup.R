#' Look up a geo object
#'
#' Retrieve detailed properties of a geo object found with suggest or free.
#' @export
#' @param id of object found in nl_suggest or nl_free
nl_lookup <- function(id, ...){
  l <- list(...)
  params <- as_params(id = id, .list = l)
  q_url <- paste0(file.path(URL, "lookup"), "?", params)
  if (verbose){
    message(q_url)
  }
  jsonlite::read_json(q_url, simplifyVector = simplifyVector)
}
