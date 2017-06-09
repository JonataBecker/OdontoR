library(class)
source("prepara_dataset.r")

# Função para testar um modelo KNN
test_knn <- function(nome, k, pct_treinamento, atributos, classe, metodo_na) {
  # Cria o array de colunas (A classe tem que ser a primeira)
  columns = c(classe, atributos)
  columns = match(columns, names(data))
  columns = columns[!is.na(columns)]
  columns = as.numeric(columns)
  # Monta o array que será processado
  processed = data[, columns]
  # Somente casos completos
  processed = processed[complete.cases(processed),]

  total = nrow(processed)
  registros_processados = total
  treinamento = total * pct_treinamento
  teste = total - treinamento
  
  testedf <- processed[treinamento:total,2:ncol(processed)]
  
  # Criando um data frame de treinamento
  treinamentodf <- processed[1:treinamento,2:ncol(processed)]
  
  # Criando um data frame com os rótulos do atributo classificador
  rotulos <- processed[1:treinamento, 1]
  
  # Classe estimada do exemplar de teste
  classe_estimada <- knn(treinamentodf, testedf, rotulos, k)
  
  compare = data.frame(processed[treinamento:total,][classe], classe_estimada)
  names(compare)[1] = "real"
  corrects = length(compare$classe_estimada[compare$real == compare$classe_estimada])
  
  pct_acerto = corrects / (total - treinamento)
  
  data.frame(nome, k, pct_treinamento, length(atributos), classe, metodo_na, registros_processados, treinamento, teste, pct_acerto)
}

all_results = data.frame()

k = 5
pct_treinamento = 0.8
atributos = c("sexo.n", "idade", "tipo.invervencao.n", "motivo.n", "novo.restauracao.n", "numero.dente.n", "tipo.dente.n", "arcada.n", "lado.n", "tipo.restauracao.n", "material.restauracao.n", "status.n", "superficie.lingual.palatal.n", "superficie.vestibular.n", "superficie.oclusal.incisal.n", "superficie.mesial.n", "superficie.distal.n")
classe = "falha"
metodo_na = "complete.cases"
all_results = rbind(all_results, test_knn("K pequeno", k, pct_treinamento, atributos, classe, metodo_na))

k = 50
pct_treinamento = 0.8
atributos = c("sexo.n", "idade", "tipo.invervencao.n", "motivo.n", "novo.restauracao.n", "numero.dente.n", "tipo.dente.n", "arcada.n", "lado.n", "tipo.restauracao.n", "material.restauracao.n", "status.n", "superficie.lingual.palatal.n", "superficie.vestibular.n", "superficie.oclusal.incisal.n", "superficie.mesial.n", "superficie.distal.n")
classe = "falha"
metodo_na = "complete.cases"
all_results = rbind(all_results, test_knn("K grande", k, pct_treinamento, atributos, classe, metodo_na))

k = 50
pct_treinamento = 0.8
atributos = c("sexo.n", "idade", "tipo.invervencao.n", "motivo.n", "novo.restauracao.n", "numero.dente.n", "tipo.dente.n", "arcada.n", "lado.n", "tipo.restauracao.n", "material.restauracao.n", "status.n", "superficie.lingual.palatal.n", "superficie.vestibular.n", "superficie.oclusal.incisal.n", "superficie.mesial.n", "superficie.distal.n")
classe = "status"
metodo_na = "complete.cases"
all_results = rbind(all_results, test_knn("Classe status", k, pct_treinamento, atributos, classe, metodo_na))

k = 50
pct_treinamento = 0.8
atributos = c("idade", "tipo.dente.n")
classe = "status"
metodo_na = "complete.cases"
all_results = rbind(all_results, test_knn("Menos atributos", k, pct_treinamento, atributos, classe, metodo_na))


all_results

#[9] "vitalidade"                     "novo.restauracao"              "motivo"                        "numero.dente"                 
#[13] "tipo.dente"                    "arcada"                        "lado"                          "tipo.restauracao"             
#[17] "material.restauracao"          "classe"                        "superficies.restauradas"       "status"                       
#[21] "censored"                      "data.falha.1"                  "data.falha.2"                  "tempo.censored"               
#[25] "tempo.falha.sucesso"           "tempo.falha.falha"             "preco"                         "adesivo"                      
#[29] "material.preenchimento"        "superficie.lingual.palatal"    "superficie.vestibular"         "superficie.oclusal.incisal"   
#[33] "superficie.mesial"             "superficie.distal"             "superficies.restauradas.count" 


summary(data)

plot(data$vitalidade, data$status)
  

alfa = c("oi", "cara de boi", NA, "tchau", "cara de pau")
num1 = c(1, 2, 3, 4, NA)
num2.n = c(1, 2, NA, 4, 1)
fact = as.factor(c("A", "A", "B", NA, "C"))
df = data.frame(alfa, num1, fact, num2.n)

df

t = fact
mode(t[complete.cases(t)])
t[is.na(t)] = mode(t[complete.cases(t)])

t

class(df$fact)

names(df$num1)

dataframe = df


mode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}

na_moda_media <- function(dataframe) {
    data.frame(lapply( dataframe, function(x) {
      if("numeric" %in% class(x) ) { 
#        if(endsWith(x) ) {
        x / max(x)
      } else { 
        x 
      }
    }))
}