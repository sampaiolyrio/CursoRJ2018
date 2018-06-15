#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

camaroes <- read.table("https://raw.githubusercontent.com/cursoRunb/CursoRJ2018/master/dados/dadoscamarao.txt",
                       dec=",",
                       head=TRUE)


# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  
  
    
    
    
  
  output$graf <- renderPlot({
    if(input$radio == "A"){
      camaroes_mini <- camaroes
    }else{
      
        camaroes_mini <- camaroes[camaroes$Sexo == input$radio,]
      
      
      #camaroes_mini <- ifelse(input$radio == "M", camaroes[camaroes$Sexo == "M",],camaroes[camaroes$Sexo == "F",])
    }
    #browser()
    plot(camaroes_mini$Ct,camaroes_mini$Peso, col = ifelse(camaroes_mini$Sexo == "M",input$cormacho,input$corfemea) )
  })
  output$sumario <- renderPrint({
    if(input$radio == "A"){
      camaroes_mini <- camaroes
    }else{
      
      camaroes_mini <- camaroes[camaroes$Sexo == input$radio,]
      
      
      #camaroes_mini <- ifelse(input$radio == "M", camaroes[camaroes$Sexo == "M",],camaroes[camaroes$Sexo == "F",])
    }
    summary(camaroes_mini)})
})
