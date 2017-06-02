# id                    number      ID único do paciente                                                                                                                                                                                                               
# sexo                  factor      Sexo do paciente                                                                                                                                                                                                                     
# nascimento            Date        Data de nascimento do paciente                                                                                                                                                                                                               
# data.intervencao      Date        Data da intervenção
# data.final            Date        ?????
# falha                 factor      ?????
# idade                 number      Idade do paciente na intervenção                                                                                                                                                                                       
# tipo.invervencao      factor      Tipo de intervenção
# vitality              factor      ???????                                                                                                                                          
# novo.restauracao      factor      Se é novo ou reparação                                                                                                                                                
# motivo                factor      Motivo para intervenção
# numero.dente          number      Número do dente
# tipo.dente            factor      Tipo do dente (Incisivo, molar, etc)
# arcada                factor      Arcada inferior ou superior
# lado                  factor      Lado direito ou esquerdo
# tipo.restauracao      factor      Tipo de restauração direta ou indireta
# material.restauracao  factor      Material usado na restauração
# [30] "restoration.Class"                                                                                                                                                                                                                   
# [31] "restoration.Class.1"                                                                                                                                                                                                                 
# [32] "restored.surfaces"                                                                                                                                                                                                                    
# [34] "number.of.surfaces..calcula.sozinho."                                                                                                                                                                                                
# [35] "status..1.alive..2.repaired.and.alive..3.repaired.and.faile.4..failed.never.repaired."                                                                                                                                               
# [36] "censored...apenas.restaura.äes.nÆo.falhadas.com.status.1.e.2..data.ultimo.dia.que.o.paciente.foi.no.Paullo."                                                                                                                         
# [37] "failure.date.1..data.quando.houve.a.substitui.Æo.da.restaura.Æo."                                                                                                                                                                    
# [38] "failure.date.2..se.o.reparo.for.considerado.como.falha.da.restaura.Æo..data.1..reparo."                                                                                                                                              
# [39] "status..1.alive..2.repaired.and.alive..3.repaired.and.faile.4..failed.never.repaired..1"                                                                                                                                             
# [40] "tempo.censored...alive.e.4"                                                                                                                                                                                                          
# [41] "tempo.falha...reparo.SUCESSO"                                                                                                                                                                                                        
# [42] "tempo.falha...reparo.FALHA"                                                                                                                                                                                                          
# [44] "Restoration.Price"                                                                                                                                                                                                                   
# [46] "Adhesive"                                                                                                                                                                                                                            
# [47] "Adhesive.1"                                                                                                                                                                                                                          
# [48] "filling.material.category"    
# superficie.lingual.palatal    logical     Se houve restauração na superfície lingual/palatal
# superficie.vestibular         logical     Se houve restauração na superfície vestibular
# superficie.oclusal.incisal    logical     Se houve restauração na superfície oclusal/incisal
# superficie.mesial             logical     Se houve restauração na superfície mesial
# superficie.distal

# Pendências:
#   - O que significa o campo Falha?
#   - O que significa o campo Vitality?
#   - Existem muitas diferenças entre as duas colunas "Restoration Class"
#   - O que significa o campo Status?
#   - O que significa o campo Censored?
#   - O que significa o campo Failure Date?
#   - O que significa o campo Failure Date 2?
#   - O que significa o campo Tempo falha reparo sucesso?
#   - O que significa o campo Tempo falha reparo falha?
#   - Confirmar o campo Restored Surfaces:
#     - L = Lingual
#     - P = Palatal
#     - V = Vestibular
#     - O = Oclusal
#     - I = Incisal
#     - M = Mesial
#     - D = Distal
#     - Lingual = Palatal?
#     - Oclusal = Incisal?

# Carrega os dados iniciais
data = read.csv2("dados_odntologicos_caxias_sul.csv", fileEncoding="ISO-8859-1")
#data = read.csv2("dados_odntologicos_caxias_sul.csv", fileEncoding="windows-1252")
# Pega as 3006 primeiras linhas, pois as outras linhas seriam em branco
data <- data[c(0:3006), ]

