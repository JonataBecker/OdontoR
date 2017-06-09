library(class)
source("prepara_dataset.r")
source("functions.r")

all_results_knn = data.frame()

k = 5
pct_treinamento = 0.8
atributos = c("sexo.n", "idade", "tipo.invervencao.n", "motivo.n", "novo.restauracao.n", "numero.dente.n", "tipo.dente.n", "arcada.n", "lado.n", "tipo.restauracao.n", "material.restauracao.n", "superficie.lingual.palatal.n", "superficie.vestibular.n", "superficie.oclusal.incisal.n", "superficie.mesial.n", "superficie.distal.n")
classe = "falha"
metodo_na = "complete.cases"
normalizar = FALSE
all_results_knn = rbind(all_results_knn, test_knn("Menos atributos", k, pct_treinamento, atributos, classe, metodo_na, normalizar))

k = 50
pct_treinamento = 0.8
atributos = c("sexo.n", "idade", "tipo.invervencao.n", "motivo.n", "novo.restauracao.n", "numero.dente.n", "tipo.dente.n", "arcada.n", "lado.n", "tipo.restauracao.n", "material.restauracao.n", "superficie.lingual.palatal.n", "superficie.vestibular.n", "superficie.oclusal.incisal.n", "superficie.mesial.n", "superficie.distal.n")
classe = "falha"
metodo_na = "complete.cases"
normalizar = FALSE
all_results_knn = rbind(all_results_knn, test_knn("Menos atributos", k, pct_treinamento, atributos, classe, metodo_na, normalizar))

k = 200
pct_treinamento = 0.8
atributos = c("sexo.n", "idade", "tipo.invervencao.n", "motivo.n", "novo.restauracao.n", "numero.dente.n", "tipo.dente.n", "arcada.n", "lado.n", "tipo.restauracao.n", "material.restauracao.n", "superficie.lingual.palatal.n", "superficie.vestibular.n", "superficie.oclusal.incisal.n", "superficie.mesial.n", "superficie.distal.n")
classe = "falha"
metodo_na = "complete.cases"
normalizar = FALSE
all_results_knn = rbind(all_results_knn, test_knn("Menos atributos", k, pct_treinamento, atributos, classe, metodo_na, normalizar))

k = 50
pct_treinamento = 0.8
atributos = c("sexo.n", "idade", "tipo.invervencao.n", "motivo.n", "novo.restauracao.n", "numero.dente.n", "tipo.dente.n", "arcada.n", "lado.n", "tipo.restauracao.n", "material.restauracao.n", "superficie.lingual.palatal.n", "superficie.vestibular.n", "superficie.oclusal.incisal.n", "superficie.mesial.n", "superficie.distal.n")
classe = "status"
metodo_na = "complete.cases"
normalizar = FALSE
all_results_knn = rbind(all_results_knn, test_knn("Menos atributos", k, pct_treinamento, atributos, classe, metodo_na, normalizar))

k = 50
pct_treinamento = 0.8
atributos = c("sexo.n", "idade", "tipo.invervencao.n", "novo.restauracao.n", "tipo.dente.n", "arcada.n", "tipo.restauracao.n", "material.restauracao.n", "superficie.lingual.palatal.n", "superficie.vestibular.n", "superficie.oclusal.incisal.n", "superficie.mesial.n", "superficie.distal.n")
classe = "status"
metodo_na = "complete.cases"
normalizar = FALSE
all_results_knn = rbind(all_results_knn, test_knn("Menos atributos", k, pct_treinamento, atributos, classe, metodo_na, normalizar))

k = 50
pct_treinamento = 0.8
atributos = c("sexo.n", "idade", "tipo.invervencao.n", "novo.restauracao.n", "tipo.dente.n", "arcada.n", "tipo.restauracao.n", "material.restauracao.n", "superficie.lingual.palatal.n", "superficie.vestibular.n", "superficie.oclusal.incisal.n", "superficie.mesial.n", "superficie.distal.n")
classe = "falha"
metodo_na = "complete.cases"
normalizar = FALSE
all_results_knn = rbind(all_results_knn, test_knn("Menos atributos", k, pct_treinamento, atributos, classe, metodo_na, normalizar))

k = 20
pct_treinamento = 0.8
atributos = c("sexo.n", "idade", "tipo.invervencao.n", "novo.restauracao.n", "numero.dente", "tipo.dente.n", "arcada.n", "lado.n", "tipo.restauracao.n", "material.restauracao.n", "superficie.lingual.palatal.n", "superficie.vestibular.n", "superficie.oclusal.incisal.n", "superficie.mesial.n", "superficie.distal.n")
classe = "falha"
metodo_na = "complete.cases"
normalizar = FALSE
all_results_knn = rbind(all_results_knn, test_knn("Menos atributos", k, pct_treinamento, atributos, classe, metodo_na, normalizar))

