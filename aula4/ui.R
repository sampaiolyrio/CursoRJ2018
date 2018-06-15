#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinythemes)
# Define UI for application that draws a histogram
shinyUI(fluidPage(
  #themeSelector(),
  theme = shinytheme("superhero"),
  # Application title
  titlePanel("Camaroes do rio grande do norte"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       textInput("cormacho",label = "Escolha a cor dos machos",value = "blue")
    ,
    radioButtons("radio",
                 label = "Escolha o Genero",
                 choices = c("Macho" = "M",
                                "Femea" = "F",
                                "Ambos" = "A")),
    selectInput("corfemea",
                label = "Escolha a cor das femeas",
                choices = list( "pink",
                               "Roxo" = "purple",
                               "Vermelho" = "red"),
                selected = "red" )
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      tabsetPanel(
        tabPanel("Grafico",plotOutput("graf")),
        tabPanel("Sumario",verbatimTextOutput("sumario"))
      ) 
      
    )
  )
))
