
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyServer(function(input, output) {
  output$original <- renderPlot({
    set.seed(2718)
    data <- rlnorm(1000, meanlog=3, sdlog=0.75)
    bins <- seq(min(data), max(data), length.out = input$bins + 1)    
    hist(data, breaks = bins, col = 'darkgray', border = 'white', 
         main='Histogram of Original Data', xlab='x')    
  })
  output$normalized <- renderPlot({
    set.seed(2718)
    data <- rlnorm(1000, meanlog=3, sdlog=0.75)
    z <- (data - mean(data)) / sd(data)
    bins <- seq(min(z), max(z), length.out = input$bins + 1)    
    hist(z, breaks = bins, col = 'darkgray', border = 'white',
      main='Histogram Normalized Data', xlab='(x - mean(x)) / sd(x)')
  })
  output$lognormalized <- renderPlot({
    set.seed(2718)
    data <- rlnorm(1000, meanlog=3, sdlog=0.75)
    ldata <- log(data)
    z <- (ldata - input$lmean) / input$lsd
    bins <- seq(min(z), max(z), length.out = input$bins + 1)    
    hist(z, breaks = bins, col = 'darkgray', border = 'white',
         main='Histogram Log Normalized Data', xlab='(log(x) - mean)/sd')
  })
})
