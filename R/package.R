API <- "https://api.pdok.nl/bzk/locatieserver/search/v3_1"

#' nlgeocoder package
#'
#' The nlgeocoder package provides a R wrapper around the pdok webservice.
#'
#' it allows to geocode data using the following functions:
#'
#' \itemize{
#'   \item [nl_geocode()]: geocode a vector of addresses.
#'   \item [nl_free()]: find possible matches for one address.
#'   \item [nl_suggest()]: find possible suggestions for one address.
#'   \item [nl_lookup()]: lookup information of object found in
#'   `nl_suggest`.
#' }
#'
#'
#' @docType package
"_PACKAGE"


#' Several Points of Interest (POI) that are included for test purposes.
#'
#' \itemize{
#'   \item `POI`, points of interest
#'   \item `Address`, Uncleaned address information.
#' }
"addresses"
