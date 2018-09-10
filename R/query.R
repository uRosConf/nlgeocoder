#' Dummy function only used for describing common api parameters
#' @keywords internal
#' @param rows number of rows
#'
#' #' @seealso
query <- function( rows = NULL
                 , start = NULL
                 , wt
                 ){
  stop("Dummy function, only used for documenting its arguments")
}

#'
#' Optioneel: rows=<aantal>
#'
#'   Hiermee wordt opgegeven wat het maximale aantal rijen (ofwel resultaten) is dat teruggegeven moet worden op deze bevraging. De default-waarde is "10".
#'
#' Optioneel: start=<index>
#'
#'   Hiermee wordt opgegeven wat de index is van het eerste resultaat dat teruggegeven wordt. Dit is zero-based. In combinatie met de rows-parameter kunnen deze services gepagineerd worden bevraagd. De default-waarde is "0".
#'
#' Optioneel: wt=<formaat>
#'
#'   Hiermee wordt opgegeven wat het outputformaat is van de bevraging. Geldige waarden zijn "json" en "xml". De default-waarde is "json".
#'
#' Optioneel: indent=<waarde>
#'
#'   Hiermee kan worden opgegeven of de teruggegeven JSON ingesprongen (geïndenteerd) moet worden. Geldige waarden zijn "true" en "false". De default-waarde is "true".
#'
#' Optioneel: lat=<latitude>&lon=<longitude>
#'
#'   Hiermee kan een coördinaat (in lat/lon, ofwel WGS84) worden opgegeven. Met behulp van deze parameters worden de gevonden zoekresultaten gesorteerd op afstand van het meegegeven punt. Wanneer de locatie van de gebruiker bekend is, kan op deze manier effectiever worden gezocht.
#'
#' Het meegeven van een coördinaat is met name nuttig voor de suggest- en vrije geocoder-services. Hier worden meestal meerdere resultaten teruggegeven. Als decimaal scheidingsteken moet een punt worden opgegeven i.p.v. een komma.
#'
#' Voorbeeld: lat=52.09&lon=5.12
#'
#' De resultaten worden gesorteerd op afstand van een bepaald punt in het centrum van Utrecht.
#'
#' Optioneel: fq=<filter query>
#'
#'   Hiermee kan een filter query worden opgegeven, bijv. fq=bron:BAG. Met fq=* kan de default filter query worden opgeheven. De default filter is type:(gemeente OR woonplaats OR weg OR postcode OR adres)
