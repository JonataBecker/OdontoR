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
                            "Feminino" = "1"), 1),
              textInput("idade", "Idade", 42),
              selectInput("tipo.intervencao", "Tipo de intervenção:",
                          c("Restauração" = "1",
                            "Esplintagem" = "2",
                            "Prótese adesiva" = "3"), 3),              
              selectInput("novo.restauracao", "Tipo de intervenção:",
                          c("Novo" = "1",
                            "Reparo" = "2"), 1),              
              textInput("numero.dente", "Numero do dente", 15),
              selectInput("tipo.dente", "Tipo de dente:",
                          c("Incisivo lateral" = "1",
                            "Incisivo central" = "2",
                            "Canino" = "3",
                            "Pré-molar" = "4",
                            "Molar" = "5"), 5),
              selectInput("arcada", "Tipo de dente:",
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
              textInput("vitalidade", "Vitalidade", 1),
              
              selectInput("classe", "Classe:",
                          c("Faceta" = "5",
                            "Reconstituição com pino" = "15",
                            "Reconstituição" = "14",
                            "Veneer" = "18",
                            "Coroa" = "2",
                            "Coroa pura" = "3",
                            "Onlay" = "12",
                            "Overlay" = "13",
                            "Veneer+Ribbond" = "19",
                            "Coroa sobre implante" = "4",
                            "III+Veneer" = "10",
                            "Aumento incisal" = "1"), 10)
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
            plotOutput("plot_status")
          ),
          splitLayout(
            h3("sexo"),
            h3("sexo vs Falha")
          ),
          splitLayout(
            plotOutput("plot_sexo"),
            plotOutput("plot_sexo_vs_falha")
          ),
          splitLayout(
            h3("nascimento"),
            h3("nascimento vs Falha")
          ),
          splitLayout(
            plotOutput("plot_nascimento"),
            plotOutput("plot_nascimento_vs_falha")
          ),
          splitLayout(
            h3("data.intervencao"),
            h3("data.intervencao vs Falha")
          ),
          splitLayout(
            plotOutput("plot_data.intervencao"),
            plotOutput("plot_data.intervencao_vs_falha")
          ),
          splitLayout(
            h3("data.final"),
            h3("data.final vs Falha")
          ),
          splitLayout(
            plotOutput("plot_data.final"),
            plotOutput("plot_data.final_vs_falha")
          ),
          splitLayout(
            h3("idade"),
            h3("idade vs Falha")
          ),
          splitLayout(
            plotOutput("plot_idade"),
            plotOutput("plot_idade_vs_falha")
          ),
          splitLayout(
            h3("tipo.invervencao"),
            h3("tipo.invervencao vs Falha")
          ),
          splitLayout(
            plotOutput("plot_tipo.invervencao"),
            plotOutput("plot_tipo.invervencao_vs_falha")
          ),
          splitLayout(
            h3("vitalidade"),
            h3("vitalidade vs Falha")
          ),
          splitLayout(
            plotOutput("plot_vitalidade"),
            plotOutput("plot_vitalidade_vs_falha")
          ),
          splitLayout(
            h3("novo.restauracao"),
            h3("novo.restauracao vs Falha")
          ),
          splitLayout(
            plotOutput("plot_novo.restauracao"),
            plotOutput("plot_novo.restauracao_vs_falha")
          ),
          splitLayout(
            h3("motivo"),
            h3("motivo vs Falha")
          ),
          splitLayout(
            plotOutput("plot_motivo"),
            plotOutput("plot_motivo_vs_falha")
          ),
          splitLayout(
            h3("numero.dente"),
            h3("numero.dente vs Falha")
          ),
          splitLayout(
            plotOutput("plot_numero.dente"),
            plotOutput("plot_numero.dente_vs_falha")
          ),
          splitLayout(
            h3("tipo.dente"),
            h3("tipo.dente vs Falha")
          ),
          splitLayout(
            plotOutput("plot_tipo.dente"),
            plotOutput("plot_tipo.dente_vs_falha")
          ),
          splitLayout(
            h3("arcada"),
            h3("arcada vs Falha")
          ),
          splitLayout(
            plotOutput("plot_arcada"),
            plotOutput("plot_arcada_vs_falha")
          ),
          splitLayout(
            h3("lado"),
            h3("lado vs Falha")
          ),
          splitLayout(
            plotOutput("plot_lado"),
            plotOutput("plot_lado_vs_falha")
          ),
          splitLayout(
            h3("tipo.restauracao"),
            h3("tipo.restauracao vs Falha")
          ),
          splitLayout(
            plotOutput("plot_tipo.restauracao"),
            plotOutput("plot_tipo.restauracao_vs_falha")
          ),
          splitLayout(
            h3("material.restauracao"),
            h3("material.restauracao vs Falha")
          ),
          splitLayout(
            plotOutput("plot_material.restauracao"),
            plotOutput("plot_material.restauracao_vs_falha")
          ),
          splitLayout(
            h3("classe"),
            h3("classe vs Falha")
          ),
          splitLayout(
            plotOutput("plot_classe"),
            plotOutput("plot_classe_vs_falha")
          ),
          splitLayout(
            h3("superficies.restauradas"),
            h3("superficies.restauradas vs Falha")
          ),
          splitLayout(
            plotOutput("plot_superficies.restauradas"),
            plotOutput("plot_superficies.restauradas_vs_falha")
          ),
          splitLayout(
            h3("censored"),
            h3("censored vs Falha")
          ),
          splitLayout(
            plotOutput("plot_censored"),
            plotOutput("plot_censored_vs_falha")
          ),
          splitLayout(
            h3("data.falha.1"),
            h3("data.falha.1 vs Falha")
          ),
          splitLayout(
            plotOutput("plot_data.falha.1"),
            plotOutput("plot_data.falha.1_vs_falha")
          ),
          splitLayout(
            h3("data.falha.2"),
            h3("data.falha.2 vs Falha")
          ),
          splitLayout(
            plotOutput("plot_data.falha.2"),
            plotOutput("plot_data.falha.2_vs_falha")
          ),
          splitLayout(
            h3("tempo.censored"),
            h3("tempo.censored vs Falha")
          ),
          splitLayout(
            plotOutput("plot_tempo.censored"),
            plotOutput("plot_tempo.censored_vs_falha")
          ),
          splitLayout(
            h3("tempo.falha.sucesso"),
            h3("tempo.falha.sucesso vs Falha")
          ),
          splitLayout(
            plotOutput("plot_tempo.falha.sucesso"),
            plotOutput("plot_tempo.falha.sucesso_vs_falha")
          ),
          splitLayout(
            h3("tempo.falha.falha"),
            h3("tempo.falha.falha vs Falha")
          ),
          splitLayout(
            plotOutput("plot_tempo.falha.falha"),
            plotOutput("plot_tempo.falha.falha_vs_falha")
          ),
          splitLayout(
            h3("preco"),
            h3("preco vs Falha")
          ),
          splitLayout(
            plotOutput("plot_preco"),
            plotOutput("plot_preco_vs_falha")
          ),
          splitLayout(
            h3("adesivo"),
            h3("adesivo vs Falha")
          ),
          splitLayout(
            plotOutput("plot_adesivo"),
            plotOutput("plot_adesivo_vs_falha")
          ),
          splitLayout(
            h3("material.preenchimento"),
            h3("material.preenchimento vs Falha")
          ),
          splitLayout(
            plotOutput("plot_material.preenchimento"),
            plotOutput("plot_material.preenchimento_vs_falha")
          ),
          splitLayout(
            h3("superficie.lingual"),
            h3("superficie.lingual vs Falha")
          ),
          splitLayout(
            plotOutput("plot_superficie.lingual"),
            plotOutput("plot_superficie.lingual_vs_falha")
          ),
          splitLayout(
            h3("superficie.palatal"),
            h3("superficie.palatal vs Falha")
          ),
          splitLayout(
            plotOutput("plot_superficie.palatal"),
            plotOutput("plot_superficie.palatal_vs_falha")
          ),
          splitLayout(
            h3("superficie.lingual.palatal"),
            h3("superficie.lingual.palatal vs Falha")
          ),
          splitLayout(
            plotOutput("plot_superficie.lingual.palatal"),
            plotOutput("plot_superficie.lingual.palatal_vs_falha")
          ),
          splitLayout(
            h3("superficie.vestibular"),
            h3("superficie.vestibular vs Falha")
          ),
          splitLayout(
            plotOutput("plot_superficie.vestibular"),
            plotOutput("plot_superficie.vestibular_vs_falha")
          ),
          splitLayout(
            h3("superficie.oclusal"),
            h3("superficie.oclusal vs Falha")
          ),
          splitLayout(
            plotOutput("plot_superficie.oclusal"),
            plotOutput("plot_superficie.oclusal_vs_falha")
          ),
          splitLayout(
            h3("superficie.incisal"),
            h3("superficie.incisal vs Falha")
          ),
          splitLayout(
            plotOutput("plot_superficie.incisal"),
            plotOutput("plot_superficie.incisal_vs_falha")
          ),
          splitLayout(
            h3("superficie.oclusal.incisal"),
            h3("superficie.oclusal.incisal vs Falha")
          ),
          splitLayout(
            plotOutput("plot_superficie.oclusal.incisal"),
            plotOutput("plot_superficie.oclusal.incisal_vs_falha")
          ),
          splitLayout(
            h3("superficie.mesial"),
            h3("superficie.mesial vs Falha")
          ),
          splitLayout(
            plotOutput("plot_superficie.mesial"),
            plotOutput("plot_superficie.mesial_vs_falha")
          ),
          splitLayout(
            h3("superficie.distal"),
            h3("superficie.distal vs Falha")
          ),
          splitLayout(
            plotOutput("plot_superficie.distal"),
            plotOutput("plot_superficie.distal_vs_falha")
          ),
          splitLayout(
            h3("superficies.restauradas.count"),
            h3("superficies.restauradas.count vs Falha")
          ),
          splitLayout(
            plotOutput("plot_superficies.restauradas.count"),
            plotOutput("plot_superficies.restauradas.count_vs_falha")
          )
       ),
       tabPanel("Algoritmos",
         h2("KNN"),
         sidebarLayout(
            sidebarPanel(
              textInput("knn.k", "K:", 50),
              textInput("knn.pct_treinamento", "Percentual Treinamento:", 0.8),
              textInput("knn.metodo_na", "Método NA:", "complete.cases"),
              textInput("knn.normalizar", "Normalizar:", TRUE)
            ),
            mainPanel(
              tableOutput("algoritmoKnn")
            )
         ),
         h2("Árvore de decisão - RPART"),
         sidebarLayout(
           sidebarPanel(
             textInput("rpart.pct_treinamento", "Percentual Treinamento:", 0.8),
             textInput("rpart.metodo_na", "Método NA:", "complete.cases")
           ),
           mainPanel(
             tableOutput("algoritmoRpart")
           )
         ),
         h2("RNA"),
         sidebarLayout(
           sidebarPanel(
             textInput("rna.pct_treinamento", "Percentual Treinamento:", 0.7),
             textInput("rna.metodo_na", "Método NA:", "complete.cases")
           ),
           mainPanel(
             tableOutput("algoritmoRna")
           )
         )         
       )
  )
)
