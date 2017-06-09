library(class)

# Função para testar um modelo KNN
test_knn <- function(nome, k, pct_treinamento, atributos, classe, metodo_na) {
  test <- build_test_dataset(pct_treinamento, atributos, classe, metodo_na) 
  # Classe estimada do exemplar de teste
  classe_estimada <- knn(test$treinamentodf, test$testedf, test$rotulos, k)
  pct_acerto <- get_pct_acerto(test, classe_estimada)
  data.frame(nome, k, pct_treinamento, length(atributos), classe, metodo_na, test$registros_processados, test$treinamento, test$teste, pct_acerto)
}

# Função para testar um modelo rpart
test_rpart <- function(nome, pct_treinamento, atributos, classe, metodo_na) {
  test <- build_test_dataset(pct_treinamento, atributos, classe, metodo_na) 
  # Classe estimada do exemplar de teste
  formula <- as.formula(paste(classe, paste("~", paste(atributos, collapse= "+"))))
  modelo <- rpart(formula, 
                  data=test$processed[1:test$treinamento,],
                  method="class",
                  control=rpart.control(cp=0.001),
                  parms=list(split="Information"))
  rpart.plot(modelo, type = 3)
  classe_estimada <- predict(modelo, test$processed[test$treinamento:test$total,], "class")
  print(table(classe_estimada))
  print(table(test$processed[test$treinamento:test$total,][classe]))
  pct_acerto <- get_pct_acerto(test, classe_estimada)
  data.frame(nome, pct_treinamento, length(atributos), classe, metodo_na, test$registros_processados, test$treinamento, test$teste, pct_acerto)
}

# Retorna o percentual de acerto
get_pct_acerto <- function(test, classe_estimada) {
  compare = data.frame(test$processed[test$treinamento:test$total,][classe], classe_estimada)
  names(compare)[1] = "real"
  corrects = length(compare$classe_estimada[compare$real == compare$classe_estimada])
  corrects / (test$teste)
}

# Função para criar dataset de teste
build_test_dataset <- function(pct_treinamento, atributos, classe, metodo_na) {
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
  list(
    processed=processed, 
    total=total,
    registros_processados=registros_processados, 
    treinamentodf=treinamentodf,
    rotulos=rotulos,
    teste=teste, 
    testedf=testedf,
    treinamento=treinamento
    )
}