# Remove colunas inúteis/que não teriam suporte suficiente
#  pino                - 2992 em branco, 1 inválido, 13 válidos
#  name                - Nome
#  name.1              - ID do Nome
#  male.female.1       - Mesma que male.female, mas tem 1 registro incorreto
#  intervention.type.1 - Duplicado de intervention.type
#  vitality..1         - Duplicado de vitality
#  intervention..1     - Duplicado de intervention..restoration..new..repair
#  reason.for.treatment- Duplicado
#  tooth.type.1        - Duplicado
#  arch.Upper.Lower.1  - Duplicado
#  side.Left.Right.1   - Duplicado
#  restoration.type.1  - Duplicado
#  restoration.mater.1 - Duplicado
#  Modea               - É tudo em R$
#  restored.surfaces.1 - Duplicado
#  number.of.surfaces  - É mais preciso calcular na hora
#  status.1            - Duplicado
#  Adhesive.1          - Duplicado
#  restoration.Class.1 - Duplicado
data = data[ , !(names(data) %in% c("male.female.1", "pino..yes..no.", "name", "name.1", "reason.for.treatment..caries..fracture..endo........completar.depois.de.olhar.RX", "intervention...restoration..new..repair..1", "intervention.type..restoration.R..endo..exo..implant..placa.de.bruxismo.b..home.bleaching.hb..office.bleaching.ob..internal.bleaching.ib..periodontal.suRrgery.ps..protese.parcial.fixa.ppf..pr.tese.adesiva..pa..esplintagem.es...1", "vItality..yes.no..olhar.nos.encaminhamentos.para.endo..olhar.data..olhar.rx....1", "X", "X.1", "X.2", "X.3", "X.4", "X.5", "X.6", "tooth.type.IC.IL.C.PM.M.1", "arch.Upper.Lower.1", "side.Left.Right.1", "restoration.type..direct.indirect..1", "restoration.material..resin.composite.RC..ceramic.C..1", "Moeda", "restored.surfaces.1", "status..1.alive..2.repaired.and.alive..3.repaired.and.faile.4..failed.never.repaired..1", "Adhesive.1", "number.of.surfaces..calcula.sozinho.", "restoration.Class.1"))]

# Ajuste de nome de colunas
names(data)[names(data) == "patient.number"] = "id"
names(data)[names(data) == "male.female"] = "sexo"
names(data)[names(data) == "date.of.birth"] = "nascimento"
names(data)[names(data) == "date.of.intervention"] = "data.intervencao"
names(data)[names(data) == "age.at.placement..calcula.automatico."] = "idade"
names(data)[names(data) == "intervention.type..restoration.R..endo..exo..implant..placa.de.bruxismo.b..home.bleaching.hb..office.bleaching.ob..internal.bleaching.ib..periodontal.suRrgery.ps..protese.parcial.fixa.ppf..pr.tese.adesiva..pa..esplintagem.es.."] = "tipo.invervencao"
names(data)[names(data) == "vItality..yes.no..olhar.nos.encaminhamentos.para.endo..olhar.data..olhar.rx..."] = "vitalidade"
names(data)[names(data) == "intervention...restoration..new..repair."] = "novo.restauracao"
names(data)[names(data) == "reason.for.treatment..caries..fracture..endo........completar.depois.de.olhar.RX.1"] = "motivo"
names(data)[names(data) == "tooth.number"] = "numero.dente"
names(data)[names(data) == "tooth.type.IC.IL.C.PM.M"] = "tipo.dente"
names(data)[names(data) == "arch.Upper.Lower"] = "arcada"
names(data)[names(data) == "side.Left.Right"] = "lado"
names(data)[names(data) == "restoration.type..direct.indirect."] = "tipo.restauracao"
names(data)[names(data) == "restoration.material..resin.composite.RC..ceramic.C."] = "material.restauracao"
names(data)[names(data) == "restored.surfaces"] = "superficies.restauradas"
names(data)[names(data) == "number.of.surfaces..calcula.sozinho."] = "superficies.restauradas.count"
names(data)[names(data) == "status..1.alive..2.repaired.and.alive..3.repaired.and.faile.4..failed.never.repaired."] = "status"
names(data)[names(data) == "failure.date.1..data.quando.houve.a.substitui.Æo.da.restaura.Æo."] = "data.falha.1"
names(data)[names(data) == "failure.date.2..se.o.reparo.for.considerado.como.falha.da.restaura.Æo..data.1..reparo."] = "data.falha.2"
names(data)[names(data) == "censored...apenas.restaura.äes.nÆo.falhadas.com.status.1.e.2..data.ultimo.dia.que.o.paciente.foi.no.Paullo."] = "censored"
names(data)[names(data) == "tempo.censored...alive.e.4"] = "tempo.censored"
names(data)[names(data) == "tempo.falha...reparo.SUCESSO"] = "tempo.falha.sucesso"
names(data)[names(data) == "tempo.falha...reparo.FALHA"] = "tempo.falha.falha"
names(data)[names(data) == "Restoration.Price"] = "preco"
names(data)[names(data) == "Adhesive"] = "adesivo"
names(data)[names(data) == "filling.material.category"] = "material.preenchimento"
names(data)[names(data) == "restoration.Class"] = "classe"

