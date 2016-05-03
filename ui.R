library(shiny)
shinyUI(fluidPage(
  img(src = "GLP_logo.png", align= "right"),
  titlePanel("Health Inequality Explorer"),
  p("An online data visualization tool from the", a("Greater Louisville Project", href="http://greaterlouisvilleproject.com/", target="_blank")),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Select Two Variables to Compare"),
      
      selectInput("var1", "Variable 1:",choices = 
                    c("Female Life Expectancy, Low Income",
                      "Male Life Expectancy, Low Income",
                      "Smoking, Low Income",
                      "Obesity Rate, Low Income",
                      "Exercise in last 30 days, Low Income"), 
                  selected="Male Life Expectancy, Low Income"),
      
      selectInput("var2", "Variable 2:", choices = 
                    c("Female Life Expectancy, Low Income",
                      "Male Life Expectancy, Low Income",
                      "Smoking, Low Income",
                      "Obesity Rate, Low Income",
                      "Exercise in last 30 days, Low Income"),
                  selected="Smoking, Low Income"),
      
      selectInput("peer_list","Peer City List:", choices=c("Current", "Baseline"),
                  selected= "Current"),
      
      p("Data is from the", a("Health Inequality Project.", href="https://healthinequality.org/"), "St. Louis is a population-weighted average of St. Louis County and St. Louis City.")
      
    
    ),
    
    mainPanel(  
      tabsetPanel(type="tabs",
                  tabPanel("Variable 1 Rankings", 
                           h3(textOutput("textvar1"),align="center"),
                           plotOutput("plot2"),
                           textOutput("text2"),
                           p(""),
                           p("Cities are sorted into green, yellow, and red using natural breaks to group cities together on similar levels, such that green represents a group of cities that are above average, yellow a group clustering around average, and red those substantially below average.")),
                  tabPanel("Variable 2 Rankings", 
                           h3(textOutput("textvar2"),align="center"),
                           plotOutput("plot3"),
                           textOutput("text3"),
                           p(""),
                           p("Cities are sorted into green, yellow, and red using natural breaks to group cities together on similar levels, such that green represents a group of cities that are above average, yellow a group clustering around average, and red those substantially below average.")),
                  tabPanel("Scatterplot", 
                           h3("Plot and Regression Line", align="center"),
                           plotOutput("plot1"), 
                           textOutput("text1"))
      )
  )
)))