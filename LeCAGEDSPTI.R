library(dplyr)
CAGEDMOVSPTI <- read.table("cagedmovsp.csv",header=TRUE,sep=";",dec=",")
ocupacoes<-c("212405","317110")
CAGEDMOVSPTI <- CAGEDMOVSPTI[(CAGEDMOVSPTI$cbo2002ocupação %in% ocupacoes),] 
summary(CAGEDMOVSPTI)

CAGEDMOVSPTI$competência <- as.factor(CAGEDMOVSPTI$competência)
CAGEDMOVSPTI$cbo2002ocupação <- as.factor(CAGEDMOVSPTI$cbo2002ocupação)
CAGEDMOVSPTI$graudeinstrução <- as.factor(CAGEDMOVSPTI$graudeinstrução)
CAGEDMOVSPTI$raçacor <- as.factor(CAGEDMOVSPTI$raçacor)
CAGEDMOVSPTI$sexo <- as.factor(CAGEDMOVSPTI$sexo)
CAGEDMOVSPTI$tipomovimentação <- as.factor(CAGEDMOVSPTI$tipomovimentação)
CAGEDMOVSPTI$tipodedeficiência <- as.factor(CAGEDMOVSPTI$tipodedeficiência)
CAGEDMOVSPTI$indtrabparcial <- as.factor(CAGEDMOVSPTI$indtrabparcial)
CAGEDMOVSPTI$tamestabjan <- as.factor(CAGEDMOVSPTI$tamestabjan)
CAGEDMOVSPTI$categoria <- as.factor(CAGEDMOVSPTI$categoria)
CAGEDMOVSPTI$tipoempregador <- as.factor(CAGEDMOVSPTI$tipoempregador)
CAGEDMOVSPTI$tipoestabelecimento <- as.factor(CAGEDMOVSPTI$tipoestabelecimento)
CAGEDMOVSPTI$indtrabintermitente <- as.factor(CAGEDMOVSPTI$indtrabintermitente)
CAGEDMOVSPTI$indicadoraprendiz <- as.factor(CAGEDMOVSPTI$indicadoraprendiz)

summary(CAGEDMOVSPTI)

write.table(CAGEDMOVSPTI, file = "./cagedmovspti.csv", row.names = FALSE, sep = ";", dec = ",")

contspti<-CAGEDMOVSPTI[CAGEDMOVSPTI$saldomovimentação>0,]
write.table(contspti, file = "./contratacaospti.csv", row.names = FALSE, sep = ";", dec = ",")
demissaospti<-CAGEDMOVSPTI[CAGEDMOVSPTI$saldomovimentação<0,]
write.table(demissaospti, file = "./demissaospti.csv", row.names = FALSE, sep = ";", dec = ",")

