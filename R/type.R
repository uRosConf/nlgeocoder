# the location server supports a certain number of types.

type_filter <- function(params, type = NULL){

  if (length(type) == 0){
    return(params)
  }

  if (length(type) > 1){
    type <- paste0(type, collapse = " or ")
    type <- paste0("type:(",type,")")
  } else {
    type <- paste0("type:", type)
  }
  params["fq"] <- type
  params
}

#type_filter(c("woonplaats","adres"))
