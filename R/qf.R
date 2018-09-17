as_qf <- function(qf = NULL){
  if (length(qf) == 0){
    return(NULL)
  }

  if (is.numeric(qf)){
    nms <- names(qf)
    paste0(nms, "^", unname(qf), collapse = " ")
  } else {
    qf = paste0(qf, collapse = " ")
    if (nchar(qf)){
      return(qf)
    }
  }
}

# as_qf()
# as_qf("")
# as_qf("woonplaats")
# as_qf(c("woonplaats" = 1.5, "huisnummer" = 1))
