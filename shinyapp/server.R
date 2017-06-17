library(shiny)
library(nnet)
library(nnet)
library(rpart)
library(rpart.plot)

source("prepara_dataset.r")
source("functions.r")

# Define server logic required to generate and plot a random distribution
shinyServer(function(input, output) {

  getInfoKnn <- function() {
    print(summary(input$sexo))
    t1 <- input$sexo
    t1 <- as.factor(input$sexo)
    
    
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
  
  getInfoRpartRna <- function() {
    info <- data.frame(
      "sexo" = data$sexo[data$sexo.n == input$sexo][1], 
      "idade.ag" = idadeToAg(input$idade), 
      "classe" = data$classe[data$classe.n == input$classe & !is.na(data$classe)][1], 
      "vitalidade" = data$vitalidade[data$vitalidade.n == input$vitalidade][1], 
      "tipo.invervencao" = data$tipo.invervencao[data$tipo.invervencao.n == input$tipo.intervencao][1], 
      "novo.restauracao" = data$novo.restauracao[data$novo.restauracao.n == input$novo.restauracao][1], 
      "numero.dente" = data$numero.dente[data$numero.dente.n == input$numero.dente][1], 
      "tipo.dente" = data$tipo.dente[data$tipo.dente.n == input$tipo.dente][1], 
      "tipo.restauracao" = data$tipo.restauracao[data$tipo.restauracao.n == input$tipo.restauracao][1], 
      "superficie.lingual.fc" = data$superficie.lingual[data$superficie.lingual.n == input$superficie.lingual][1], 
      "superficie.palatal.fc" = data$superficie.palatal[data$superficie.palatal.n == input$superficie.palatal][1], 
      "superficie.vestibular.fc" = data$superficie.vestibular[data$superficie.vestibular.n == input$superficie.vestibular][1], 
      "superficie.oclusal.fc" = data$superficie.oclusal[data$superficie.oclusal.n == input$superficie.oclusal][1], 
      "superficie.mesial.fc" = data$superficie.mesial[data$superficie.mesial.n == input$superficie.mesial][1], 
      "superficie.distal.fc" = data$superficie.distal[data$superficie.distal.n == input$superficie.distal][1]
    )
    print(info)
    info
  }
  
  classifica <- function() {
    ifelse(input$metodo == "knn", classifica_knn(getInfoKnn()),
           classifica_rpart(getInfoRpartRna()))
  }
  
  output$result <- renderText({
    classifica()
  })
  
  output$algoritmoKnn <- renderTable({
    result <- test_knn("KNN", input$knn.k, as.numeric(input$knn.pct_treinamento), c("sexo.n", "idade", "tipo.invervencao.n", "novo.restauracao.n", "numero.dente", "tipo.dente.n", "arcada.n", "lado.n", "tipo.restauracao.n", "material.restauracao.n", "superficie.lingual.n", "superficie.palatal.n", "superficie.vestibular.n", "superficie.oclusal.n", "superficie.mesial.n", "superficie.distal.n", "vitalidade.n", "classe.n"), "falha", input$knn.metodo_na, input$knn.normalizar)
    data.frame("Atributo" = names(result), "Valor" = t(result) )
  })
  
  output$algoritmoRpart <- renderTable({
    result <- test_rpart("RPART", as.numeric(input$rpart.pct_treinamento), c("sexo", "idade.ag", "classe", "vitalidade", "tipo.invervencao", "novo.restauracao", "numero.dente", "tipo.dente", "tipo.restauracao", "superficie.lingual.fc", "superficie.palatal.fc", "superficie.vestibular.fc", "superficie.oclusal.fc", "superficie.mesial.fc", "superficie.distal.fc"), "falha", input$rpart.metodo_na)
    data.frame("Atributo" = names(result), "Valor" = t(result) )
  })
  
  output$algoritmoRna <- renderTable({
    result <- test_rna("RNA", as.numeric(input$rna.pct_treinamento), c("sexo", "idade.ag", "classe", "vitalidade", "tipo.invervencao", "novo.restauracao", "numero.dente", "tipo.dente", "tipo.restauracao", "superficie.lingual.fc", "superficie.palatal.fc", "superficie.vestibular.fc", "superficie.oclusal.fc", "superficie.mesial.fc", "superficie.distal.fc"), "falha.fc", input$rna.metodo_na)
    data.frame("Atributo" = names(result), "Valor" = t(result) )
  })  
})
