
library(shiny)
library(leaflet)
library(data.table)

r_colors <- rgb(t(col2rgb(colors()) / 255))
names(r_colors) <- colors()



coordinates <- function(values, fq){
  if (any(fq == "any field")) fq <- NULL
  calcs <- nl_free(q = values, fq = fq)
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

      navbarPage(
        tabsetPanel(
        tabPanel("Map",

      # Output: HTML table with requested number of observations ----

      leafletOutput("mymap", height = "400")),

      tabPanel("Data.table",
      tableOutput('table')
      ))
      )
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
      addTiles(urlTemplate = "//geodata.nationaalgeoregister.nl/tiles/service/wmts/brtachtergrondkaart/EPSG:3857/{z}/{x}/{y}.png",
               attribution = "PDOK", layerId = NULL, group = "background map",
               options = tileOptions()) %>%
      addTiles(urlTemplate = "//geodata.nationaalgeoregister.nl/tiles/service/wmts/brtachtergrondkaartgrijs/EPSG:3857/{z}/{x}/{y}.png",
               attribution = "PDOK", layerId = NULL, group = "gray map",
               options = tileOptions()) %>%
      addTiles(urlTemplate = "//geodata.nationaalgeoregister.nl/tiles/service/wmts/brtachtergrondkaartpastel/EPSG:3857/{z}/{x}/{y}.png",
               attribution = "PDOK", layerId = NULL, group = "pastel map",
               options = tileOptions()) %>%
      addTiles(urlTemplate = "//geodata.nationaalgeoregister.nl/luchtfoto/rgb/wmts/Actueel_ortho25/EPSG:3857/{z}/{x}/{y}.jpeg",
               attribution = "<a href='https://www.pdok.nl/'>PDOK</a>", layerId = NULL, group = "aerial photo",
               options = tileOptions()) %>%
      addLayersControl(
        baseGroups = c("background map","gray map","pastel map","aerial photo"),
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
