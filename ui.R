#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel(paste("Top Predictors for mpg in MTCARS Dataset")),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            sliderInput("num",
                        "Choose number of top predictors:",
                        min = 1,
                        max = 10,
                        value = 2),
            submitButton("Submit")
        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("vplot"),
            fluidRow(column(10,tableOutput('pvals')))
        )
    )
))
