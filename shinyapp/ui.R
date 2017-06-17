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
                "teste"
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
