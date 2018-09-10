as_params <- function(..., .list = NULL){
  .list <- as.list(.list)
  l <- list(...)

  # trick to remove NULL entries
  for (n in names(l)){
    l[[n]] <- l[[n]]
  }

  .list[names(l)] <- l
  keys <- names(.list)
  keys <- sapply(keys, utils::URLencode, USE.NAMES = FALSE)
  values <- enc2utf8(as.character(unname(.list)))
  values <- sapply(values, utils::URLencode, USE.NAMES = FALSE)
  paste0(keys,"=",values, collapse = "&")
}