k = 23
pct_treinamento = 0.8
atributos = c("sexo.n", "idade", "tipo.invervencao.n", "novo.restauracao.n", "numero.dente", "tipo.dente.n", "arcada.n", "lado.n", "tipo.restauracao.n", "material.restauracao.n", "superficie.lingual.palatal.n", "superficie.vestibular.n", "superficie.oclusal.incisal.n", "superficie.mesial.n", "superficie.distal.n")
classe = "falha"
metodo_na = "complete.cases"
normalizar = FALSE
all_results_knn = rbind(all_results_knn, test_knn("Menos atributos", k, pct_treinamento, atributos, classe, metodo_na, normalizar))

k = 30
pct_treinamento = 0.8
atributos = c("sexo.n", "idade", "tipo.invervencao.n", "novo.restauracao.n", "numero.dente", "tipo.dente.n", "arcada.n", "lado.n", "tipo.restauracao.n", "material.restauracao.n", "superficie.lingual.palatal.n", "superficie.vestibular.n", "superficie.oclusal.incisal.n", "superficie.mesial.n", "superficie.distal.n")
classe = "falha"
metodo_na = "complete.cases"
normalizar = FALSE
all_results_knn = rbind(all_results_knn, test_knn("Menos atributos", k, pct_treinamento, atributos, classe, metodo_na, normalizar))

k = 50
pct_treinamento = 0.8
atributos = c("sexo.n", "idade", "tipo.invervencao.n", "novo.restauracao.n", "numero.dente", "tipo.dente.n", "arcada.n", "lado.n", "tipo.restauracao.n", "material.restauracao.n", "superficie.lingual.palatal.n", "superficie.vestibular.n", "superficie.oclusal.incisal.n", "superficie.mesial.n", "superficie.distal.n")
classe = "falha"
metodo_na = "complete.cases"
normalizar = FALSE
all_results_knn = rbind(all_results_knn, test_knn("Menos atributos", k, pct_treinamento, atributos, classe, metodo_na, normalizar))

k = 200
pct_treinamento = 0.8
atributos = c("sexo.n", "idade", "tipo.invervencao.n", "novo.restauracao.n", "numero.dente", "tipo.dente.n", "arcada.n", "lado.n", "tipo.restauracao.n", "material.restauracao.n", "superficie.lingual.palatal.n", "superficie.vestibular.n", "superficie.oclusal.incisal.n", "superficie.mesial.n", "superficie.distal.n")
classe = "falha"
metodo_na = "complete.cases"
normalizar = FALSE
all_results_knn = rbind(all_results_knn, test_knn("Menos atributos", k, pct_treinamento, atributos, classe, metodo_na, normalizar))

k = 20
pct_treinamento = 0.8
atributos = c("sexo.n", "idade", "tipo.invervencao.n", "novo.restauracao.n", "numero.dente", "tipo.dente.n", "arcada.n", "lado.n", "tipo.restauracao.n", "material.restauracao.n", "superficie.lingual.palatal.n", "superficie.vestibular.n", "superficie.oclusal.incisal.n", "superficie.mesial.n", "superficie.distal.n")
classe = "falha"
metodo_na = "complete.cases"
normalizar = FALSE
all_results_knn = rbind(all_results_knn, test_knn("Menos atributos", k, pct_treinamento, atributos, classe, metodo_na, normalizar))

normalizar = TRUE

k = 23
pct_treinamento = 0.8
atributos = c("sexo.n", "idade", "tipo.invervencao.n", "novo.restauracao.n", "numero.dente", "tipo.dente.n", "arcada.n", "lado.n", "tipo.restauracao.n", "material.restauracao.n", "superficie.lingual.palatal.n", "superficie.vestibular.n", "superficie.oclusal.incisal.n", "superficie.mesial.n", "superficie.distal.n")
classe = "falha"
metodo_na = "complete.cases"
all_results_knn = rbind(all_results_knn, test_knn("Menos atributos", k, pct_treinamento, atributos, classe, metodo_na, normalizar))

