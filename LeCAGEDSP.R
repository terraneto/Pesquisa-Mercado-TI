library(dplyr)
CAGEDMOVSP <- read.table("CAGEDMOV2020.csv",header=TRUE,sep=";",dec=",")
CAGEDMOVSP <- CAGEDMOVSP[CAGEDMOVSP$município==355030,]

CAGEDMOVSP$competência <- as.factor(CAGEDMOVSP$competência)
CAGEDMOVSP$região <- as.factor(CAGEDMOVSP$região)
CAGEDMOVSP$uf <- as.factor(CAGEDMOVSP$uf)
CAGEDMOVSP$cbo2002ocupação <- as.factor(CAGEDMOVSP$cbo2002ocupação)
CAGEDMOVSP$graudeinstrução <- as.factor(CAGEDMOVSP$graudeinstrução)
CAGEDMOVSP$raçacor <- as.factor(CAGEDMOVSP$raçacor)
CAGEDMOVSP$sexo <- as.factor(CAGEDMOVSP$sexo)
CAGEDMOVSP$tipomovimentação <- as.factor(CAGEDMOVSP$tipomovimentação)
CAGEDMOVSP$tipodedeficiência <- as.factor(CAGEDMOVSP$tipodedeficiência)
CAGEDMOVSP$indtrabparcial <- as.factor(CAGEDMOVSP$indtrabparcial)
CAGEDMOVSP$tamestabjan <- as.factor(CAGEDMOVSP$tamestabjan)
CAGEDMOVSP$categoria <- as.factor(CAGEDMOVSP$categoria)
CAGEDMOVSP$tipoempregador <- as.factor(CAGEDMOVSP$tipoempregador)
CAGEDMOVSP$tipoestabelecimento <- as.factor(CAGEDMOVSP$tipoestabelecimento)
CAGEDMOVSP$indtrabintermitente <- as.factor(CAGEDMOVSP$indtrabintermitente)
CAGEDMOVSP$indicadoraprendiz <- as.factor(CAGEDMOVSP$indicadoraprendiz)

CAGEDMOVSP$município<-NULL
CAGEDMOVSP$região<-NULL
CAGEDMOVSP$uf<-NULL

summary(CAGEDMOVSP)

write.table(CAGEDMOVSP, file = "./cagedmovsp.csv", row.names = FALSE, sep = ";", dec = ",")