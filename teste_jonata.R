library(class)
source("prepara_dataset.r")

names(data)

data$falha.n = as.numeric(data$falha)
data$sexo.n = as.numeric(data$sexo)
data$tipo.invervencao.n = as.numeric(data$tipo.invervencao)
data$novo.restauracao.n = as.numeric(data$novo.restauracao)
data$motivo.n = as.numeric(data$motivo)
data$numero.dente.n = as.numeric(data$numero.dente)
data$tipo.dente.n = as.numeric(data$tipo.dente)
data$arcada.n = as.numeric(data$arcada)
data$lado.n = as.numeric(data$lado)
data$tipo.restauracao.n = as.numeric(data$tipo.restauracao)
data$material.restauracao.n = as.numeric(data$material.restauracao)
data$status.n = as.numeric(data$status)
data$superficie.lingual.palatal.n = as.numeric(data$superficie.lingual.palatal)
data$superficie.vestibular.n = as.numeric(data$superficie.vestibular)
data$superficie.oclusal.incisal.n = as.numeric(data$superficie.oclusal.incisal)
data$superficie.oclusal.incisal.n = as.numeric(data$superficie.oclusal.incisal)
data$superficie.mesial.n = as.numeric(data$superficie.mesial)
data$superficie.distal.n = as.numeric(data$superficie.distal)

columns = c("falha", "sexo.n", "idade", "tipo.invervencao.n", "motivo.n", "novo.restauracao.n", "numero.dente.n", "tipo.dente.n", "arcada.n", "lado.n", "tipo.restauracao.n", "material.restauracao.n", "superficie.lingual.palatal.n", "superficie.vestibular.n", "superficie.oclusal.incisal.n", "superficie.mesial.n", "superficie.distal.n")
columns = match(columns, names(data))
columns = columns[!is.na(columns)]
columns = as.numeric(columns)

processed = data[, columns]

#sapply(processed, getmode)
processed = processed[complete.cases(processed),]

summary(processed$idade)

k = 50
t = nrow(processed)
n = t * 0.8

teste <- processed[n:t,2:ncol(processed)]

# Criando um data frame de treinamento
treinamento <- processed[1:n,2:ncol(processed)]

# Criando um data frame com os rótulos do atributo classificador
rotulos <- processed[1:n, 1]

# Classe estimada do exemplar de teste
classe_estimada <- knn(treinamento, teste, rotulos, k)

compare = data.frame(processed[n:t,]$falha, classe_estimada)
corrects = length(compare$classe_estimada[compare$processed.n.t....falha == compare$classe_estimada])

corrects / (t - n)

# Instala pacote adequado
install.packages("rpart")
# Carrega o pacote rpart na memória
library(rpart)
# Instala pacote adequado
install.packages("rpart.plot")
# Carrega o pacote rpart na memória
library(rpart.plot)

# Gerando o modelo da árvores:
modelo <- rpart(falha~sexo.n+idade+tipo.invervencao.n+motivo.n+novo.restauracao.n+numero.dente.n+tipo.dente.n+arcada.n+lado.n+tipo.restauracao.n+material.restauracao.n+superficie.lingual.palatal.n+superficie.vestibular.n+superficie.oclusal.incisal.n+superficie.mesial.n+superficie.distal.n, 
                                  data=processed[1:n,],
                                  method="class",
                                  control=rpart.control(minsplit = 1),
                                  parms=list(split="Information"))

##########
# INTERPRETANDO O MODELO
##########
modelo

# Faz a plotagem da árvore de decisão
arvore_decisao <- rpart.plot(modelo, type = 3)

##########
# DEDUZINDO O MODELO
##########
# Leitura do dataset com registros de teste sobre a qualidade de serviço do restaurante

classe_estimada <- predict(modelo, processed[n:t,], "class")

##########
# MATRIZ DE CONFUSÃO
##########
table(classe_estimada)
table(classe_estimada, processed[n:t,]$falha)

sum(processed[n:t,]$falha == classe_estimada) / (t - n)
