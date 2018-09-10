# starts the shiny app in nlgeocoder_gui
run_gui <- function(){
  appDir <- system.file("nlgeocoder_gui", package="nlgeocoder")
  shiny::runApp(appDir)
}
