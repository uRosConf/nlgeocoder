
library(shiny)
library(leaflet)
library(data.table)

r_colors <- rgb(t(col2rgb(colors()) / 255))
names(r_colors) <- colors()



coordinates <- function(values, fq){
  if (!is.null(fq)){
    fq[which(fq == "municipality")] <- "gemeente"
    fq[which(fq == "town")] <- "woonplaats"
    fq[which(fq == "neighborhood")] <- "buurtnaam"
    fq[which(fq == "road")] <- "weg"
    fq[which(fq == "address")] <- "adres"
  }
  if (any(fq == "any field")) fq <- NULL
  calcs <- nl_free(q = values, type = fq, verbose = TRUE)
  if (NROW(calcs$response$docs)) {
          data_with_coord <- data.table(calcs$response$docs)
          data_with_coord[, centroide_ll := substr(centroide_ll, 7, nchar(centroide_ll) - 1)]
          data_with_coord[, tukss := unlist(gregexpr(" ", centroide_ll))]
          data_with_coord[, latitude := as.numeric(substr(centroide_ll, tukss + 1, nchar(centroide_ll)))]
          data_with_coord[, longitude := as.numeric(substr(centroide_ll, 1, tukss))]
          setnames(data_with_coord, c("bron", "weergavenaam"),
                                    c("Source","Location"))
          data_with_coord <- data_with_coord[, c("Source", "Location", "latitude", "longitude")]
          as.data.frame(data_with_coord)
       }
  else {
    NULL
  }
}

ui <- fluidPage(

  # App title ----
  titlePanel("Search PDOK interactively"),

  # Sidebar layout with a input and output definitions ----
  sidebarLayout(

    # Sidebar panel for inputs ----
    sidebarPanel(

      textInput(inputId = "vertiba",
                label = "Search query:",
                value = "7511DP"),

      selectInput(inputId = "izvele",
                  label = "Choose search field:",
                  choices = c("any field", "municipality", "town",
                              "neighborhood", "postcode", "adress"))
      # ,
      # hr(),
      # fileInput(inputId = "adressFile", "Upload file")
    ),

    # Main panel for displaying outputs ----
    mainPanel(

        tabsetPanel(
        tabPanel("Map",
                 # Output: HTML table with requested number of observations ----
        fluidRow(
          column( width=12,
            leafletOutput("mymap", height=600)))
        ),
      tabPanel("Addresses:",
      tableOutput('table')
      ))
    )
  )
)



server <- function(input, output, session) {
  points <- reactive(coordinates(input$vertiba, fq = input$izvele))
  addresslist <- reactive({

    points()[, c("Source", "Location")]
  })

  output$table <- renderTable(addresslist())

  output$mymap <- renderLeaflet({
    map <-
      leaflet() %>%
      addPdokTiles(type = "brt") %>%
      addPdokTiles(type = "gray") %>%
      addPdokTiles(type = "pastel") %>%
      addPdokTiles(type = "aerial") %>%
      addLayersControl(
        baseGroups = c("brt","gray","pastel","aerial"),
        options = layersControlOptions(position = "topleft")
      )
      if (is.null(points())){
        map
      } else {
        addMarkers(map, data = points(),  popup = ~Location)
      }
  })
  }

shinyApp(ui, server)
