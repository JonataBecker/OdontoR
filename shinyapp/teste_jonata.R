install.packages("rpart")
install.packages("rpart.plot")
install.packages("neuralnet")

library(class)
library(rpart)
library(rpart.plot)
library(grid)
library(gridExtra)
library(neuralnet)
library(nnet)
source("prepara_dataset.r")
source("functions.r")

data$falha.fa = as.factor(data$falha.n);

columns = c("falha.fa", "sexo.n", "idade", "tipo.invervencao.n", "novo.restauracao.n", "numero.dente", "tipo.dente.n", "arcada.n", "lado.n", "tipo.restauracao.n", "material.restauracao.n", "superficie.lingual.n", "superficie.palatal.n", "superficie.vestibular.n", "superficie.oclusal.n", "superficie.mesial.n", "superficie.distal.n", "vitalidade.n", "classe.n")
columns = match(columns, names(data))
columns = columns[!is.na(columns)]
columns = as.numeric(columns)

processed = data[, columns]

processed = processed[complete.cases(processed),]
t = nrow(processed)
n = t * 0.8

processed = normaliza_atributos_numericos(processed)

processed$status = as.factor(processed$status)


processed


nrow(processed)

summary(processed$status)

# Gerando o modelo da árvores:
modelo <- rpart(status~sexo.n+idade+tipo.invervencao.n+novo.restauracao.n+numero.dente.n+tipo.dente+arcada.n+lado.n+tipo.restauracao.n+material.restauracao.n+superficie.lingual.palatal.n+superficie.vestibular.n+superficie.oclusal.incisal.n+superficie.mesial.n+superficie.distal.n, 
                                  data=processed[1:n,],
                                  method="class",
                                  control=rpart.control(cp=0.0001),
                                  parms=list(split="Information"))
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
table(processed[n:t,]$status)


grid.draw(tableGrob(classe_estimada, processed[n:t,]$status))

ss <- 

#Make a scatterplot of your data
k <- ggplot(x,aes(x=x$"Value 1",y=x$"Value 2")) + 
  geom_point()

#Arrange them as you want with grid.arrange
grid.arrange(k,ss)

sum(processed[n:t,]$status == classe_estimada) / (t - n)



summary(processed$status)






processed$falha.fa = as.factor(processed$falha.n)


seedstrain 







ideal <- class.ind(processed$falha.fa)

summary(processed)

nn <- nnet(falha.fa ~ ., data = processed[1:n,], size = 2)


classe_estimada <-predict(nn, processed[n:t,-1], type="class")

classe_estimada <- as.factor(classe_estimada)

sum(processed[n:t,]$falha.fa == classe_estimada) / (t - n)

plot(nn)

