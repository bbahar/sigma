library(shiny)
library(ggplot2)
shinyServer(function(input, output) {
  output$Sigma <- renderText({
   paste((input$Z-input$X)/input$Y) 
  })
  
  output$Plot <- renderPlot({
    dt1 <- data.frame(Assay=c('input$T'), CV=c(input$Y), Bias=c(input$X))
    c <- data.frame(x=c(input$Z,0), y=c(0,input$Z))
    ggplot(dt1, aes(x=CV, y=Bias)) + 
      geom_point(size=4, aes(shape=Assay)) +
      xlab('') + 
      ylab('') +
      ggtitle('') + 
      geom_line(data=c, aes(x=c(input$Z/2,0), y=c(0,input$Z)), linetype=2, color = 'RED') + 
      geom_line(data=c, aes(x=c(input$Z/3,0), y=c(0,input$Z)), linetype=2, color = 'ORANGE') +
      geom_line(data=c, aes(x=c(input$Z/4,0), y=c(0,input$Z)), linetype=2, color = 'YELLOW') +
      geom_line(data=c, aes(x=c(input$Z/5,0), y=c(0,input$Z)), linetype=2, color = 'BLUE') +
      geom_line(data=c, aes(x=c(input$Z/6,0), y=c(0,input$Z)), linetype=2, color = 'GREEN') +
#      annotate("text", x = 5, y = 13, label = "World Class") +
#      annotate("text", x = 21.5, y = 30, label = "Marginal") +
      ggtitle('Sigma-metric Performance') +
      xlab('Observed Imprecision, % CV') +
      ylab('Observed Inaccuracy, % Bias')
  })
})
