library(dplyr)
contratacoes <- read.table("contratacaospti.csv",header=TRUE,sep=";",dec=",")
summary(contratacoes)
demissoes <- read.table("demissaospti.csv",header=TRUE,sep=";",dec=",")
ocupacoes<-c("212405","317110")

contratacoes$competência <- as.factor(contratacoes$competência)
contratacoes$cbo2002ocupação <- as.factor(contratacoes$cbo2002ocupação)
contratacoes$graudeinstrução <- as.factor(contratacoes$graudeinstrução)
contratacoes$raçacor <- as.factor(contratacoes$raçacor)
contratacoes$sexo <- as.factor(contratacoes$sexo)
contratacoes$tipomovimentação <- as.factor(contratacoes$tipomovimentação)
contratacoes$tipodedeficiência <- as.factor(contratacoes$tipodedeficiência)
contratacoes$indtrabparcial <- as.factor(contratacoes$indtrabparcial)
contratacoes$tamestabjan <- as.factor(contratacoes$tamestabjan)
contratacoes$categoria <- as.factor(contratacoes$categoria)
contratacoes$tipoempregador <- as.factor(contratacoes$tipoempregador)
contratacoes$tipoestabelecimento <- as.factor(contratacoes$tipoestabelecimento)
contratacoes$indtrabintermitente <- as.factor(contratacoes$indtrabintermitente)
contratacoes$indicadoraprendiz <- as.factor(contratacoes$indicadoraprendiz)
contratacoes$tempoemprego<-NULL
summary(contratacoes)
#18703
table(contratacoes$cbo2002ocupação,contratacoes$competência)
#        202001 202002 202003 202004 202005 202006 202007 202008 202009
#212405   1919   1717   2005   1132   1161   1369   1714   1625   1798
#317110    651    483    500    269    252    387    521    600    600

table(contratacoes$cbo2002ocupação)
# 212405 - 14440
# 317110 - 4263

table(demissoes$cbo2002ocupação,demissoes$competência)
#        202001 202002 202003 202004 202005 202006 202007 202008 202009
#212405   1581   1446   1670   1363    998   1256   1188   1261   1437
#317110    436    494    489    447    319    357    431    392    423

table(demissoes$cbo2002ocupação)
#212405 - 12200
#317110 -  3788 

#CAGEDTI$tipoempregador <- Recode(CAGEDTI$tipoempregador, '0 = "CNPJ RAIZ"; 2 = "CPF"; 9 = "Não identificado"', as.factor=TRUE)
#18703
# A) ##########################################################################################################
contratacoestratado<-contratacoes[contratacoes$tipoempregador==0,]
contratacoestratado$tipoempregador<-NULL
contratacoestratado$tipoestabelecimento<-NULL
#18693
# B) #########################################################################################################
contratacoestratado<-contratacoestratado[contratacoestratado$salário>1045 & contratacoestratado$salário<30000,]
#18637
# c) ############################################################################################################
contratacoestratado<-contratacoestratado[contratacoestratado$indtrabparcial==0 & contratacoestratado$indicadoraprendiz==0 & contratacoestratado$indtrabintermitente==0,]
contratacoestratado$indicadoraprendiz<-NULL
contratacoestratado$indtrabintermitente <-NULL
contratacoestratado$indtrabparcial<-NULL
#18426
# D) ############################################################################################################
contratacoestratado<-contratacoestratado[contratacoestratado$horascontratuais>=20,]
#18404
# E) ##############################################################################################################
# 101	Empregado - Geral, inclusive o empregado público da administração direta ou indireta contratado pela CLT
contratacoestratado<-contratacoestratado[contratacoestratado$categoria==101,]
contratacoestratado$categoria<-NULL
# F) ###############################################################################################################
#17934
contratacoestratado<-contratacoestratado[!(contratacoestratado$graudeinstrução==1),] 
#17926
contratacoestratado<-contratacoestratado[!(contratacoestratado$graudeinstrução==2),]
#17925
contratacoestratado<-contratacoestratado[!(contratacoestratado$graudeinstrução==3),]
#17924
contratacoestratado<-contratacoestratado[!(contratacoestratado$graudeinstrução==4),]
#17923
contratacoestratado<-contratacoestratado[!(contratacoestratado$graudeinstrução==5),]
#17910
contratacoestratado<-contratacoestratado[!(contratacoestratado$graudeinstrução==99),]
#17910
# G) #################################################################################################################
#10	Admissão por primeiro emprego
#20	Admissão por reemprego
#35	Admissão por reintegração
contratacoestratado$primeiroemprego<-contratacoestratado$tipomovimentação==10
contratacoestratado$tipomovimentação<-NULL

contratacoestratado$saldomovimentação<-NULL
summary(contratacoestratado)

table(contratacoestratado$seção)
#17910
#H) ###############################################################################################
# Empresas com mais de 49 empregados
# ###############################################################################################################
contratacoestratado<-contratacoestratado[!(contratacoestratado$tamestabjan==1),] 
#17509
contratacoestratado<-contratacoestratado[!(contratacoestratado$tamestabjan==2),]
#17088
contratacoestratado<-contratacoestratado[!(contratacoestratado$tamestabjan==3),]
#16538
contratacoestratado<-contratacoestratado[!(contratacoestratado$tamestabjan==4),]
#15627
contratacoestratado<-contratacoestratado[!(contratacoestratado$tamestabjan==99),]
#15627

Analistas<-contratacoestratado[contratacoestratado$cbo2002ocupação==212405,]
Analistas$cbo2002ocupação<-NULL
summary(Analistas)
write.table(Analistas, file = "./analistasSP.csv", row.names = FALSE, sep = ";", dec = ",")
#12443
Programadores<-contratacoestratado[contratacoestratado$cbo2002ocupação==317110,]
Programadores$cbo2002ocupação<-NULL
summary(Programadores)
write.table(Programadores, file = "./programadoresSP.csv", row.names = FALSE, sep = ";", dec = ",")
#3184