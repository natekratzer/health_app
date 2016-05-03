library(shiny)
shinyUI(fluidPage(
  titlePanel("Explore Health Inequality Data"),p("An online data visualization tool from The Greater Louisville Project. Visit us at http://greaterlouisvilleproject.com/"),
  
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
      
      selectInput("var1_order","Variable 1 Order:", choices = c("Ascending", "Descending"),
                  selected="Descending"),
      
      selectInput("var2_order","Variable 2 Order:", choices = c("Ascending", "Descending"),
                  selected="Ascending"),
      
      selectInput("peer_list","Peer City List:", choices=c("Current", "Baseline"),
                  selected= "Current"),
      
      p("Data is from the Health Inequality Project. St. Louis is a population-weighted average of St. Louis County and St. Louis CityMore information can be found at https://healthinequality.org/")
      
    
    ),
    
    mainPanel(
      tabsetPanel(type="tabs",
                  tabPanel("Scatterplot", plotOutput("plot1"), 
                  textOutput("text1")),
                  tabPanel("Variable 1 Rankings", plotOutput("plot2"),
                           p("Cities are sorted into green, yellow, and red using natural breaks to group cities together on similar levels, such that green represents a group of cities that are above average, yellow a group clustering around average, and red those substantially below average.")),
                  tabPanel("Variable 2 Rankings", plotOutput("plot3"),
                           p("Cities are sorted into green, yellow, and red using natural breaks to group cities together on similar levels, such that green represents a group of cities that are above average, yellow a group clustering around average, and red those substantially below average."))
      )
  )
)))