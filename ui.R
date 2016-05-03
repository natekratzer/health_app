df<-read.csv("merged health stl.csv",header=TRUE)
library(shiny)
shinyUI(fluidPage(
  titlePanel("Explore Health Inequality Data"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Select Two Variables to Compare"),
      
      selectInput("var1", "Variable 1:",choices = 
                    c("Smoking, Low Income",
                      "Obesity Rate, Low Income",
                      "Exercise in last 30 days, Low Income"), 
                  selected="Smoking, Low Income"),
      
      selectInput("var2", "Variable 2:", choices = 
                    c("Female Life Expectancy, Low Income",
                      "Male Life Expectancy, Low Income"),
                  selected="Male Life Expectancy, Low Income"),
      
      selectInput("var1_order","Variable 1 Order:", choices = c("Ascending", "Descending"),
                  selected="Ascending"),
      
      selectInput("var2_order","Variable 2 Order:", choices = c("Ascending", "Descending"),
                  selected="Descending")
      
    
    ),
    
    mainPanel(
      tabsetPanel(type="tabs",
                  tabPanel("Scatterplot", plotOutput("plot1"), 
                  p("BIR = Birmingham, CHA = Charlotte, CIN = Cincinatti, COL = Columbus, GBR = Greensboro, GR = Grand Rapids, GVL = Greensville, IND = Indianapolis, KC = Kansas City, KNO = Knoxville, LOU = Louisville, MEM = Memphis, NAS = Nashville, OKL = Oklahoma, OMA = Omaha, STL= St. Louis, TUL = Tulsa")),
                  tabPanel("Variable 1 Rankings", plotOutput("plot2"),
                           p("Cities are sorted into green, yellow, and red using natural breaks to group cities together on similar levels, such that green represents a group of cities that are above average, yellow a group clustering around average, and red those substantially below average.")),
                  tabPanel("Variable 2 Rankings", plotOutput("plot3"),
                           p("Cities are sorted into green, yellow, and red using natural breaks to group cities together on similar levels, such that green represents a group of cities that are above average, yellow a group clustering around average, and red those substantially below average."))
      )
  )
)))