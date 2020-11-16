library(dplyr)
Analistas <- read.table("analistasSP.csv",header=TRUE,sep=";",dec=",")
summary(Analistas)
#12443
Analistas$competência <- as.factor(Analistas$competência)
Analistas$graudeinstrução <- as.factor(Analistas$graudeinstrução)
Analistas$raçacor <- as.factor(Analistas$raçacor)
Analistas$sexo <- as.factor(Analistas$sexo)
Analistas$tipodedeficiência <- as.factor(Analistas$tipodedeficiência)
Analistas$tamestabjan <- as.factor(Analistas$tamestabjan)
summary(Analistas)

#table(Analistas$tamestabjan)
#Analistas<-Analistas[!(Analistas$seção=="K"),]
#Analistas<-Analistas[!(Analistas$seção=="Q"),]
Analistas$seção<-NULL
#9346  / 9338

### Analisar a divisão de competências
ms<-aov(Analistas$salariohora~Analistas$competência)
ms
summary(ms)
library(car)
qqPlot(resid(ms), dist='norm',envelope=.95)
#Comparação de média par a par
TukeyHSD(ms)
#pré-pandemia
a1<-Analistas[Analistas$competência=="202001" | Analistas$competência=="202002" | Analistas$competência=="202003",]
ar<-Analistas[!(Analistas$competência=="202001" | Analistas$competência=="202002" | Analistas$competência=="202003"),]
p1<-ar[ar$competência=="202008" | ar$competência=="202009"   ,]
ar2<-ar[!(ar$competência=="202008" | ar$competência=="202009")  ,]
a2<-ar2[ar2$competência=="202004",]
a3<-ar2[ar2$competência=="202005" | ar2$competência=="202006",]
#
ms<-aov(a3$salariohora~a3$competência)
ms
summary(ms)
library(car)
qqPlot(resid(ms), dist='norm',envelope=.95)
#Comparação de média par a par
TukeyHSD(ms)

a1$competência<-NULL
a2$competência<-NULL
a3$competência<-NULL
p1$competência<-NULL

m1 <- lm(a1$salariohora~. -salário -horascontratuais , data = a1)
summary(m1)
stepw <- step(m1, direction="both", trace=FALSE)
summary(stepw)
m2 <- lm(a2$salariohora~. -salário -horascontratuais , data = a2)
summary(m2)
m3 <- lm(a3$salariohora~. -salário -horascontratuais , data = a3)
summary(m3)
m4 <- lm(p1$salariohora~. -salário -horascontratuais , data = p1)
summary(m4)
stepw <- step(m4, direction="both", trace=FALSE)
summary(stepw)
m5 <- lm(p1$salário~. -salariohora , data = p1)
summary(m5)
stepw5 <- step(m5, direction="both", trace=FALSE)
summary(stepw5)
ms<-aov(stepw5)
summary(ms)
shapiro.test(resid(ms))
library(car)
qqPlot(resid(ms), dist='norm',envelope=.99)

library(olsrr)
ols_plot_resid_qq(m5)
ols_test_normality(m5)
ols_test_correlation(m5)
ols_plot_resid_fit(m5)
ols_plot_resid_hist(m5)
par(mfrow=c(2,2))
plot(m5, which = 1:4)

m6 <- lm(p1$salário~raçacor -salariohora , data = p1)
summary(m6)
ols_plot_resid_qq(m6)
ols_test_normality(m6)
ols_test_correlation(m6)
ols_plot_resid_fit(m6)
ols_plot_resid_hist(m6)
par(mfrow=c(2,2))
plot(m6, which = 1:4)

#########################################################################
# Seção tem influência no salário?
ms<-aov(Analistas$salariohora~. -salário -horascontratuais)
ms
summary(ms)
mean(p1$salário)
sd(p1$salário)
library(car)
leveneTest(Analistas$salariohora~Analistas$seção, data = Analistas)
# se valor-p maior que 0,05 variâncias iguais - dados homogêneos 

shapiro.test(resid(ms))
# de 3 até 5000 

kst<-ks.test(ms$residuals,"pnorm",1, .16)
summary(kst)

#Teste Anderson-darling
library(nortest)
ad.test(resid(ms))

#teste Lilliefors
lillie.test(resid(ms))

cvm.test(resid(ms))

