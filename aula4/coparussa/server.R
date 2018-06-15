#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  gs_auth()
  
  
  planilha <- gs_title("Curso ESACS (respostas)")
  
  autoInvalidate <- reactiveTimer(20000)
  
  tabela <- reactive({
    autoInvalidate()
    gs_read(planilha)
  })
  
  
  output$resultado <- renderDT({
    autoInvalidate()
    datatable(tabela())
  })
  
  output$nuvem <- renderPlot({
    wordcloud(Corpus(VectorSource(tabela()[,3])))
  })
  
  output$value1 <- renderValueBox({
    valueBox(
      formatC(nrow(tabela()), format="d", big.mark=',')
      ,paste('Top Account:',sales.account$Account)
      ,icon = icon("stats",lib='glyphicon')
      ,color = "purple")  
  })
  output$value2 <- renderValueBox({ 
    valueBox(
      formatC(100, format="d", big.mark=',')
      ,'Total Expected Revenue'
      ,icon = icon("gbp",lib='glyphicon')
      ,color = "green")  
  })
  output$value3 <- renderValueBox({
    valueBox(
      formatC(200, format="d", big.mark=',')
      ,paste('Top Product:',prof.prod$Product)
      ,icon = icon("menu-hamburger",lib='glyphicon')
      ,color = "yellow")   
  })
  
  output$torcida <- renderPlot({
    torce <- ifelse(tabela()[[2]] == "Sim",1,0)
    registro <- as.POSIXct(tabela()[[1]], format = "%d/%m/%Y %H:%M:%S")
    acumulada <- cumsum(torce)
    contagem <- cumsum(rep(1,length(torce)))
    plot(registro,acumulada/contagem,type="l", xlab = "Horario", ylab = "Taxa de confiança dos torcedores")
  })
  
  output$regressao <- renderPlot({
    mod <- lm(tabela()[[4]] ~ tabela()[[5]])
    plot(tabela()[[5]],tabela()[[4]],col=ifelse(tabela()[[6]] == "Masculino","blue","pink"),
         xlab = "Tempo de voo", ylab = "Número de Brasileiros")
    abline(mod$coefficients)
  })
  
  
  
})
