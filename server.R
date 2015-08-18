library(shiny)
library(ggplot2)
shinyServer(function(input, output) {
  output$Sigma <- renderText({
   paste((input$Z-input$X)/input$Y) 
  })
  
  output$Plot <- renderPlot({
    c <- data.frame(x=input$Y, y=input$X)
    d <- data.frame(x=input$Z, y=input$Z)
    ggplot(data=c,aes(x=x,y=y))+
    geom_point() +
    xlab('Observed Imprecision (%)') + ylab('Observed Inaccuracy (%)') +
    geom_line(data=d, aes(x=c(x/2,0), y=c(0,y)), color = 'RED') +
    geom_line(data=d, aes(x=c(x/3,0), y=c(0,y)), color = 'ORANGE') +
    geom_line(data=d, aes(x=c(x/4,0), y=c(0,y)), color = 'YELLOW') +
    geom_line(data=d, aes(x=c(x/5,0), y=c(0,y)), color = 'BLUE') +
    geom_line(data=d, aes(x=c(x/6,0), y=c(0,y)), color = 'GREEN')
  })
})
