# Call helper functions

# Libraries
library(ggplot2)
library(DT)
library(ggrepel)
library(tidyverse)

# Home (Leaderboard page) module server function
homeServer <- function(input, output, session) {
  data <- read_tsv('spades.quast.tsv')
  # data
  
  output$dataPlot <- renderPlot ({
    ggplot(data) +
      aes(x = "# misassemblies", y = NGA50, label = Assembly) +
      geom_point() +
      geom_text_repel()
  })
}