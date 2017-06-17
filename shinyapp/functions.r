library(class)

# Função para testar um modelo KNN
test_knn <- function(nome, k, pct_treinamento, atributos, classe, metodo_na, normalizar) {
  test <- build_test_dataset(pct_treinamento, atributos, classe, metodo_na) 
  if (normalizar) {
    test$treinamentodf = normaliza_atributos_numericos(test$treinamentodf)
    test$testedf = normaliza_atributos_numericos(test$testedf)
  }
  # Classe estimada do exemplar de teste
  classe_estimada <- knn(test$treinamentodf, test$testedf, test$rotulos, k)
#  print(table(classe_estimada))
#  print(table(test$processed[test$treinamento:test$total,][classe]))
  pct_acerto <- get_pct_acerto(test, classe_estimada, classe)
  data.frame(nome, k, pct_treinamento, length(atributos), classe, metodo_na, normalizar, test$registros_processados, test$treinamento, test$teste, pct_acerto)
}

# Executa classificação do KNN
classifica_knn <- function(info) {
  test <- build_test_dataset(1, c("sexo.n", "idade", "tipo.invervencao.n", "novo.restauracao.n", "numero.dente", "tipo.dente.n", "arcada.n", "lado.n", "tipo.restauracao.n", "material.restauracao.n", "superficie.lingual.n", "superficie.palatal.n", "superficie.vestibular.n", "superficie.oclusal.n", "superficie.mesial.n", "superficie.distal.n", "vitalidade.n", "classe.n"), "falha", "complete.cases") 
  classe_estimada <- knn(test$treinamentodf, info, test$rotulos, 50)
  ifelse(classe_estimada[1] == 1, "Tem falha", "Não tem falha") 
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
  pct_acerto <- get_pct_acerto(test, classe_estimada, classe)
  data.frame(nome, pct_treinamento, length(atributos), classe, metodo_na, test$registros_processados, test$treinamento, test$teste, pct_acerto)
}

# Executa classificação por Rpart
classifica_rpart <- function(info) {
  atributos <- c("sexo", "idade.ag", "classe", "vitalidade", "tipo.invervencao", "novo.restauracao", "numero.dente", "tipo.dente", "tipo.restauracao", "superficie.lingual.fc", "superficie.palatal.fc", "superficie.vestibular.fc", "superficie.oclusal.fc", "superficie.mesial.fc", "superficie.distal.fc")
  test <- build_test_dataset(1, atributos, "falha", "complete.cases") 
  formula <- as.formula(paste("falha", paste("~", paste(atributos, collapse= "+"))))
  modelo <- rpart(formula, 
                  data=test$processed[1:test$treinamento,],
                  method="class",
                  control=rpart.control(cp=0.001),
                  parms=list(split="Information"))
  classe_estimada <- predict(modelo, info, "class")
  
  ifelse(classe_estimada[1] == 1, "Rpart - Tem falha", "Rpart - Não tem falha") 
}


# Função para testar uma RNA
test_rna <- function(nome, pct_treinamento, atributos, classe, metodo_na) {
  test <- build_test_dataset(pct_treinamento, atributos, classe, metodo_na) 
  formula <- as.formula(paste(classe, " ~ ."))
  nn <- nnet(formula, data = test$processed[test$treinamento:test$total,], size = 2)
  classe_estimada <-predict(nn, test$processed[test$treinamento:test$total,], "class")
  pct_acerto <- get_pct_acerto(test, classe_estimada, classe)
  data.frame(nome, pct_treinamento, length(atributos), classe, metodo_na, test$registros_processados, test$treinamento, test$teste, pct_acerto)
}


# Retorna o percentual de acerto
get_pct_acerto <- function(test, classe_estimada, classe) {
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
  # Método NA - Remove registros que possuam NA
  if (metodo_na == "complete.cases") {
    processed = processed[complete.cases(processed),]
  }
  # Método NA - Preenche numéricos com a média e fatores com a moda. Outros tipos de colunas com NA serão removidas
  if (metodo_na == "moda.media") {
    processed = na_moda_media(processed)
    processed = processed[complete.cases(processed),]
  }
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

# Normaliza atributos numéricos
normaliza_atributos_numericos <- function(dataframe) {
  data.frame(lapply( dataframe, function(x) {
    if("numeric" %in% class(x) ) { 
      x / max(x)
    } else { 
      x 
    }
  }))
}

# Converte NAs para média (numéricos) ou moda (fatores)
na_moda_media <- function(dataframe) {
  data.frame(lapply(names(dataframe), function(name) {
    values = dataframe[, match(name, names(dataframe))]
    # Se for numérico
    if("numeric" %in% class(values) ) { 
      # Se for um fator convertido para numérico
      if (endsWith(name, ".n")) {
        # Usa a moda
        values[is.na(values)] = mode(values[complete.cases(values)])
      } else {
        # Usa a média
        values[is.na(values)] = mean(values[complete.cases(values)])
      }
    }
    # Se for factor
    if("factor" %in% class(values) ) { 
      # Usa a moda
      values[is.na(values)] = mode(values[complete.cases(values)])
    }
    temp_df = data.frame(values)
    names(temp_df) = c(name)
    temp_df
  }))
}
