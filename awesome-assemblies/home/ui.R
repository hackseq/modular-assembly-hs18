# Libraries
library (DT)
library(ggrepel)
library(tidyverse)
library(ggplot2)

# Home Module (main Leaderboard page) UI function
homeUI <- function(id) {
  # Create a namespace function using the provided ID
  ns <- NS(id)
  
  # Define UI for application that draws a histogram
  tagList(
    # Page title
    titlePanel("Awesome Assemblies leaderboard"),
      
    # Show a plot of the generated distribution
    fluidRow(
      column(12, plotOutput(outputId = ns("dataPlot"))
    ),
    fluidRow(
      column(12, DT::dataTableOutput(outputId = ns("data")))
      )
    )
  )
}