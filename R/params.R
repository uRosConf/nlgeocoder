as_params <- function(..., .list = NULL){
  .list <- as.list(.list)
  l <- list(...)
  .list[names(l)] <- l
  keys <- names(.list)
  keys <- sapply(keys, utils::URLencode, USE.NAMES = FALSE)
  values <- as.character(unname(.list))
  values <- sapply(values, utils::URLencode, USE.NAMES = FALSE)
  paste0(keys,"=",values, collapse = "&")
}
