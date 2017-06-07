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
atributos = c("sexo.n", "idade", "tipo.invervencao.n", "novo.restauracao.n", "tipo.dente.n", "arcada.n", "tipo.restauracao.n", "material.restauracao.n", "superficie.lingual.palatal.n", "superficie.vestibular.n", "superficie.oclusal.incisal.n", "superficie.mesial.n", "superficie.distal.n")
classe = "status"
metodo_na = "complete.cases"
all_results = rbind(all_results, test_knn("Menos atributos", k, pct_treinamento, atributos, classe, metodo_na))


all_results