library(car)
qqPlot(resid(ms), dist='norm',envelope=.95)

#Comparação de média par a par
TukeyHSD(ms)

table(Analistas$seção)





library(olsrr)
ms<-lm(Analistas$salariohora~Analistas$seção,data=Analistas)
ols_plot_resid_qq(ms)
ols_test_normality(ms)
ols_test_correlation(ms)
ols_plot_resid_fit(ms)
ols_plot_resid_hist(ms)
par(mfrow=c(2,2))
plot(ms, which = 1:4)




hist(Analistas$horascontratuais)
a1<-Analistas[Analistas$competência=="202001" | Analistas$competência=="202002" | Analistas$competência=="202003",]
a2<-Analistas[( Analistas$competência=="202005" | Analistas$competência=="202006"),]
p1<-Analistas[Analistas$competência=="202008" | Analistas$competência=="202009" ,]
a1$competência<-NULL
lm1<-lm(a1$salariohora~. -salário -horascontratuais, data = a1)

aj1<-aj[aj$competência=="202001" | aj$competência=="202002" | aj$competência=="202003",]
aj2<-aj[( aj$competência=="202005" | aj$competência=="202006"),]
pj1<-aj[aj$competência=="202008" | aj$competência=="202009" ,]
aj1$competência<-NULL
summary(aj1)
lmj1<-lm(aj1$salariohora~. -salário -horascontratuais, data = aj1)
summary(lmj1)
library(car)
ols_plot_resid_qq(lmj1)
ols_test_normality(lmj1)
ols_test_correlation(lmj1)
ols_plot_resid_fit(lmj1)
ols_plot_resid_hist(lmj1)
par(mfrow=c(2,2))
plot(lmj1, which = 1:4)

aj2<-aj1[aj1$salariohora<180,]
lmj2<-lm(aj2$salariohora~. -salário -horascontratuais, data = aj2)
summary(lmj2)
library(car)
ols_plot_resid_qq(lmj2)
ols_test_normality(lmj2)
ols_test_correlation(lmj2)
ols_plot_resid_fit(lmj2)
ols_plot_resid_hist(lmj2)
par(mfrow=c(2,2))
plot(lmj2, which = 1:4)

plot.new()

pairs(Analistas$salariohora ~ .,
      panel = panel.smooth,
      data = Analistas, main = "Expectativa de Vida países desenvolvidos")

# corrplot
library(corrplot)
cor <- cor(Analistas$salariohora)
cor

plot.new()
par(mfrow = c(1, 1))
corrplot.mixed(cor, upper = "ellipse")

plot.new()
par(mfrow = c(1, 1))
corrplot(cor(Analistas$salariohora), method = "number", main="Correlação Analistas")

library(car)


a<-aov(a1$salariohora~a1$competência )
summary(a)
leveneTest(a1$salariohora~a1$competência, data = a1)
summary(a)
shapiro.test(a$residuals)
TukeyHSD(a)
a<-lm(a1$salariohora~. -salário -horascontratuais,data = a1)
ols_plot_resid_qq(a)
ols_test_normality(a)
ols_test_correlation(a)
ols_plot_resid_fit(a)
ols_plot_resid_hist(a)
par(mfrow=c(2,2))
plot(a, which = 1:4)

b<-aov(a2$salariohora~a2$competência )
summary(b)
leveneTest(a2$salariohora~a2$competência, data = a2)
summary(b)
shapiro.test(b$residuals)
TukeyHSD(b)
b<-lm(a2$salariohora~. -salário -horascontratuais,data = a2)
ols_plot_resid_qq(b)
ols_test_normality(b)
ols_test_correlation(b)
ols_plot_resid_fit(b)
ols_plot_resid_hist(b)
par(mfrow=c(2,2))
plot(b, which = 1:4)

m2<-aov(a2$salariohora~a2$competência )
summary(m2)
leveneTest(a2$salariohora~a2$competência, data = a2)
summary(m2)
shapiro.test(m2$residuals)
TukeyHSD(m2)



c<-aov(p1$salariohora~p1$competência )
summary(c)
leveneTest(p1$salariohora~p1$competência, data = p1)
summary(c)
shapiro.test(c$residuals)
TukeyHSD(c)
c<-lm(p1$salariohora~p1$competência -salário -horascontratuais,data = p1)
ols_plot_resid_qq(c)
ols_test_normality(c)
ols_test_correlation(c)
ols_plot_resid_fit(c)
ols_plot_resid_hist(c)
par(mfrow=c(2,2))
plot(c, which = 1:4)


