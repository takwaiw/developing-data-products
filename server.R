library(shiny)

calculateBmiInStandards <- function(feet, inches, pounds)
{
    # BMI calculations using standards.
    heightInInchesSquared <- (feet * 12 + inches)^2
    weightToHeightRatio <- pounds / heightInInchesSquared
    
    # Round off the results to one decimal place 
    # to match the chart on the main panel 
    round(weightToHeightRatio * 703, 1)
}

calculateBmiInMetric <- function(cm, kg)
{
    # BMI calculation using metric.
    heightInMetersSquared <- (cm / 100)^2

    # Round off the results to one decimal place 
    # to match the chart on the main panel
    round(kg / heightInMetersSquared, 1)
}

# Define the server logic to calculate BMI
shinyServer(function(input, output) {
   
        output$bmi <- reactive({
            if (input$tabsetPanel == "standard")
            {
                calculateBmiInStandards(input$height_feet, input$height_inches, input$weight_pounds)
            }
            else
            {
                calculateBmiInMetric(input$height_cm, input$weight_kg)
            }
        })
})