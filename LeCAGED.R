library(dplyr)
CAGEDMOV1 <- read.table("CAGEDMOV202001.txt",header=TRUE,sep=";",dec=".")
CAGEDMOV2 <- read.table("CAGEDMOV202002.txt",header=TRUE,sep=";",dec=".")
CAGEDMOV3 <- read.table("CAGEDMOV202003.txt",header=TRUE,sep=";",dec=".")
CAGEDMOV4 <- read.table("CAGEDMOV202004.txt",header=TRUE,sep=";",dec=".")
CAGEDMOV5 <- read.table("CAGEDMOV202005.txt",header=TRUE,sep=";",dec=".")
CAGEDMOV6 <- read.table("CAGEDMOV202006.txt",header=TRUE,sep=";",dec=".")
CAGEDMOV7 <- read.table("CAGEDMOV202007.txt",header=TRUE,sep=";",dec=".")
CAGEDMOV8 <- read.table("CAGEDMOV202008.txt",header=TRUE,sep=";",dec=".")
CAGEDMOV9 <- read.table("CAGEDMOV202009.txt",header=TRUE,sep=";",dec=".")

CAGEDMOV2020 <- CAGEDMOV1
CAGEDMOV2020 <- bind_rows(CAGEDMOV2020,CAGEDMOV2)
CAGEDMOV2020 <- bind_rows(CAGEDMOV2020,CAGEDMOV3)
CAGEDMOV2020 <- bind_rows(CAGEDMOV2020,CAGEDMOV4)
CAGEDMOV2020 <- bind_rows(CAGEDMOV2020,CAGEDMOV5)
CAGEDMOV2020 <- bind_rows(CAGEDMOV2020,CAGEDMOV6)
CAGEDMOV2020 <- bind_rows(CAGEDMOV2020,CAGEDMOV7)
CAGEDMOV2020 <- bind_rows(CAGEDMOV2020,CAGEDMOV8)
CAGEDMOV2020 <- bind_rows(CAGEDMOV2020,CAGEDMOV9)
summary(CAGEDMOV2020)
CAGEDMOV2020$competência <- as.factor(CAGEDMOV2020$competência)
CAGEDMOV2020$região <- as.factor(CAGEDMOV2020$região)
CAGEDMOV2020$uf <- as.factor(CAGEDMOV2020$uf)
CAGEDMOV2020$cbo2002ocupação <- as.factor(CAGEDMOV2020$cbo2002ocupação)
CAGEDMOV2020$graudeinstrução <- as.factor(CAGEDMOV2020$graudeinstrução)
CAGEDMOV2020$raçacor <- as.factor(CAGEDMOV2020$raçacor)
CAGEDMOV2020$sexo <- as.factor(CAGEDMOV2020$sexo)
CAGEDMOV2020$tipomovimentação <- as.factor(CAGEDMOV2020$tipomovimentação)
CAGEDMOV2020$tipodedeficiência <- as.factor(CAGEDMOV2020$tipodedeficiência)
CAGEDMOV2020$indtrabparcial <- as.factor(CAGEDMOV2020$indtrabparcial)
CAGEDMOV2020$tamestabjan <- as.factor(CAGEDMOV2020$tamestabjan)
CAGEDMOV2020$subclasse <- NULL
CAGEDMOV2020$categoria <- as.factor(CAGEDMOV2020$categoria)
CAGEDMOV2020$tipoempregador <- as.factor(CAGEDMOV2020$tipoempregador)
CAGEDMOV2020$tipoestabelecimento <- as.factor(CAGEDMOV2020$tipoestabelecimento)
CAGEDMOV2020$indtrabintermitente <- as.factor(CAGEDMOV2020$indtrabintermitente)
CAGEDMOV2020$indicadoraprendiz <- as.factor(CAGEDMOV2020$indicadoraprendiz)
CAGEDMOV2020$fonte <- NULL
CAGEDMOV2020a<-CAGEDMOV2020[(CAGEDMOV2020$saldomovimentação>0 & CAGEDMOV2020$horascontratuais>0) | CAGEDMOV2020$saldomovimentação<0,]
CAGEDMOV2020<-CAGEDMOV2020a[(CAGEDMOV2020a$saldomovimentação>0 & CAGEDMOV2020a$salário>0) | CAGEDMOV2020a$saldomovimentação<0,]

summary(CAGEDMOV2020)


write.table(CAGEDMOV2020, file = "./cagedmov2020.csv", row.names = FALSE, sep = ";", dec = ",")
