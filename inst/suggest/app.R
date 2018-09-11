library(shiny)
library(nlgeocoder)
library(leaflet)
library(sf)

ui <- fluidPage(
    # Application title
    titlePanel("uRos conference"),

    sidebarLayout(
        sidebarPanel(
            selectizeInput("adres", choices=""
                          , label = "Address:"
                          , options = list(
  labelField = "weergavenaam",
#  searchField = "weergavenaam",
  valueField= "weergavenaam",
  placeholder = "Type an address",
  maxOptions = 10,
  create = TRUE,
  render = I("{option: function(item, escape){
    return '<div>' + escape(item.weergavenaam) + ' (<em>' + escape(item.type) + '</em>) </div>';
  }}"),
  score = I("function(){return function(item){return item.score/100;}}"),
  load = I("function(query, callback) {
      if (!query.length) return callback();
      $.ajax({
        url: 'https://geodata.nationaalgeoregister.nl/locatieserver/v3/suggest?fq=type:adres&q=' + encodeURIComponent(query),
        type: 'GET',
        error: function() {
          callback();
        },
        success: function(res) {
          var docs = res.response.docs.slice(0,10);
          console.log(docs);
          callback(docs);
        }
      });}")
        )
                          )
        ),

        # Show a plot of the generated distribution
        mainPanel(
           leafletOutput("locations", height = 600)
        )
    )
)

server <- function(input, output, session) {
    points <- reactive({
        nl_geocode(input$adres)
    })

    output$locations <- renderLeaflet({
        mapview::mapview(points())@map
    })
}

# Run the application
shinyApp(ui = ui, server = server)

