library(class)
library(rpart)
library(rpart.plot)
source("prepara_dataset.r")
source("functions.r")

all_results = data.frame()

summary(data$falha)

pct_treinamento = 0.8
atributos = c("sexo.n", "idade", "tipo.invervencao.n", "motivo.n", "novo.restauracao.n", "numero.dente.n", "tipo.dente.n", "arcada.n", "lado.n", "tipo.restauracao.n", "material.restauracao.n", "superficie.lingual.palatal.n", "superficie.vestibular.n", "superficie.oclusal.incisal.n", "superficie.mesial.n", "superficie.distal.n")
classe = "falha"
metodo_na = "complete.cases"
all_results = rbind(all_results, test_rpart("atributos numericos", pct_treinamento, atributos, classe, metodo_na)$info)

pct_treinamento = 0.8
atributos = c("sexo.n", "idade", "tipo.invervencao.n", "motivo.n", "novo.restauracao.n", "numero.dente.n", "tipo.dente.n", "arcada.n", "lado.n", "tipo.restauracao.n", "material.restauracao.n", "superficie.lingual.palatal.n", "superficie.vestibular.n", "superficie.oclusal.incisal.n", "superficie.mesial.n", "superficie.distal.n")
classe = "status"
metodo_na = "complete.cases"
all_results = rbind(all_results, test_rpart("atributos numericos", pct_treinamento, atributos, classe, metodo_na)$info)

pct_treinamento = 0.8
atributos = c("sexo.n", "idade", "tipo.invervencao.n", "novo.restauracao.n", "numero.dente.n", "tipo.dente.n", "arcada.n", "lado.n", "tipo.restauracao.n", "material.restauracao.n", "superficie.lingual.palatal.n", "superficie.vestibular.n", "superficie.oclusal.incisal.n", "superficie.mesial.n", "superficie.distal.n")
classe = "status"
metodo_na = "complete.cases"
all_results = rbind(all_results, test_rpart("Sem motivo", pct_treinamento, atributos, classe, metodo_na)$info)

pct_treinamento = 0.8
atributos = c("sexo", "idade", "tipo.invervencao", "novo.restauracao", "numero.dente", "tipo.dente", "arcada", "lado", "tipo.restauracao", "material.restauracao", "superficie.lingual.palatal", "superficie.vestibular", "superficie.oclusal.incisal", "superficie.mesial", "superficie.distal")
classe = "status"
metodo_na = "complete.cases"
all_results = rbind(all_results, test_rpart("Sem motivo - fatory", pct_treinamento, atributos, classe, metodo_na)$info)


pct_treinamento = 0.8
atributos = c("sexo", "idade.ag", "tipo.invervencao", "novo.restauracao", "numero.dente", "tipo.dente", "arcada", "lado", "tipo.restauracao", "material.restauracao", "superficie.lingual.palatal.fc", "superficie.vestibular.fc", "superficie.oclusal.incisal.fc", "superficie.mesial.fc", "superficie.distal.fc")
classe = "status"
metodo_na = "complete.cases"
all_results = rbind(all_results, test_rpart("Sem motivo - fatory - Idade com agrupamento", pct_treinamento, atributos, classe, metodo_na)$info)

pct_treinamento = 0.7
atributos = c("sexo", "idade.ag", "tipo.invervencao", "novo.restauracao", "numero.dente", "tipo.dente", "arcada", "lado", "tipo.restauracao", "material.restauracao", "superficie.lingual.palatal.fc", "superficie.vestibular.fc", "superficie.oclusal.incisal.fc", "superficie.mesial.fc", "superficie.distal.fc")
classe = "falha"
metodo_na = "complete.cases"
all_results = rbind(all_results, test_rpart("Sem motivo - fatory - Idade com agrupamento", pct_treinamento, atributos, classe, metodo_na)$info)


pct_treinamento = 0.7
atributos = c("sexo", "idade.ag", "vitalidade", "tipo.invervencao", "novo.restauracao", "numero.dente", "tipo.dente", "arcada", "lado", "tipo.restauracao", "material.restauracao", "superficie.lingual.palatal.fc", "superficie.vestibular.fc", "superficie.oclusal.incisal.fc", "superficie.mesial.fc", "superficie.distal.fc")
classe = "falha"
metodo_na = "complete.cases"
all_results = rbind(all_results, test_rpart("Sem motivo - fatory - Idade com agrupamento", pct_treinamento, atributos, classe, metodo_na)$info)

pct_treinamento = 0.7
atributos = c("sexo", "idade.ag", "classe", "vitalidade", "tipo.invervencao", "novo.restauracao", "numero.dente", "tipo.dente", "arcada", "lado", "tipo.restauracao", "material.restauracao", "superficie.lingual.fc", "superficie.palatal.fc", "superficie.vestibular.fc", "superficie.oclusal.fc", "superficie.mesial.fc", "superficie.distal.fc")
classe = "falha"
metodo_na = "complete.cases"
all_results = rbind(all_results, test_rpart("Sem motivo - fatory - Idade com agrupamento", pct_treinamento, atributos, classe, metodo_na)$info)

pct_treinamento = 0.7
atributos = c("sexo", "idade.ag", "classe", "vitalidade", "tipo.invervencao", "novo.restauracao", "numero.dente", "tipo.dente", "tipo.restauracao", "superficie.lingual.fc", "superficie.palatal.fc", "superficie.vestibular.fc", "superficie.oclusal.fc", "superficie.mesial.fc", "superficie.distal.fc")
classe = "falha"
metodo_na = "complete.cases"
all_results = rbind(all_results, test_rpart("Sem motivo - fatory - Idade com agrupamento", pct_treinamento, atributos, classe, metodo_na)$info)


all_results
