df<-read.csv("merged health stl.csv",header=TRUE)
library(shiny)
shinyUI(fluidPage(
  titlePanel("Explore Health Inequality Data"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Select Two Variables to Compare"),
      
      selectInput("var1", "Variable 1:",choices = names(df), 
                  selected="cur_smoke_q1"),
      
      selectInput("var2", "Variable 2:", choices = names(df),
                  selected="le_agg_q1_F")
      
    
    ),
    
    mainPanel(
      tabsetPanel(type="tabs",
                  tabPanel("Scatterplot", plotOutput("plot1")),
                  tabPanel("Variable 1 Rankings", plotOutput("plot2"),
                           p("Cities are sorted into green, yellow, and red using natural breaks to group cities together on similar levels, such that green represents a group of cities that are above average, yellow a group clustering around average, and red those substantially below average.")),
                  tabPanel("Variable 2 Rankings", plotOutput("plot3"),
                           p("Cities are sorted into green, yellow, and red using natural breaks to group cities together on similar levels, such that green represents a group of cities that are above average, yellow a group clustering around average, and red those substantially below average."))
      )
  )
)))