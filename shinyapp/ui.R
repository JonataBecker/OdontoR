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
                            "Árvore de decisão" = "rpart",
                            "RNA" = "rna")),
              selectInput("sexo", "Sexo:",
                          c("Masculino" = "2",
                            "Feminino" = "1"), 1),
              textInput("idade", "Idade", 34),
              selectInput("tipo.intervencao", "Tipo de intervenção:",
                          c("Restauração" = "1",
                            "Esplintagem" = "2",
                            "Prótese adesiva" = "3"), 3),              
              selectInput("novo.restauracao", "Restauração:",
                          c("Novo" = "1",
                            "Reparo" = "2"), 1),              
              textInput("numero.dente", "Numero do dente", 11),
              selectInput("tipo.dente", "Tipo de dente:",
                          c("Incisivo lateral" = "1",
                            "Incisivo central" = "2",
                            "Canino" = "3",
                            "Pré-molar" = "4",
                            "Molar" = "5"), 2),
              selectInput("arcada", "Arcada:",
                          c("Inferior" = "1",
                            "Superior" = "2"), 2),
              selectInput("lado", "Lado:",
                          c("Esquerdo" = "1",
                            "Direito" = "2"), 1),
              selectInput("tipo.restauracao", "Tipo de restauracao:",
                          c("Direta" = "1",
                            "Indireta" = "2"), 1),
              selectInput("materia.restauracao", "Material restauracao:",
                          c("Cerâmica" = "1",
                            "Composto de resina" = "2",
                            "Ribbond (Reforço adesivo)" = "3"), 2),
              selectInput("superficie.lingual", "Seperficie lingual:",
                          c("Não" = "0",
                            "Sim" = "1"), 0),              
              selectInput("superficie.palatal", "Seperficie palatal:",
                          c("Não" = "0",
                            "Sim" = "1"), 0),                                        
              selectInput("superficie.vestibular", "Seperficie vestibular:",
                          c("Não" = "0",
                            "Sim" = "1"), 1),                                                 
              selectInput("superficie.oclusal", "Seperficie oclusal:",
                          c("Não" = "0",
                            "Sim" = "1"), 0),                                        
              selectInput("superficie.mesial", "Seperficie mesial:",
                          c("Não" = "0",
                            "Sim" = "1"), 0),            
              selectInput("superficie.distal", "Seperficie distal:",
                          c("Não" = "0",
                            "Sim" = "1"), 0),                          
              textInput("vitalidade", "Vitalidade", 2),
              selectInput("classe", "Classe:",
                          c("Aumento incisal" = "1",
                            "Coroa" = "2",
                            "Coroa pura" = "3",
                            "Coroa sobre implante" = "4",
                            "Faceta" = "5",
                            "I" = "6",
                            "I+V" = "7",
                            "II" = "8",
                            "III" = "9",
                            "III+Veneer" = "10",
                            "IV" = "11",
                            "Onlay" = "12",
                            "Overlay" = "13",
                            "Reconstituição" = "14",
                            "Reconstituição com pino" = "15",
                            "V" = "16",
                            "V+I" = "17",
                            "Veneer" = "18",
                            "Veneer+Ribbond" = "19"), 18)
            ),
            mainPanel(
              h3(textOutput("result"))
            )
          )
       ),
       tabPanel("Base de dados",
          splitLayout(
            h3("Falha"),
            h3("Status")
          ),
          splitLayout(
            plotOutput("plot_falha"),
            plotOutput("plot_status", width = "98%")
          ),
          splitLayout(
            h3("sexo"),
            h3("sexo vs Falha")
          ),
          splitLayout(
            plotOutput("plot_sexo"),
            plotOutput("plot_sexo_vs_falha", width = "98%")
          ),
          h3("nascimento"),
          plotOutput("plot_nascimento"),
          h3("data.intervencao"),
          plotOutput("plot_data.intervencao"),
          splitLayout(
            h3("idade"),
            h3("idade vs Falha")
          ),
          splitLayout(
            plotOutput("plot_idade"),
            plotOutput("plot_idade_vs_falha", width = "98%")
          ),
          splitLayout(
            h3("vitalidade"),
            h3("vitalidade vs Falha")
          ),
          splitLayout(
            plotOutput("plot_vitalidade"),
            plotOutput("plot_vitalidade_vs_falha", width = "98%")
          ),
          splitLayout(
            h3("novo.restauracao"),
            h3("novo.restauracao vs Falha")
          ),
          splitLayout(
            plotOutput("plot_novo.restauracao"),
            plotOutput("plot_novo.restauracao_vs_falha", width = "98%")
          ),
          splitLayout(
            h3("tipo.dente"),
            h3("tipo.dente vs Falha")
          ),
          splitLayout(
            plotOutput("plot_tipo.dente"),
            plotOutput("plot_tipo.dente_vs_falha", width = "98%")
          ),
          splitLayout(
            h3("arcada"),
            h3("arcada vs Falha")
          ),
          splitLayout(
            plotOutput("plot_arcada"),
            plotOutput("plot_arcada_vs_falha", width = "98%")
          ),
          splitLayout(
            h3("classe"),
            h3("classe vs Falha")
          ),
          splitLayout(
            plotOutput("plot_classe"),
            plotOutput("plot_classe_vs_falha", width = "98%")
          ),
          splitLayout(
            h3("adesivo"),
            h3("adesivo vs Falha")
          ),
          splitLayout(
            plotOutput("plot_adesivo"),
            plotOutput("plot_adesivo_vs_falha", width = "98%")
          ),
          splitLayout(
            h3("material.preenchimento"),
            h3("material.preenchimento vs Falha")
          ),
          splitLayout(
            plotOutput("plot_material.preenchimento"),
            plotOutput("plot_material.preenchimento_vs_falha", width = "98%")
          ),
          splitLayout(
            h3("superficie.lingual"),
            h3("superficie.lingual vs Falha")
          ),
          splitLayout(
            plotOutput("plot_superficie.lingual"),
            plotOutput("plot_superficie.lingual_vs_falha", width = "98%")
          ),
          splitLayout(
            h3("superficie.palatal"),
            h3("superficie.palatal vs Falha")
          ),
          splitLayout(
            plotOutput("plot_superficie.palatal"),
            plotOutput("plot_superficie.palatal_vs_falha", width = "98%")
          ),
          splitLayout(
            h3("superficie.vestibular"),
            h3("superficie.vestibular vs Falha")
          ),
          splitLayout(
            plotOutput("plot_superficie.vestibular"),
            plotOutput("plot_superficie.vestibular_vs_falha", width = "98%")
          ),
          splitLayout(
            h3("superficie.oclusal"),
            h3("superficie.oclusal vs Falha")
          ),
          splitLayout(
            plotOutput("plot_superficie.oclusal"),
            plotOutput("plot_superficie.oclusal_vs_falha", width = "98%")
          ),
          splitLayout(
            h3("superficie.incisal"),
            h3("superficie.incisal vs Falha")
          ),
          splitLayout(
            plotOutput("plot_superficie.incisal"),
            plotOutput("plot_superficie.incisal_vs_falha", width = "98%")
          ),
          splitLayout(
            h3("superficie.mesial"),
            h3("superficie.mesial vs Falha")
          ),
          splitLayout(
            plotOutput("plot_superficie.mesial"),
            plotOutput("plot_superficie.mesial_vs_falha", width = "98%")
          ),
          splitLayout(
            h3("superficie.distal"),
            h3("superficie.distal vs Falha")
          ),
          splitLayout(
            plotOutput("plot_superficie.distal"),
            plotOutput("plot_superficie.distal_vs_falha", width = "98%")
          ),
          splitLayout(
            h3("superficies.restauradas.count"),
            h3("superficies.restauradas.count vs Falha")
          ),
          splitLayout(
            plotOutput("plot_superficies.restauradas.count"),
            plotOutput("plot_superficies.restauradas.count_vs_falha", width = "98%")
          )
       ),
       tabPanel("Algoritmos",
         h2("KNN"),
         sidebarLayout(
            sidebarPanel(
              textInput("knn.k", "K:", 50),
              textInput("knn.pct_treinamento", "Percentual Treinamento:", 0.8),
              selectInput("knn.metodo_na", "Método NA:",
                          c("complete.cases" = "complete.cases",
                            "moda.media" = "moda.media"), "complete.cases"),
              selectInput("knn.normalizar", "Normalizar:",
                          c("Não" = "FALSE",
                            "Sim" = "TRUE"), TRUE)
            ),
            mainPanel(
              tableOutput("algoritmoKnn"),
              verbatimTextOutput("algoritmoKnnConfusao")
            )
         ),
         h2("Árvore de decisão - RPART"),
         sidebarLayout(
           sidebarPanel(
             textInput("rpart.pct_treinamento", "Percentual Treinamento:", 0.8),
             selectInput("rpart.metodo_na", "Método NA:",
                         c("complete.cases" = "complete.cases",
                           "moda.media" = "moda.media"), "complete.cases")
           ),
           mainPanel(
             tableOutput("algoritmoRpart"),
             verbatimTextOutput("algoritmoRpartConfusao")
           )
         ),
         h2("RNA"),
         sidebarLayout(
           sidebarPanel(
             textInput("rna.pct_treinamento", "Percentual Treinamento:", 0.7),
             selectInput("rna.metodo_na", "Método NA:",
                         c("complete.cases" = "complete.cases",
                           "moda.media" = "moda.media"), "complete.cases")
           ),
           mainPanel(
             tableOutput("algoritmoRna"),
             verbatimTextOutput("algoritmoRnaConfusao")
           )
         )         
       )
  )
)
