# Call helper functions

# Libraries
library(DT)

# Home (Leaderboard page) module server function
homeServer <- function(input, output, session) {
  
  output$distPlot <- renderPlot({
    # generate bins based on input$bins from ui.R
    x    <- faithful[, 2]
    bins <- 50 #seq(min(x), max(x), length.out = input$bins + 1)
    
    # draw the histogram with the specified number of bins
    hist(x, breaks = bins, col = 'darkgray', border = 'white')
    })
  
  output$dataTable = DT::renderDataTable({
    
  })
}