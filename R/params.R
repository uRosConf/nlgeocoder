as_params <- function(..., .list = NULL){
  if (is.null(.list)){
    .list <- list(...)
  }

  keys <- names(.list)
  keys <- sapply(keys, utils::URLencode, USE.NAMES = FALSE)

  values <- as.character(unname(.list))
  values <- sapply(values, utils::URLencode, USE.NAMES = FALSE)
  paste0(keys,"=",values, collapse = "&")
}
