
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
library(shiny)
library(leaflet)
library(here)
library(tidyverse)
library(lubridate)
library(dplyr)
library(sf)
library(mapview); mapviewOptions(fgb = FALSE)
sf::sf_use_s2(FALSE)


MPA.data <- read.csv(here('DataRaw/NOAA_Marine_Protected_Areas_Inventory_2023.csv'),
                     stringsAsFactors = TRUE, 
                     colClasses = c('Year.Established' = 'factor'))


MPA.data.sf <- MPA.data %>% 
  st_as_sf(coords = c("Longitude","Latitude"),
           crs = 4326)


database <- sf::st_read(here('DataRaw/NOAA_MPAI_2023.gdb')) 

database_transformed <- st_transform(database, c=4326)


df1 <- MPA.data.sf %>% 
  select(Site.ID, Level.of.Protection)

joined_data <- st_join(database_transformed, df1, by = "Site.ID")

joined_data_renamed <- joined_data %>% 
  mutate(Regions = recode(State,
                          "AK" = "Alaska",
                          "NC" = "South",
                          "ASM" = "Pacific",
                          "CT" ="Northeast",
                          "DE" = "Northeast",
                          "FL" = "South - Gulf Coast",
                          "CA" = "West",
                          "GA" = "South",
                          "US-GU" = "Guam & Northern Mariana Islands",
                          "HI" = "Pacific",
                          "IL" = "Midwest",
                          "MN" = "Midwest",
                          "US-MP" = "Guam & Northern Mariana Islands",
                          "IN" = "Midwest",
                          "LA" = "South - Gulf Coast",
                          "MA" = "Northeast",
                          "MI" = "Midwest",
                          "MS" = "South - Gulf Coast",
                          "AL, MS" = "South - Gulf Coast",
                          "NH" = "Northeast",
                          "NJ" = "Northeast",
                          "OH" = "Midwest",
                          "OR" = "West",
                          "PR" = "Caribbean",
                          "TX" = "South - Gulf Coast",
                          "VA" = "South",
                          "US-VI" = "Caribbean",
                          "WA" = "West",
                          "PRI" = "Caribbean",
                          "NY" = "Northeast",
                          "PA" = "Northeast",
                          "SC" = "South",
                          "RI" = "Northeast",
                          "ME" = "Northeast",
                          "MD" = "Northeast",
                          "WI" = "Midwest",
                          "FL, MS" = "South - Gulf Coast",
                          "VA, MD" = "South",
                          "AL" = "South - Gulf Coast",
                          "OR, WA" = "West",
                          "NC, VA" = "South",
                          "NJ, NY" = "Northeast",
                          "US-MI, CA-ON" = "Midwest",
                          "GA, SC" = "South",
                          "TX, LA" = "South - Gulf Coast"
  ))


joined_data_renamed$Regions[joined_data_renamed$OBJECTID == "650"] <- "Pacific"
joined_data_renamed$Regions[joined_data_renamed$OBJECTID == "643"] <- "Pacific"
joined_data_renamed$Regions[joined_data_renamed$OBJECTID == "625"] <- "Pacific"
joined_data_renamed$Regions[joined_data_renamed$OBJECTID == "635"] <- "Pacific"
joined_data_renamed$Regions[joined_data_renamed$OBJECTID == "641"] <- "Pacific"
joined_data_renamed$Regions[joined_data_renamed$OBJECTID == "632"] <- "Pacific"
joined_data_renamed$Regions[joined_data_renamed$OBJECTID == "631"] <- "Pacific"
joined_data_renamed$Regions[joined_data_renamed$OBJECTID == "319"] <- "Pacific"
joined_data_renamed$Regions[joined_data_renamed$OBJECTID == "324"] <- "Pacific"


joined_data_renamed$Regions[joined_data_renamed$OBJECTID == "767"] <- "Pacific"
joined_data_renamed$Regions[joined_data_renamed$OBJECTID == "765"] <- "Pacific"
joined_data_renamed$Regions[joined_data_renamed$OBJECTID == "534"] <- "Pacific"
joined_data_renamed$Regions[joined_data_renamed$OBJECTID == "764"] <- "Pacific"
joined_data_renamed$Regions[joined_data_renamed$OBJECTID == "624"] <- "Pacific"




summary(as.factor((joined_data_renamed$Regions)))
summary(as.factor(joined_data_renamed$Mgmt_Plan))
summary(as.factor(joined_data_renamed$Level.of.Protection))

south_table <- joined_data_renamed[joined_data_renamed$Regions=="South",] 
table(south_table$Mgmt_Plan)
table(south_table$Level.of.Protection)

northeast_table <- joined_data_renamed[joined_data_renamed$Regions=="Northeast",] 
table(northeast_table$Mgmt_Plan)
table(northeast_table$Level.of.Protection)

midwest_table <- joined_data_renamed[joined_data_renamed$Regions=="Midwest",] 
table(midwest_table$Mgmt_Plan)
table(midwest_table$Level.of.Protection)

west_table <- joined_data_renamed[joined_data_renamed$Regions=="West",] 
table(west_table$Mgmt_Plan)
table(west_table$Level.of.Protection)

pac_table <- joined_data_renamed[joined_data_renamed$Regions=="Pacific",] 
table(pac_table$Mgmt_Plan)
table(pac_table$Level.of.Protection)


ui <- fluidPage(
  leafletOutput("map"),
  absolutePanel(bottom = 150, left = 10,
                selectInput("regions", label = "Select region to visualize", choices = unique(joined_data_renamed$Regions), selected = "Northeast"),
                selectInput("filter", 
                            label = "Select way to filter",
                            choices = c("Mgmt_Plan", "Level.of.Protection"))
                
                
                
                
  )
)




server <- function(input, output, session) {
  options(shiny.maxRequestSize = 160*1024^2)
  observe({
    
    regionSelection =  input$regions 
    filterSelection = input$filter
    
    m <- mapview(filter(joined_data_renamed, Regions == regionSelection), zcol = filterSelection, layer.name= c(filterSelection)) 
    
    output$map <- renderLeaflet({
      m@map
    })
  })
  
}

shinyApp(ui, server)