names(data)

# Ajustes de colunas
data$sexo = as.character(data$sexo)
data$sexo[data$sexo == "F" | data$sexo == "f"] <- "Feminino"
data$sexo[data$sexo == "M" | data$sexo == "m"] <- "Masculino"
data$sexo[data$sexo == ""] <- NA
data$sexo = as.factor(data$sexo)

data$nascimento = as.Date(data$nascimento, "%d/%m/%Y")

data$data.intervencao = as.Date(data$data.intervencao, "%d/%m/%Y")

data$falha = as.factor(data$falha)

data$tipo.invervencao = as.character(data$tipo.invervencao)
data$tipo.invervencao[data$tipo.invervencao == "0"] <- "Restauração"
data$tipo.invervencao[data$tipo.invervencao == "ES"] <- "Esplintagem"
data$tipo.invervencao[data$tipo.invervencao == "PA"] <- "Prótese adesiva"
data$tipo.invervencao[data$tipo.invervencao == ""] <- NA
data$tipo.invervencao = as.factor(data$tipo.invervencao)

data$vitalidade = as.character(data$vitalidade)
data$vitalidade[data$vitalidade == "y" | data$vitalidade == "Y"] <- "Sim"
data$vitalidade[data$vitalidade == "N"] <- "Não"
data$vitalidade[data$vitalidade == "" | data$vitalidade == "99"] <- NA
data$vitalidade = as.factor(data$vitalidade)

data$novo.restauracao = as.character(data$novo.restauracao)
data$novo.restauracao[data$novo.restauracao == "NEW"] <- "Novo"
data$novo.restauracao[data$novo.restauracao == "REPAIR" | data$novo.restauracao == "REPAIR/RIBBOND"] <- "Reparo"
data$novo.restauracao[data$novo.restauracao == ""] <- NA
data$novo.restauracao = as.factor(data$novo.restauracao)

data$motivo = as.character(data$motivo)
data$motivo[data$motivo == "CARIE" | data$motivo == "carie" | data$motivo == "Carie" | data$motivo == "c rie"] <- "Cárie"
# TODO: Os próximos dois são a mesma coisa?
data$motivo[grepl("infiltra.* restau.*", data$motivo) | grepl("INFILTRA.* RESTAU.*", data$motivo)] <- "Infiltração da restauração"
data$motivo[grepl("infiltra.*", data$motivo) | grepl("INFILTRA.*", data$motivo)] <- "Infiltração"
# TODO: Os próximos três são a mesma coisa?
data$motivo[data$motivo == "FECHAMENTO DE DIASTEMA"] <- "Fechamento de diastema"
data$motivo[data$motivo == "ESTETICA"] <- "Estética"
data$motivo[data$motivo == "ESTETICA(FECHAMENTO DE DIASTEMA)" | data$motivo == "FECHAMENTO DE DIASTEMA" | data$motivo == "FECHAMENTO DIASTEMA"] <- "Estética (Fechamento de diastema)"
data$motivo[data$motivo == "ESTETICA(CONOIDE)"] <- "Estética (Conoide)"
data$motivo[data$motivo == "FRATURA" | data$motivo == "FRACTURE"] <- "Fratura"
data$motivo[data$motivo == "TRINCA"] <- "Trinca"
data$motivo[data$motivo == "ENDO"] <- "Endo"
data$motivo[data$motivo == "FORMA"] <- "Forma"
data$motivo[data$motivo == "SENSIBILIDADE"] <- "Sensibilidade"
data$motivo[data$motivo == "PONTO DE CONTATO"] <- "Ponto de contato"
data$motivo[grepl("SUBSTITUI.*RESTAU.*MET.*LICA", data$motivo) | grepl("SUBSTITUI.*RESTAU", data$motivo)] <- "Substituição de restauração"
data$motivo[data$motivo == "" | data$motivo == "99"] <- NA
data$motivo = as.factor(data$motivo)

