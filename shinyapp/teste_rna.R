library(class)
library(nnet)

source("prepara_dataset.r")
source("functions.r")

all_results = data.frame()

pct_treinamento = 0.7
atributos = c("sexo", "idade.ag", "classe", "vitalidade", "tipo.invervencao", "novo.restauracao", "numero.dente", "tipo.dente", "tipo.restauracao", "superficie.lingual.fc", "superficie.palatal.fc", "superficie.vestibular.fc", "superficie.oclusal.fc", "superficie.mesial.fc", "superficie.distal.fc")
classe = "falha.fc"
metodo_na = "complete.cases"
all_results = rbind(all_results, test_rna("Teste", pct_treinamento, atributos, classe, metodo_na)$info)


all_results
