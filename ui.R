library(shiny)

shinyUI(fluidPage(
  
  tags$head(
    tags$style(HTML("
      body {
        background-color: #9933FF;
        color: #FFFFFF
      }
    "))
  ),
  
  h2('Busiest Day for Station 91', align='center'),
  h3('Tuesday, Aug 15, 2017', align='center'),
  h5(paste('Divvy bike trips originating from the station at Clinton',
           ' St & Washington Blvd next to the Ogilve',
           ' Transportation Center.', sep="")),

  plotOutput(outputId = "tripMap", width = "100%", height = '500px'), 
  
  h5(paste('329 total trips over the course of the entire day.  ',
           'The size of the glyph indicates the number of trips ',
           'to a particular station.  All destinations for the day ',
           'appear in green.  Station 91 is the yellow diamond.', sep="")),  
  hr(),
  
  fluidRow(
      column(5,
             h4('Select an hour:'),
             sliderInput("hour",
                   "Hour:",
                    min = 0,
                    max = 23,
                    value = 6)
              )
    )
  ))