library(shiny)

library(readxl)
library(ggplot2)
library(scales)
library(ggmap)
library(mapdata)
library(maps)

df <- read_excel('station_91_2017-08-15.xlsx')

chicago <- get_map(location = c(lon = mean(df$to_long), 
                                lat = mean(df$to_lat)),
                   zoom = 13, 
                   source = 'stamen',
                   maptype = 'toner-lines')

shinyServer(function(input, output) {

  output$tripMap <- renderPlot({
    
    df91 <- subset(df, hour == input$hour)
    
    ggmap(chicago) + 
      # all trips plotted for context
      geom_point(data=df,
                   aes(x=to_long, y=to_lat),
                   color="#00CC00",
                  size = 1) +
      # trips for a selected hour during the day
      geom_point(data=df91, 
                   aes(x=to_long, y=to_lat, size=trips), 
                   shape=19, 
                   color="#FF0000",
                 size = df91$trips*3) +
        # Station 91 glyph on map
        annotate("point", 
               x=-87.64117,
               y=41.88338, 
               shape=23,
               size=5,
               fill='#FFFF00') +
      theme_nothing() 
    })
})