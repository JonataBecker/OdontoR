library(shiny)
library(nnet)
library(nnet)
library(rpart)
library(rpart.plot)
library(googleVis)
library(xts)

source("prepara_dataset.r")
source("functions.r")

# Define server logic required to generate and plot a random distribution
shinyServer(function(input, output) {

  getInfoKnn <- function() {
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
      "superficie.mesial.n" = input$superficie.mesial, 
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
      "superficie.lingual.fc" = data$superficie.lingual.fc[data$superficie.lingual.n == input$superficie.lingual][1], 
      "superficie.palatal.fc" = data$superficie.palatal.fc[data$superficie.palatal.n == input$superficie.palatal][1], 
      "superficie.vestibular.fc" = data$superficie.vestibular.fc[data$superficie.vestibular.n == input$superficie.vestibular][1], 
      "superficie.oclusal.fc" = data$superficie.oclusal.fc[data$superficie.oclusal.n == input$superficie.oclusal][1], 
      "superficie.mesial.fc" = data$superficie.mesial.fc[data$superficie.mesial.n == input$superficie.mesial][1], 
      "superficie.distal.fc" = data$superficie.distal.fc[data$superficie.distal.n == input$superficie.distal][1]
    )
    info
  }
  
  classifica <- function() {
    ifelse(input$metodo == "knn", classifica_knn(getInfoKnn()),
           ifelse(input$metodo == "rpart", classifica_rpart(getInfoRpartRna()),
                  classifica_rna(getInfoRpartRna())))
  }
  
  output$result <- renderText({
    classifica()
  })
  
  output$algoritmoKnn <- renderTable({
    result <- test_knn("KNN", as.numeric(input$knn.k), as.numeric(input$knn.pct_treinamento), c("sexo.n", "idade", "tipo.invervencao.n", "novo.restauracao.n", "numero.dente", "tipo.dente.n", "arcada.n", "lado.n", "tipo.restauracao.n", "material.restauracao.n", "superficie.lingual.n", "superficie.palatal.n", "superficie.vestibular.n", "superficie.oclusal.n", "superficie.mesial.n", "superficie.distal.n", "vitalidade.n", "classe.n"), "falha", input$knn.metodo_na, input$knn.normalizar)
    data.frame("Atributo" = names(result), "Valor" = t(result) )
  })
  
  output$algoritmoRpart <- renderTable({
    result <- test_rpart("RPART", as.numeric(input$rpart.pct_treinamento), c("sexo", "idade.ag", "classe", "vitalidade", "tipo.invervencao", "novo.restauracao", "numero.dente", "tipo.dente", "tipo.restauracao", "superficie.lingual.fc", "superficie.palatal.fc", "superficie.vestibular.fc", "superficie.oclusal.fc", "superficie.mesial.fc", "superficie.distal.fc"), "falha.n", input$rpart.metodo_na)
    data.frame("Atributo" = names(result), "Valor" = t(result) )
  })
  
  output$algoritmoRna <- renderTable({
    result <- test_rna("RNA", as.numeric(input$rna.pct_treinamento), c("sexo", "idade.ag", "classe", "vitalidade", "tipo.invervencao", "novo.restauracao", "numero.dente", "tipo.dente", "tipo.restauracao", "superficie.lingual.fc", "superficie.palatal.fc", "superficie.vestibular.fc", "superficie.oclusal.fc", "superficie.mesial.fc", "superficie.distal.fc"), "falha.fc", input$rna.metodo_na)
    data.frame("Atributo" = names(result), "Valor" = t(result) )
  })  
  
  output$plot_falha <- renderPlot({
    plot_falha = as.character(data$falha.s)
    plot_falha[is.na(plot_falha)] = "N/A"
    plot(as.factor(plot_falha))
  })
  output$plot_status <- renderPlot({
    plot_status = as.character(data$status)
    plot_status[is.na(plot_status)] = "N/A"
    plot(as.factor(plot_status))
  })
  output$plot_sexo <- renderPlot({
   plot(data$sexo)
  })
  output$plot_sexo_vs_falha <- renderPlot({
   plot(data$falha.s, data$sexo)
  })
  output$plot_nascimento <- renderPlot({
    df = as.data.frame(table(data$nascimento))
    barplot(apply.yearly(zoo(df$Freq, as.Date(df$Var1)), sum))
  })
  output$plot_nascimento_vs_falha <- renderPlot({
    plot(data$falha.s, data$nascimento)
  })

  output$plot_data.intervencao <- renderPlot({
    plot(data$data.intervencao)
  })
  output$plot_data.intervencao_vs_falha <- renderPlot({
    plot(data$falha.s, data$data.intervencao)
  })

  output$plot_data.final <- renderPlot({
    plot(data$data.final)
  })
  output$plot_data.final_vs_falha <- renderPlot({
    plot(data$falha.s, data$data.final)
  })

  output$plot_idade <- renderPlot({
    plot(data$idade)
  })
  output$plot_idade_vs_falha <- renderPlot({
    plot(data$falha.s, data$idade)
  })

  output$plot_tipo.invervencao <- renderPlot({
    plot(data$tipo.invervencao)
  })
  output$plot_tipo.invervencao_vs_falha <- renderPlot({
    plot(data$falha.s, data$tipo.invervencao)
  })

  output$plot_vitalidade <- renderPlot({
    plot(data$vitalidade)
  })
  output$plot_vitalidade_vs_falha <- renderPlot({
    plot(data$falha.s, data$vitalidade)
  })

  output$plot_novo.restauracao <- renderPlot({
    plot(data$novo.restauracao)
  })
  output$plot_novo.restauracao_vs_falha <- renderPlot({
    plot(data$falha.s, data$novo.restauracao)
  })

  output$plot_motivo <- renderPlot({
    plot(data$motivo)
  })
  output$plot_motivo_vs_falha <- renderPlot({
    plot(data$falha.s, data$motivo)
  })

  output$plot_numero.dente <- renderPlot({
    plot(data$numero.dente)
  })
  output$plot_numero.dente_vs_falha <- renderPlot({
    plot(data$falha.s, data$numero.dente)
  })

  output$plot_tipo.dente <- renderPlot({
    plot(data$tipo.dente)
  })
  output$plot_tipo.dente_vs_falha <- renderPlot({
    plot(data$falha.s, data$tipo.dente)
  })

  output$plot_arcada <- renderPlot({
    plot(data$arcada)
  })
  output$plot_arcada_vs_falha <- renderPlot({
    plot(data$falha.s, data$arcada)
  })

  output$plot_lado <- renderPlot({
    plot(data$lado)
  })
  output$plot_lado_vs_falha <- renderPlot({
    plot(data$falha.s, data$lado)
  })

  output$plot_tipo.restauracao <- renderPlot({
    plot(data$tipo.restauracao)
  })
  output$plot_tipo.restauracao_vs_falha <- renderPlot({
    plot(data$falha.s, data$tipo.restauracao)
  })

  output$plot_material.restauracao <- renderPlot({
    plot(data$material.restauracao)
  })
  output$plot_material.restauracao_vs_falha <- renderPlot({
    plot(data$falha.s, data$material.restauracao)
  })

  output$plot_classe <- renderPlot({
    plot(data$classe)
  })
  output$plot_classe_vs_falha <- renderPlot({
    plot(data$falha.s, data$classe)
  })

  output$plot_superficies.restauradas <- renderPlot({
    plot(data$superficies.restauradas)
  })
  output$plot_superficies.restauradas_vs_falha <- renderPlot({
    plot(data$falha.s, data$superficies.restauradas)
  })
  output$plot_censored <- renderPlot({
    plot(data$censored)
  })
  output$plot_censored_vs_falha <- renderPlot({
    plot(data$falha.s, data$censored)
  })

  output$plot_data.falha.1 <- renderPlot({
    plot(data$data.falha.1)
  })
  output$plot_data.falha.1_vs_falha <- renderPlot({
    plot(data$falha.s, data$data.falha.1)
  })

  output$plot_data.falha.2 <- renderPlot({
    plot(data$data.falha.2)
  })
  output$plot_data.falha.2_vs_falha <- renderPlot({
    plot(data$falha.s, data$data.falha.2)
  })

  output$plot_tempo.censored <- renderPlot({
    plot(data$tempo.censored)
  })
  output$plot_tempo.censored_vs_falha <- renderPlot({
    plot(data$falha.s, data$tempo.censored)
  })

  output$plot_tempo.falha.sucesso <- renderPlot({
    plot(data$tempo.falha.sucesso)
  })
  output$plot_tempo.falha.sucesso_vs_falha <- renderPlot({
    plot(data$falha.s, data$tempo.falha.sucesso)
  })

  output$plot_tempo.falha.falha <- renderPlot({
    plot(data$tempo.falha.falha)
  })
  output$plot_tempo.falha.falha_vs_falha <- renderPlot({
    plot(data$falha.s, data$tempo.falha.falha)
  })

  output$plot_preco <- renderPlot({
    plot(data$preco)
  })
  output$plot_preco_vs_falha <- renderPlot({
    plot(data$falha.s, data$preco)
  })

  output$plot_adesivo <- renderPlot({
    plot(data$adesivo)
  })
  output$plot_adesivo_vs_falha <- renderPlot({
    plot(data$falha.s, data$adesivo)
  })

  output$plot_material.preenchimento <- renderPlot({
    plot(data$material.preenchimento)
  })
  output$plot_material.preenchimento_vs_falha <- renderPlot({
    plot(data$falha.s, data$material.preenchimento)
  })

  output$plot_superficie.lingual <- renderPlot({
    plot(data$superficie.lingual)
  })
  output$plot_superficie.lingual_vs_falha <- renderPlot({
    plot(data$falha.s, data$superficie.lingual)
  })

  output$plot_superficie.palatal <- renderPlot({
    plot(data$superficie.palatal)
  })
  output$plot_superficie.palatal_vs_falha <- renderPlot({
    plot(data$falha.s, data$superficie.palatal)
  })

  output$plot_superficie.lingual.palatal <- renderPlot({
    plot(data$superficie.lingual.palatal)
  })
  output$plot_superficie.lingual.palatal_vs_falha <- renderPlot({
    plot(data$falha.s, data$superficie.lingual.palatal)
  })

  output$plot_superficie.vestibular <- renderPlot({
    plot(data$superficie.vestibular)
  })
  output$plot_superficie.vestibular_vs_falha <- renderPlot({
    plot(data$falha.s, data$superficie.vestibular)
  })

  output$plot_superficie.oclusal <- renderPlot({
    plot(data$superficie.oclusal)
  })
  output$plot_superficie.oclusal_vs_falha <- renderPlot({
    plot(data$falha.s, data$superficie.oclusal)
  })

  output$plot_superficie.incisal <- renderPlot({
    plot(data$superficie.incisal)
  })
  output$plot_superficie.incisal_vs_falha <- renderPlot({
    plot(data$falha.s, data$superficie.incisal)
  })

  output$plot_superficie.oclusal.incisal <- renderPlot({
    plot(data$superficie.oclusal.incisal)
  })
  output$plot_superficie.oclusal.incisal_vs_falha <- renderPlot({
    plot(data$falha.s, data$superficie.oclusal.incisal)
  })

  output$plot_superficie.mesial <- renderPlot({
    plot(data$superficie.mesial)
  })
  output$plot_superficie.mesial_vs_falha <- renderPlot({
    plot(data$falha.s, data$superficie.mesial)
  })

  output$plot_superficie.distal <- renderPlot({
    plot(data$superficie.distal)
  })
  output$plot_superficie.distal_vs_falha <- renderPlot({
    plot(data$falha.s, data$superficie.distal)
  })

  output$plot_superficies.restauradas.count <- renderPlot({
    barplot(data$superficies.restauradas.count)
  })
  output$plot_superficies.restauradas.count_vs_falha <- renderPlot({
    plot(data$falha.s, data$superficies.restauradas.count)
  })

})
