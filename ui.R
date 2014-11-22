library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
    
    # Application title
    titlePanel("Body Mass Index Calculator"),
    
    # Sidebar with tabs to let user choose between "standard" or "metric" input.
    sidebarLayout(
        sidebarPanel(
             tabsetPanel(id = "tabsetPanel",
                 tabPanel("Standard", value = "standard",
                         fluidRow(
                             column(5, numericInput("height_feet", "Height (feet)", 5, min = 0, max = 9, step = 1)),
                             column(5, numericInput("height_inches", "(inches)", 5, min = 0, max = 11, step = 1))
                             ),
                         fluidRow(
                             column(8, numericInput("weight_pounds", "Weight (pounds)", 140, min = 50, max = 1300, step = 1))
                         ),
                         fluidRow(submitButton("Calculate"))
                         ),
                 tabPanel("Metric", value = "metric",
                          fluidRow(
                              column(5, numericInput("height_cm", "Height (cm)", 165, min = 80, max = 310, step = 1))
                          ),
                          fluidRow(
                              column(8, numericInput("weight_kg", "Weight (kg)", 63, min = 50, max = 1300, step = 1))
                          ),
                          fluidRow(submitButton("Calculate"))
                          )
                 )
            ),
        
        # Show the output BMI, and the chart to explain what the number means.
        mainPanel(
            h3("Your BMI is ", textOutput("bmi")), 
            p(),
            p(),
            h3("BMI Categories"),
            p("< 18 means underweight"),
            p("18.1 to 18.5 means thin for height"),
            p("18.6 to 24.9 means healthy weight"),  
            p("25 to 29.9 means overweight"),  
            p("> 30 means obesity") 
        )
    )
))