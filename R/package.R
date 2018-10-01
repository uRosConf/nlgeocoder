API <- "https://geodata.nationaalgeoregister.nl/locatieserver/v3"

#' nlgeocoder package
#'
#' The nlgeocoder package provides a R wrapper around the pdok webservice.
#'
#' it allows to geocode data using the following functions:
#'
#' \itemize{
#'   \item \code{\link{nl_geocode}}: geocode a vector of addresses.
#'   \item \code{\link{nl_free}}: find possible matches for one address.
#'   \item \code{\link{nl_suggest}}: find possible suggestions for one address.
#'   \item \code{\link{nl_lookup}}: lookup information of object found in
#'   \code{nl_suggest}.
#' }
#'
#'
#' @docType package
"_PACKAGE"


#' Several Points of Interest (POI) that are included for test purposes.
#'
#' \itemize{
#'   \item \code{POI}, points of interest
#'   \item \code{Address}, Uncleaned address information.
#' }
"addresses"