library(ggplot2)
ggboxplot(Analistas, x = "competência", y = "salariohora",
          fill = "competência", 
          palette = c("#0f8bf7", "#f7830f", "#ff12d0", "#2a8008","#0f8bf7", "#f7830f", "#ff12d0", "#2a8008","#0f8bf7"),
          order = c("202001","202002","202003","202004","202005","202006","202007","202008","202009"),
          ylab = "Salário/hora", xlab = "Meses de competência")

ggplot(Analistas, aes(x = competência,fill = salariohora)) +
  geom_histogram(color = "black", binwidth = 50)+
  facet_grid(salariohora ~ .) +
  labs(y = 'Frequência') +
  scale_fill_manual(values=c("#0f8bf7", "#f7830f", "#ff12d0", "#2a8008"))+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), legend.position = 'top',
        axis.line = element_line(colour = "black"))

library(ggpubr)
ggviolin (Analistas, x = "competência", y = "salariohora", fill = "competência",
          palette = c("#0f8bf7", "#f7830f", "#ff12d0", "#2a8008","#0f8bf7", "#f7830f", "#ff12d0", "#2a8008","#0f8bf7"),
          order = c("202001","202002","202003","202004","202005","202006","202007","202008","202009"),
          add = "boxplot", add.params = list(fill = "white"),
          ylab = "Salário/hora", xlab = "Meses de competência")


b1<-Analistas[Analistas$tamestabjan=="2" | Analistas$tamestabjan=="3",]
b<-lm(b1$salariohora~b1$tamestabjan -salário -horascontratuais, data =b1 )
b<-aov(b1$salariohora~b1$tamestabjan )
summary(b)
leveneTest(b1$salariohora~b1$tamestabjan, data = b1)
summary(b)
shapiro.test(b$residuals)
TukeyHSD(b)



Analistaspre<-Analistas[Analistas$competência %in% c("202001","202002","202003"),]
mean(Analistaspre$salariohora)*40
Analistaspos<-Analistas[Analistas$competência %in% c("202008","202009"),]
mean(Analistaspos$salariohora)*40
Analistaspos$competência<-NULL

plot(analistas4044$competência,analistas4044$salário)
summary(analistas4044)

Programadores<-contratacoestratado[contratacoestratado$cbo2002ocupação==317110,]
Programadores$cbo2002ocupação<-NULL
summary(Programadores)

inf <- influence.measures(modelo) 
summary(inf)

var<-c(which(apply(inf$is.inf, 1, any)))
var

analistas4044<-analistas4044[!(row.names(analistas4044) %in% c(16495,6950,2745)),]  
var),]
summary(Analistas)
table(Analistas$tamestabjan)
modelo <- lm(Analistas$salariohora~. -salário -horascontratuais -seção -competência, data = Analistas)
summary(modelo)

stepw <- step(modelo, direction="both", trace=FALSE)
summary(stepw)

ols_plot_resid_qq(modelo)
ols_test_normality(modelo)
ols_test_correlation(modelo)
ols_plot_resid_fit(modelo)
ols_plot_resid_hist(modelo)

par(mfrow=c(2,2))
plot(modelo, which = 1:4)



#retirando os influenciadores
lifeemdes.ajustado<-lifeemdes[-var,]



plot(Analistas$sexo,Analistas$salariohora)
plot(Analistas$graudeinstrução,Analistas$salariohora)
#ocupacoes<-c("212310","212315","212320","212405","212410","212420","317105","317110","142510","313220")


secao <- read.csv2("secao.CSV",sep=";") 
strdesc='"'
for(i in 1:nrow(secao)){
  strdesc=paste(strdesc,secao[i,1],sep = '')
  strdesc=paste(strdesc,'" = "',sep = '')
  strdesc=paste(strdesc,secao[i,2],sep = '')
  if(i<nrow(secao)){
    strdesc=paste(strdesc,'"; "',sep = '')
  } else {
    strdesc=paste(strdesc,'"',sep = '')    
  }
} 
strdesc
CAGEDTI$seção <- Recode(CAGEDTI$seção, strdesc, as.factor=TRUE)


