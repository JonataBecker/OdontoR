library(shiny)
library(markdown)

# Define UI for application that plots random distributions 
shinyUI(
  navbarPage("Dados odontológicos",
       tabPanel("Classficação",
          sidebarLayout(
            sidebarPanel(
              selectInput("metodo", "Método:",
                          c("KNN" = "knn",
                            "Árvore de decisão" = "rpar",
                            "RNA" = "rna")),
              selectInput("sexo", "Sexo:",
                          c("Masculino" = "2",
                            "Feminino" = "1")),
              textInput("idade", "Idade", 42),
              textInput("tipo.intervencao", "Tipo de intervenção", 3),
              textInput("novo.restauracao", "Novo restauracao", 1),
              textInput("numero.dente", "Numero do dente", 15),
              textInput("tipo.dente", "Tipo de dente", 5),
              textInput("arcada", "Arcada", 2),
              textInput("lado", "Lado", 1),
              textInput("tipo.restauracao", "Tipo de restauracao", 1),
              textInput("materia.restauracao", "Material restauracao", 2),
              textInput("superficie.lingual", "Seperficie lingual", 0),
              textInput("superficie.palatal", "Seperficie palatal", 0),
              textInput("superficie.vestibular", "Seperficie vertibutal", 1),
              textInput("superficie.oclusal", "Seperficie oclusao", 0),
              textInput("superficie.mesial", "Seperficie mesial", 0),
              textInput("superficie.distal", "Seperficie distal", 0),
              textInput("vitalidade", "Vitalidade", 1),
              textInput("classe", "Classe", 180)
            ),
            mainPanel(
              h3(textOutput("result"))
            )
          )
       ),
       tabPanel("Base de dados",
                "teste"
       )
  )
)
