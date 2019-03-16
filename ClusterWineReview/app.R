#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library("shiny")
library("ggplot2")
library("fpc")
library('RFLPtools')
library("leaflet")

hcl_data = read.csv('./hcl_data.csv', header = TRUE)
div_data = read.csv('./div_data.csv', header = TRUE)


# Define UI for application that draws a histogram
ui <- fluidPage(

fluidRow(
  column(6,
         h3("PAM Method"),         
         img(src="./1pie_points_4 2.png", height = 350, width = 400)
  )
  ,
  column(6,
         h3("PAM Method"),         
         img(src="./2pie_country_4.png", height = 350, width = 400)
  )
)
,  
  
fluidRow(
  column(6,
         h3("PAM Method"),         
         img(src="./3pie_points_4.png", height = 350, width = 400)
  )
  ,
  column(6,
         h3("PAM Method"),         
         img(src="./4pie_price_4.png", height = 350, width = 400)
  )
)
,  

fluidRow(
  column(6,
         h3("PAM Method"),         
         img(src="./5pie_country_6.png", height = 350, width = 400)
  )
  ,
  column(6,
         h3("PAM Method"),         
         img(src="./6pie_country_6 2.png", height = 350, width = 400)
  )
)
, 


fluidRow(
  column(6,
         h3("PAM Method"),         
         img(src="./7pie_points_6.png", height = 350, width = 400)
  )
  ,
  column(6,
         h3("PAM Method"),         
         img(src="./8pie_price_6.png", height = 350, width = 400)
  )
)
, 

fluidRow(
  column(6,
         h3("Hierarchical Clustering Ward Method"),         
         img(src="./plot_after_cut-1.png", height = 350, width = 400)
  )
  ,
  column(6,
         h3("Hierarchical Clustering Divisive Method"),           
         img(src="./gower-3.png", height = 350, width = 400)
  )
)
,

  fluidRow(
    column(6,
           h3("Hierarchical Clustering Ward Method County by Points"),
           plotOutput("agnes_country_points")
            ),
    column(6,
           h3("Hierarchical Clustering Divisive Method Country by Points"),
           plotOutput("divisive_country_points")
    )
  )
  
  
,
  
  fluidRow(
    column(6,
           h3("Hierarchical Clustering Ward Method Country by Price"),
           plotOutput("agnes_country_price")
    ),
    column(6,
           h3("Hierarchical Clustering Divisive Method Country by Price"),
           plotOutput("divisive_country_price")
    )
  )
  
 
,

fluidRow(
  column(6,
         h3("Hierarchical Clustering Ward Method Variety by Points"),
         plotOutput("agnes_variety_points")
  ),
  column(6,
         h3("Hierarchical Clustering Divisive Method Variety by Points"),
         plotOutput("divisive_variety_points")
  )
)
,

fluidRow(
  column(6,
         h3("Hierarchical Clustering Ward Method Variety by Price"),
         plotOutput("agnes_variety_price")
  ),
  column(6,
         h3("Hierarchical Clustering Divisive Method Variety by Price"),
         plotOutput("divisive_variety_price")
  )
)

 
  
  )
# Define server logic required to draw a histogram
server <- function(input, output) {
  
  # Agnes Country Points
  output$agnes_country_points <- renderPlot({
    p <- ggplot(hcl_data, aes(country, points, color = factor(cluster))) + 
      geom_boxplot() 
    print(p)
  })

  # Agnes Country Price
  output$agnes_country_price <- renderPlot({
    p <- ggplot(hcl_data, aes(country, price, color = factor(cluster))) + 
      geom_boxplot() 
    print(p)
  })  
  
  
  #Devisive Country Points
  output$divisive_country_points <- renderPlot({
    p <- ggplot(div_data, aes(country, points, color = factor(cluster))) + 
      geom_boxplot() 
    print(p)
  })

  #Devisive Country Price
  output$divisive_country_price <- renderPlot({
    p <- ggplot(div_data, aes(country, price, color = factor(cluster))) + 
      geom_boxplot() 
    print(p)
  })
  
  # Agnes Variety 
  output$agnes_variety_points <- renderPlot({
    p <- ggplot(hcl_data, aes(variety, points, color = factor(cluster))) + 
      geom_boxplot() 
    print(p)
  })
  
  # Agnes variety price
  output$agnes_variety_price <- renderPlot({
    p <- ggplot(hcl_data, aes(variety, price, color = factor(cluster))) + 
      geom_boxplot() 
    print(p)
  })  
  
  
  #Devisive variety points
  output$divisive_variety_points <- renderPlot({
    p <- ggplot(div_data, aes(variety, points, color = factor(cluster))) + 
      geom_boxplot() 
    print(p)
  })
  
  #Devisive variety price
  output$divisive_variety_price <- renderPlot({
    p <- ggplot(div_data, aes(variety, price, color = factor(cluster))) + 
      geom_boxplot() 
    print(p)
  })

  
  
}  


# Run the application 
shinyApp(ui = ui, server = server)