k = 30
pct_treinamento = 0.8
atributos = c("sexo.n", "idade", "tipo.invervencao.n", "novo.restauracao.n", "numero.dente", "tipo.dente.n", "arcada.n", "lado.n", "tipo.restauracao.n", "material.restauracao.n", "superficie.lingual.palatal.n", "superficie.vestibular.n", "superficie.oclusal.incisal.n", "superficie.mesial.n", "superficie.distal.n")
classe = "falha"
metodo_na = "complete.cases"
all_results_knn = rbind(all_results_knn, test_knn("Menos atributos", k, pct_treinamento, atributos, classe, metodo_na, normalizar))

k = 50
pct_treinamento = 0.8
atributos = c("sexo.n", "idade", "tipo.invervencao.n", "novo.restauracao.n", "numero.dente", "tipo.dente.n", "arcada.n", "lado.n", "tipo.restauracao.n", "material.restauracao.n", "superficie.lingual.palatal.n", "superficie.vestibular.n", "superficie.oclusal.incisal.n", "superficie.mesial.n", "superficie.distal.n")
classe = "falha"
metodo_na = "complete.cases"
all_results_knn = rbind(all_results_knn, test_knn("Menos atributos", k, pct_treinamento, atributos, classe, metodo_na, normalizar))

k = 200
pct_treinamento = 0.8
atributos = c("sexo.n", "idade", "tipo.invervencao.n", "novo.restauracao.n", "numero.dente", "tipo.dente.n", "arcada.n", "lado.n", "tipo.restauracao.n", "material.restauracao.n", "superficie.lingual.palatal.n", "superficie.vestibular.n", "superficie.oclusal.incisal.n", "superficie.mesial.n", "superficie.distal.n")
classe = "falha"
metodo_na = "complete.cases"
all_results_knn = rbind(all_results_knn, test_knn("Menos atributos", k, pct_treinamento, atributos, classe, metodo_na, normalizar))

k = 30
pct_treinamento = 0.8
atributos = c("sexo.n", "idade", "tipo.invervencao.n", "novo.restauracao.n", "numero.dente", "tipo.dente.n", "arcada.n", "lado.n", "tipo.restauracao.n", "material.restauracao.n", "superficie.lingual.palatal.n", "superficie.vestibular.n", "superficie.oclusal.incisal.n", "superficie.mesial.n", "superficie.distal.n", "vitalidade.n", "classe.n")
classe = "falha"
metodo_na = "complete.cases"
all_results_knn = rbind(all_results_knn, test_knn("Menos atributos", k, pct_treinamento, atributos, classe, metodo_na, normalizar))

k = 30
pct_treinamento = 0.8
atributos = c("sexo.n", "idade", "tipo.invervencao.n", "novo.restauracao.n", "numero.dente", "tipo.dente.n", "arcada.n", "lado.n", "tipo.restauracao.n", "material.restauracao.n", "superficie.lingual.palatal.n", "superficie.vestibular.n", "superficie.oclusal.incisal.n", "superficie.mesial.n", "superficie.distal.n", "vitalidade.n", "classe.n")
classe = "falha"
metodo_na = "moda.media"
all_results_knn = rbind(all_results_knn, test_knn("Menos atributos", k, pct_treinamento, atributos, classe, metodo_na, normalizar))

k = 30
pct_treinamento = 0.8
atributos = c("sexo.n", "idade", "tipo.invervencao.n", "novo.restauracao.n", "numero.dente", "tipo.dente.n", "arcada.n", "lado.n", "tipo.restauracao.n", "material.restauracao.n", "superficie.lingual.palatal.n", "superficie.vestibular.n", "superficie.oclusal.incisal.n", "superficie.mesial.n", "superficie.distal.n")
classe = "falha"
metodo_na = "moda.media"
all_results_knn = rbind(all_results_knn, test_knn("Menos atributos", k, pct_treinamento, atributos, classe, metodo_na, normalizar))

k = 30
pct_treinamento = 0.6
atributos = c("sexo.n", "idade", "tipo.invervencao.n", "novo.restauracao.n", "numero.dente", "tipo.dente.n", "arcada.n", "lado.n", "tipo.restauracao.n", "material.restauracao.n", "superficie.lingual.palatal.n", "superficie.vestibular.n", "superficie.oclusal.incisal.n", "superficie.mesial.n", "superficie.distal.n")
classe = "falha"
metodo_na = "moda.media"
all_results_knn = rbind(all_results_knn, test_knn("Menos atributos", k, pct_treinamento, atributos, classe, metodo_na, normalizar))

