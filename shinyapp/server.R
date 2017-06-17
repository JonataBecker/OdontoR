library(shiny)

source("prepara_dataset.r")
source("functions.r")


# Define server logic required to generate and plot a random distribution
shinyServer(function(input, output) {
  
   
  
  getInfo <- function() {
     info <- data.frame(
      "sexo.n" = input$sexo, 
      "idade" = input$idade, 
      "tipo.invervencao.n" = input$tipo.intervencao, 
      "novo.restauracao.n" = input$novo.restauracao, 
      "numero.dente" = input$numero.dente, 
      "tipo.dente.n" = input$tipo.dente, 
      "arcada.n" = input$arcada, 
      "lado.n" = input$lado, 
      "tipo.restauracao.n" = input$tipo.restauracao, 
      "material.restauracao.n" = input$materia.restauracao, 
      "superficie.lingual.n" = input$superficie.lingual, 
      "superficie.palatal.n" = input$superficie.palatal, 
      "superficie.vestibular.n" = input$superficie.vestibular, 
      "superficie.oclusal.n" = input$superficie.oclusal, 
      "superficie.mesial.n" = input$superficie.vestibular, 
      "superficie.distal.n" = input$superficie.distal, 
      "vitalidade.n" = input$vitalidade, 
      "classe.n" = input$classe
    )
    info
  }
  
  output$result <- renderText({
    classifica_knn(getInfo())
  })
})
