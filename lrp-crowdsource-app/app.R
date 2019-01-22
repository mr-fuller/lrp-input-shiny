#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinyBS)
library(shinyjs)
library(shinydashboard)
library(leaflet.extras)

# Define UI for application that draws a histogram
library(leaflet.extras)
library(shiny)

ui <- dashboardPage(
        dashboardHeader(titleWidth = 0),
        dashboardSidebar(
          p('Welcome to the TMACOG Survey blah blah blah. 
                          Click on the marker tool on the side of the map
            then click on the map and leave your comment.')
        ),
        dashboardBody(leafletOutput("leafmap", height = "90vh"))
  
           
          )
        

server <- function(input, output, session) {
  output$leafmap <- renderLeaflet({
    leaflet() %>%
      setView(-83.513, 41.548,10) %>%
      addProviderTiles(providers$CartoDB.Positron) %>%
      addDrawToolbar(polylineOptions = FALSE,
                     polygonOptions = FALSE,
                     circleOptions = FALSE,
                     rectangleOptions = FALSE,
                     circleMarkerOptions = FALSE,
                     editOptions = editToolbarOptions())
  })
  
  
  # Start of Drawing
  observeEvent(input$leafmap_draw_start, {
    print("Start of drawing")
    print(input$leafmap_draw_start)
  })
  
  # Stop of Drawing
  observeEvent(input$leafmap_draw_stop, {
    print("Stopped drawing")
    print(input$leafmap_draw_stop)
  })
  
  # New Feature
  observeEvent(input$leafmap_draw_new_feature, {
    print("New Feature")
    print(input$leafmap_draw_new_feature)
  })
  
  # Edited Features
  observeEvent(input$leafmap_draw_edited_features, {
    print("Edited Features")
    print(input$leafmap_draw_edited_features)
  })
  
  # Deleted features
  observeEvent(input$leafmap_draw_deleted_features, {
    print("Deleted Features")
    print(input$leafmap_draw_deleted_features)
  })
  
  # We also listen for draw_all_features which is called anytime
  # features are created/edited/deleted from the map
  observeEvent(input$leafmap_draw_all_features, {
    print("All Features")
    print(input$leafmap_draw_all_features)
  })
}

shinyApp(ui, server)