k = 30
pct_treinamento = 0.6
atributos = c("sexo.n", "idade", "tipo.invervencao.n", "novo.restauracao.n", "numero.dente", "tipo.dente.n", "arcada.n", "lado.n", "tipo.restauracao.n", "material.restauracao.n", "superficie.lingual.palatal.n", "superficie.vestibular.n", "superficie.oclusal.incisal.n", "superficie.mesial.n", "superficie.distal.n", "vitalidade.n", "classe.n")
classe = "falha"
metodo_na = "complete.cases"
all_results_knn = rbind(all_results_knn, test_knn("Menos atributos", k, pct_treinamento, atributos, classe, metodo_na, normalizar))


result = testa_tudo()

options("max.print"=9999)

nrow(result)

result

result[result$test.registros_processados > 1000 & result$pct_treinamento > 0.6 & result$pct_treinamento < 0.9 & result$pct_acerto > 0.72, ]

write.csv2(result[result$test.registros_processados > 1000 & result$pct_treinamento > 0.6 & result$pct_treinamento < 0.9 & result$pct_acerto > 0.72, ], file= 'arquivooos.csv')


testa_tudo <- function() {
  result = data.frame()
  result = rbind(result, testa_colunas(c("sexo.n", "idade", "tipo.invervencao.n", "novo.restauracao.n", "numero.dente", "tipo.dente.n", "arcada.n", "lado.n", "tipo.restauracao.n", "material.restauracao.n", "superficie.lingual.palatal.n", "superficie.vestibular.n", "superficie.oclusal.incisal.n", "superficie.mesial.n", "superficie.distal.n", "vitalidade.n", "classe.n")))
  result = rbind(result, testa_colunas(c("sexo.n", "idade", "tipo.invervencao.n", "novo.restauracao.n", "numero.dente", "tipo.dente.n", "arcada.n", "lado.n", "tipo.restauracao.n", "material.restauracao.n", "superficie.lingual.n", "superficie.palatal.n", "superficie.vestibular.n", "superficie.oclusal.n", "superficie.mesial.n", "superficie.distal.n", "vitalidade.n", "classe.n")))
  result = rbind(result, testa_colunas(c("sexo.n", "idade", "tipo.invervencao.n", "novo.restauracao.n", "numero.dente", "tipo.dente.n", "arcada.n", "lado.n", "tipo.restauracao.n", "material.restauracao.n", "superficie.lingual.palatal.n", "superficie.vestibular.n", "superficie.oclusal.incisal.n", "superficie.mesial.n", "superficie.distal.n")))
  result = rbind(result, testa_colunas(c("sexo.n", "idade", "tipo.invervencao.n", "motivo.n", "novo.restauracao.n", "numero.dente.n", "tipo.dente.n", "arcada.n", "lado.n", "tipo.restauracao.n", "material.restauracao.n", "superficie.lingual.palatal.n", "superficie.vestibular.n", "superficie.oclusal.incisal.n", "superficie.mesial.n", "superficie.distal.n")))
  nrow(result)
  result[order(result$pct_acerto),]
}

testa_colunas <- function(colunas) {
  testa_pct_trein(paste(colunas, collapse = ','), colunas)
}

testa_pct_trein <- function(name, atributos) {
  result = data.frame()
  for (pct_treinamento in 0.1*6:8){
    result = rbind(result, testa_classe(name, pct_treinamento, atributos))
  }
  result
}

testa_classe <- function(name, pct_treinamento, atributos) {
  result = data.frame()
  result = rbind(result, testa_metodo_na(name, pct_treinamento, atributos, "falha"))
  result = rbind(result, testa_metodo_na(name, pct_treinamento, atributos, "status"))
  result
}

testa_metodo_na <- function(name, pct_treinamento, atributos, classe) {
  result = data.frame()
  result = rbind(result, testa_com_sem_normalizacao(name, pct_treinamento, atributos, classe, "complete.cases"))
  # result = rbind(result, testa_com_sem_normalizacao(name, pct_treinamento, atributos, classe, "moda.media"))
  result
}

testa_com_sem_normalizacao <- function(name, pct_treinamento, atributos, classe, metodo_na) {
  result = data.frame()
  result = rbind(result, testa_varios_k(name, pct_treinamento, atributos, classe, metodo_na, TRUE))
  result = rbind(result, testa_varios_k(name, pct_treinamento, atributos, classe, metodo_na, FALSE))
  result
}

testa_varios_k <- function(name, pct_treinamento, atributos, classe, metodo_na, normalizar) {
  result = data.frame()
  for (k in 10*1:20){
    result = rbind(result, test_knn(name, k, pct_treinamento, atributos, classe, metodo_na, normalizar))
  }
  result
}
