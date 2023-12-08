
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#


library(shiny)
library(leaflet)
library(RColorBrewer)
library(here)
library(tidyverse)
library(lubridate)
library(dplyr)
library(ggplot2)
library(sf)
library(shiny)
library(leaflet)
library(RColorBrewer)



ui <- fluidPage(
  leafletOutput("map"),
  absolutePanel(bottom = 10, left = 10,
                selectInput("regions", label = "Select region to visualize", choices = unique(joined_data_renamed$Regions), selected = "Northeast"),
                selectInput("filter", 
                            label = "Select way to filter",
                            choices = c("Mgmt_Plan", "Level.of.Protection"))
                
                
  )
)




server <- function(input, output, session) {
  
  
  observe({
    
    regionSelection =  input$regions 
    filterSelection = input$filter
    
    m <- mapview(filter(joined_data_renamed, Regions == regionSelection), zcol = filterSelection)
    output$map <- renderLeaflet({
      m@map
    })
  })
  
}

shinyApp(ui, server)










ui <- bootstrapPage(
  tags$style(type = "text/css", "html, body {width:100%;height:100%}"),
  leafletOutput("map", width = "100%", height = "100%"),
  absolutePanel(top = 10, right = 10,
  selectInput("states", "Select state to visualize", joined_data$State),
  selectInput("chooseFill", 
              label = "Choose data to fill on",
              choices = c("Management Plan", "Level of Protection",
                          selected = "Management Plan"))
  )
)


server <- function(input, output, session) {
  
    
    filteredData <- reactive({
      joined_data[joined_data$State == input$states,]
    })
    
#    observe({
#    if(input$chooseFill == "Managment Plan"){
#      colorpal <- colorFactor(filteredData()$Mgmt_plan)
#    } else if (input$chooseFill == "Level of Protection"){
#      colorpal <- colorFactor(filteredData()$Level.of.Protection)
#    }
#    })
    

    
    output$map <- renderLeaflet({
      leaflet() %>% addTiles()
    })
    
    
    
    observe({
      
      if(input$chooseFill == "Managment Plan"){
        pal <- colorFactor(topo.colors(n_distinct(filteredData()$Mgmt_Plan)), filteredData()$Mgmt_Plan)
        
        leafletProxy("map", data = filteredData()) %>% 
          clearShapes() %>% 
          addPolygons(
            fillColor = ~pal(filteredData()$Mgmt_Plan))
        
      } else if (input$chooseFill == "Level of Protection"){
        pal <- colorFactor(topo.colors(n_distinct(filteredData()$Level.of.Protection)),filteredData()$Level.of.Protection)
        
        leafletProxy("map", data = filteredData()) %>% 
          clearShapes() %>% 
          addPolygons(
            fillColor = ~pal(filteredData()$Level.of.Protection))
        
      } else{
        pal <- colorFactor(topo.colors(n_distinct(filteredData()$Level.of.Protection)), filteredData()$Level.of.Protection)
        
        leafletProxy("map", data = filteredData()) %>% 
          clearShapes() %>% 
          addPolygons(
            fillColor = ~pal(filteredData()$Level.of.Protection))
        
        
      }
      
      
      #leafletProxy("map", data = filteredData()) %>% 
      #  clearShapes() %>% 
     #   addPolygons(
     #     fillColor = ~pal(filteredData()$Level.of.Protection))
    })
    
}

shinyApp(ui, server)
