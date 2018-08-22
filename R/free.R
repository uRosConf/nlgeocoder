#' Free search
#'
#' Free search
#' @export
nl_free <- function(q, ...){
  l <- list(...)
  params <- as_params(q = q, .list = l)
  q_url <- paste0(file.path(API, "free"), "?", params)
  if (verbose){
    message(q_url)
  }
  jsonlite::read_json(q_url, simplifyVector = TRUE)
}
