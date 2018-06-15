
library(shiny)
library(shinydashboard)
library(googlesheets)
library(DT)
library(wordcloud)
library(tm)

header <- dashboardHeader(title = "Copa do Mundo Rússia 2018")  
#Sidebar content of the dashboard
sidebar <- dashboardSidebar(
  sidebarMenu(
    menuItem("Principal", tabName = "dashboard", icon = icon("dashboard")),
    menuItem("Avaliação do Curso", icon = icon("send",lib='glyphicon'), 
             href = "https://goo.gl/forms/43dZ483kGEe3w6s32")
  )
)


corpo <- dashboardBody(
  
  tabsetPanel(id = "aba",
              tabPanel("Análise de Texto",fluidRow((plotOutput("nuvem")))),
              tabPanel("Confiança da Torcida",fluidRow((plotOutput("torcida")))),
              tabPanel("Viajando para longe", fluidRow((plotOutput("regressao")))),
              tabPanel("Tabela Completa",DTOutput("resultado"))
              )
)

shinyUI(
  dashboardPage(
    header = header,
    
    sidebar = sidebar,
    
    body = corpo
                  
  
  )
)
