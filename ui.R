library(shiny)
library(ggplot2)
shinyUI(fluidPage(
  titlePanel("Sigma-metric Calculator"),
  sidebarLayout(
    sidebarPanel("Enter Variables",
#                 textInput('T', label=('Name of the test'), value = 'Test name'),
                 numericInput('X', label=('Bias (%)'), value=1),
                 numericInput('Y', label=('CV (%)'), value=1),
                 numericInput('Z', label=('TEa (%)'), value=5)
    ),
    mainPanel("The Sigma-metric result is:",
              textOutput('Sigma'),
              plotOutput('Plot')
    )
  )
))
