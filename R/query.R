#' Dummy function only used for describing common api parameters
#' @keywords internal
#' @param rows maximum number of rows to be returned. Default is 10.
#' @param start start index.Default is 0.
#' @param wt output format. Possible values are json and xml. Default is json.
#' @param indent return JSON in pretty print (true) or not (false). Default is true.
#' @param fq apply a filter to the query, e.g. fq=bron:BAG. The default filter is 'type:(municipality OR town OR neiborhood OR postcode OR adress)'. Use fq=* to remove the default filter.
#' @param lat enter a decimal degree (latitude, in WGS84). Together with lon this will define a point to search from. Search results will be ordered by distance from this point. For example: 'lat=52.09&lon=5.12'
#' @param lon enter a decimal degree (longitude, in WGS84). Together with lat this will define  point to search from. Search results will be ordered by distance from this point. For example: 'lat=52.09&lon=5.12'
query <- function( rows    = NULL
                 , start   = NULL
                 , fq      = NULL
                 , lat     = NULL
                 , lon     = NULL
                 , indent  = NULL  # value can be FALSE or TRUE
                 , wt      = "json"
){
  stop("Dummy function, only used for documenting its arguments")
}