graudeinstrucao <- read.csv2("graudeinstrucao.CSV",sep=";") 
strdesc=''
for(i in 1:nrow(graudeinstrucao)){
  strdesc=paste(strdesc,graudeinstrucao[i,1],sep = '')
  strdesc=paste(strdesc,' = "',sep = '')
  strdesc=paste(strdesc,graudeinstrucao[i,2],sep = '')
  if(i<nrow(graudeinstrucao)){
    strdesc=paste(strdesc,'"; ',sep = '')
  } else {
    strdesc=paste(strdesc,'"',sep = '')    
  }
} 
strdesc
CAGEDTI$graudeinstrução <- Recode(CAGEDTI$graudeinstrução, strdesc, as.factor=TRUE)

racacor <- read.csv2("racacor.CSV",sep=";") 
strracacor=''
for(i in 1:nrow(racacor)){
  strracacor=paste(strracacor,racacor[i,1],sep = '')
  strracacor=paste(strracacor,' = "',sep = '')
  strracacor=paste(strracacor,racacor[i,2],sep = '')
  if(i<nrow(racacor)){
    strracacor=paste(strracacor,'"; ',sep = '')
  } else {
    strracacor=paste(strracacor,'"',sep = '')    
  }
} 
strracacor
CAGEDTI$raçacor <- Recode(CAGEDTI$raçacor, strracacor, as.factor=TRUE)

sexo <- read.csv2("sexo.CSV",sep=";") 
CAGEDTI$sexo <- Recode(CAGEDTI$sexo, '1 = "Homem"; 3 = "Mulher"; 9 = "Não identificado"', as.factor=TRUE)

tipodedeficiencia <- read.csv2("tipodedeficiencia.CSV",sep=";") 
strracacor=''
for(i in 1:nrow(tipodedeficiencia)){
  strracacor=paste(strracacor,tipodedeficiencia[i,1],sep = '')
  strracacor=paste(strracacor,' = "',sep = '')
  strracacor=paste(strracacor,tipodedeficiencia[i,2],sep = '')
  if(i<nrow(tipodedeficiencia)){
    strracacor=paste(strracacor,'"; ',sep = '')
  } else {
    strracacor=paste(strracacor,'"',sep = '')    
  }
} 
strracacor
CAGEDTI$tipodedeficiência <- Recode(CAGEDTI$tipodedeficiência, strracacor, as.factor=TRUE)

tamestabjan <- read.csv2("tamestabjan.CSV",sep=";") 
strdesc=''
for(i in 1:nrow(tamestabjan)){
  strdesc=paste(strdesc,tamestabjan[i,1],sep = '')
  strdesc=paste(strdesc,' = "',sep = '')
  strdesc=paste(strdesc,tamestabjan[i,2],sep = '')
  if(i<nrow(tamestabjan)){
    strdesc=paste(strdesc,'"; ',sep = '')
  } else {
    strdesc=paste(strdesc,'"',sep = '')    
  }
} 
strdesc
CAGEDTI$tamestabjan <- Recode(CAGEDTI$tamestabjan, strdesc, as.factor=TRUE)

table(CAGEDMOV2020$graudeinstrução,CAGEDMOV2020$saldomovimentação)
table(CAGEDMOV2020$sexo,CAGEDMOV2020$saldomovimentação)
table(CAGEDMOV2020$raçacor,CAGEDMOV2020$saldomovimentação)
table(CAGEDMOV2020$tamestabjan,CAGEDMOV2020$saldomovimentação)

contratacoesanalista<-CAGEDTISP[CAGEDTISP$saldomovimentação>0 & CAGEDTISP$cbo2002ocupação=="Analista de Desenvolvimento de Sistemas" & CAGEDTISP$salário>1040 & CAGEDTISP$salário<20000 &CAGEDTISP$horascontratuais>0,]
contratacoesanalista<-contratacoesanalista[contratacoesanalista$tamestabjan=="1000 ou mais vínculos",]

plot(contratacoesanalista$salário~sexo, data=contratacoesanalista)
plot(contratacoesanalista$salário~graudeinstrução, data=contratacoesanalista)
write.table(CAGEDTI, file = "./cagedti.csv", row.names = FALSE, sep = ";", dec = ",")
