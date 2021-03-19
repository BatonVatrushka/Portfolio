library(shiny)
library(ggplot2)
library(tidyverse)
library(RPostgres)
library(shinythemes)
library(treemap)
library(RColorBrewer)
library(scales)
library(maps)
library(ggmap)
#--------------------------------------------------------------------------------------
# UI CODE
#--------------------------------------------------------------------------------------

# Define UI for Anomaly Bot applicatoin
ui <- fluidPage( theme = shinytheme("darkly"),
                 
                 # Application title
                 titlePanel("Anomaly Chatbot Reports"),
                 
                 sidebarPanel(
                   selectInput("chatbot", "Choose a Chatbot", choices = unique(bot_table$botname)),
                   dateRangeInput("dates", "Choose a date range:",
                                  start = min(reports$created_date), 
                                  end = max(reports$created_date))
                 ), 
                 
                 mainPanel(
                   tabsetPanel(
                     tabPanel("Kyiv Map", plotOutput("map"), plotOutput("density"))
                     , tabPanel("Histogram", plotOutput("bargraph"))
                     , tabPanel("Column Graph", plotOutput('column'))
                     , tabPanel("World Wide Map", plotOutput('world'))
                   )
                 )
                 
                 
                 
                 
)
#--------------------------------------------------------------------------------------
# SERVER CODE
#--------------------------------------------------------------------------------------

# Define server logic required to draw a histogram
server <- function(input, output) {
  
  # plot the point map
  output$map = renderPlot({
    get_map(location = c(30.542721, 50.447731), zoom = 10, maptype = "toner") %>% ggmap() + 
      geom_point(aes(longitude,latitude, color = name)
                 , data = kyiv_points %>% filter(name == input$chatbot
                                                 , created_date >= input$dates[1]
                                                 , created_date <= input$dates[2])
                 , size = 2
                 , col = 'red') +
      scale_fill_hue(l=0) + 
      theme(axis.text.x = element_blank()
            , axis.text.y = element_blank()
            , axis.line = element_blank()) +
      xlab(element_blank()) +
      ylab(element_blank()) +
      ggtitle("Chatbot Report Locations in Kyiv")
  })
  
  # Plot the histogram
  output$bargraph = renderPlot({
    reports %>% filter(
      botname == input$chatbot 
      , created_date >= input$dates[1]
      , created_date <= input$dates[2]
    ) %>%
      ggplot(aes(created_date)) +
      geom_histogram(binwidth = 5) +
      scale_x_date(date_breaks = '1 month',
                   labels = date_format("%m-%d-%y"), 
                   limits = c(input$dates[1], input$dates[2])) +
      theme_minimal() + xlab(element_blank()) + ylab(element_blank()) +
      ggtitle(paste("Number of Reports for:", input$chatbot)
              , subtitle = paste("from:", input$dates[1], 'to', input$dates[2]))
    
  })
  
  
  # Plot the column graph
  output$column = renderPlot({
    ggplot(bot_table) + aes(botname, num_of_reports) + geom_col() + 
      theme(legend.position = 'false') + ylab("Number of Reports") + xlab("") +
      ggtitle("Total Number of Reports per Chatbot" 
              ,paste("Data Current as of:", max(bot_table$latest_report))) +
      theme_minimal()
    
  })
  
  # plot the density map
  output$density = renderPlot({
    get_map(location = c(30.542721, 50.447731), zoom = 10, maptype = "toner"
            , color = 'bw', darken = .7) %>% ggmap() +
      # set the parameters for the density in the plot
      stat_density2d(
        aes(longitude, latitude, fill = ..level..)
        , data = kyiv_points %>% filter(name == input$chatbot
                                        , created_date >= input$dates[1]
                                        , created_date <= input$dates[2])
        , geom = 'polygon'
        , alpha = .3
        , color = NA) +
      # change the colors
      scale_fill_gradient2("Chatbot Report Density"
                           , low = 'yellow'
                           , mid = 'orange'
                           , high = 'red') +
      # get ride of the lat/long nums
      theme(axis.text.x = element_blank()
            , axis.text.y = element_blank()
            , axis.line = element_blank()
            , legend.position = 'none') +
      # add title
      ggtitle("Chatbot Reporting Density in Kyiv") +
      xlab(element_blank()) +
      ylab(element_blank())
  })
  
  # WORLD WIDE
  output$world = renderPlot({
    map('world', fill = T, col = 'white', bg = 'lightblue', ylim = c(-60, 90),
        mar = c(0,0,0,0))
    points(geo$longitude, geo$latitude, col = 'red', pch = 16, cex = .65)
  })
  
  
}

# Run the application 
shinyApp(ui = ui, server = server)
