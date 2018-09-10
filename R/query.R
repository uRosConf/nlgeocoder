#' Dummy function only used for describing common api parameters
#' @keywords internal
#' @param rows maximum number of rows that will be returned, if not specified it will be 10.
#' @param start Starting index is van het eerste resultaat dat teruggegeven wordt. Dit is
#' zero-based. In combinatie met de rows-parameter kunnen deze services gepagineerd worden bevraagd. De default-waarde is "0"
#' @param wt Hiermee wordt opgegeven wat het outputformaat is van de bevraging. Geldige waarden zijn "json" en "xml". De default-waarde is "json".
#' @param indent Hiermee kan worden opgegeven of de teruggegeven JSON ingesprongen (geïndenteerd) moet worden. Geldige waarden zijn "true" en "false". De default-waarde is "true".
#' @param fq  Hiermee kan een filter query worden opgegeven, bijv. fq=bron:BAG. Met fq=* kan de default filter query worden opgeheven. De default filter is type:(gemeente OR woonplaats OR weg OR postcode OR adres)
#' @param lat   Hiermee kan een coördinaat (in lat/lon, ofwel WGS84) worden opgegeven. Met behulp van deze parameters worden de gevonden zoekresultaten gesorteerd op afstand van het meegegeven punt. Wanneer de locatie van de gebruiker bekend is, kan op deze manier effectiever worden gezocht.
#' Het meegeven van een coördinaat is met name nuttig voor de suggest- en vrije geocoder-services. Hier worden meestal meerdere resultaten teruggegeven. Als decimaal scheidingsteken moet een punt worden opgegeven i.p.v. een komma.
#' @param lon  see lat
#'
#' @seealso
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
