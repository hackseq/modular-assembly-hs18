#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
install.packages("ggrepel")
library(ggrepel)

source ("home/ui.R")

# Define UI for application that draws a histogram
ui <- navbarPage(
  
  # Application title
  title = "AwesomeAssemblies",
  inverse = TRUE,
  tabPanel ("Leaderboard",
            homeUI("homeUI")
  )
  # add more tabs here: tabPanel ("name", UI("UI"))
)