data$tipo.dente = as.character(data$tipo.dente)
data$tipo.dente[data$tipo.dente == "IL"] <- "Incisivo lateral"
data$tipo.dente[data$tipo.dente == "IC"] <- "Incisivo central"
data$tipo.dente[data$tipo.dente == "C"] <- "Canino"
data$tipo.dente[data$tipo.dente == "PM"] <- "Pré-molar"
data$tipo.dente[data$tipo.dente == "M"] <- "Molar"
data$tipo.dente[data$tipo.dente == "" | data$tipo.dente == "99"] <- NA
data$tipo.dente = as.factor(data$tipo.dente)

data$arcada = as.character(data$arcada)
data$arcada[data$arcada == "L" | data$arcada == "I"] <- "Inferior"
data$arcada[data$arcada == "U"] <- "Superior"
data$arcada[data$arcada == "" | data$arcada == "99"] <- NA
data$arcada = as.factor(data$arcada)

data$lado = as.character(data$lado)
data$lado[data$lado == "LEFT"] <- "Esquerdo"
data$lado[data$lado == "RIGHT"] <- "Direito"
data$lado[data$lado == "" | data$lado == "99"] <- NA
data$lado = as.factor(data$lado)

data$tipo.restauracao = as.character(data$tipo.restauracao)
data$tipo.restauracao[data$tipo.restauracao == "D"] <- "Direta"
data$tipo.restauracao[data$tipo.restauracao == "I"] <- "Indireta"
data$tipo.restauracao[data$tipo.restauracao == "" | data$lado == "99"] <- NA
data$tipo.restauracao = as.factor(data$tipo.restauracao)

data$material.restauracao = as.character(data$material.restauracao)
data$material.restauracao[data$material.restauracao == "C" | data$material.restauracao == "C(PROTESE SOBRE IMPLANTE)"] <- "Cerâmica"
data$material.restauracao[data$material.restauracao == "RC"] <- "Composto de resina"
data$material.restauracao[data$material.restauracao == "ADESIVA COM RIBBOND"] <- "Ribbond (Reforço adesivo)"
data$material.restauracao[data$material.restauracao == "" | data$material.restauracao == "99" | data$material.restauracao == "I"] <- NA
data$material.restauracao = as.factor(data$material.restauracao)

# Referência: http://www.hs-menezes.com.br/images/FACESAUDIMPNG.PNG
data$superficies.restauradas = as.character(data$superficies.restauradas)
data$superficies.restauradas[data$superficies.restauradas == "INCISAL"] = "I"
data$superficies.restauradas[data$superficies.restauradas == "99"] = NA
data$superficies.restauradas = as.factor(data$superficies.restauradas)
data$superficie.lingual.palatal = regexpr('L', data$superficies.restauradas) >= 0 | regexpr('P', data$superficies.restauradas) >= 0
data$superficie.vestibular = regexpr('V', data$superficies.restauradas) >= 0
data$superficie.oclusal.incisal = regexpr('O', data$superficies.restauradas) >= 0 | regexpr('I', data$superficies.restauradas) >= 0
data$superficie.mesial = regexpr('M', data$superficies.restauradas) >= 0
data$superficie.distal = regexpr('D', data$superficies.restauradas) >= 0

data$superficies.restauradas.count = nchar(as.character(data$superficies.restauradas))

summary(data)
head(data)

write.csv2(data, file = "dataset.csv", fileEncoding = "utf-8")
