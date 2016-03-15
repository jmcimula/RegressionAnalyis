
library(downloader)
library(ggplot2)
library(GGally)

#Data from University of Lyon2
url        <- "http://eric.univ-lyon2.fr/~ricco/cours/didacticiels/R/automobiles_pour_regression.txt"
filename   <- "automobiles_pour_regression.txt"
if (!file.exists(filename)) download(url,filename)
msleep <- read.table(file = "automobiles_pour_regression.txt",sep="\t",header=TRUE,dec=".",row.names=1)

#Changing column names
colnames(msleep) <- c("Price","Cylinder","Power","Weight","Consumption")

#summary(lm(Consumption ~ ., data=msleep))$coefficients

#g <- ggpairs(msleep,upper = list(continuous = wrap("cor", size = 5)), lower = list(continuous = "smooth"))
#g

chrt <- ggpairs(
                   msleep,
                   lower = list(continuous = "smooth"),
                   upper = list(continuous = wrap("cor", size = 5,colors(distinct = FALSE)))
                ) 

chrt <- chrt +  theme(
                       legend.position = "none",
                       panel.grid.major = element_blank(),
                       axis.ticks = element_blank(),
                       axis.title.x = element_text(angle = 180, vjust = 1, color = "black"),
                       panel.border = element_rect(fill = NA)
                     )

chrt



#regVar <- lm (Consumption ~ Price + Cylinder + Power + Weight, msleep)
#attributes(regVar)
#eZ <- residuals(regVar)
#par(mfrow = c(3,2))
#for(i in 1:5){plot(msleep[,i],e,ylab="Résidus",xlab=names(msleep)[i])}

##reg <- lm(conso ~ prix + cylindree + puissance + poids, msleep)
#e <- residuals(reg)
#par(mfrow=c(3,2))
#for (j in 1:5){plot(msleep[,j],e,ylab="Résidus",xlab=names(msleep)[j]); abline(h=0)}
#layout(1)#réinitialiser après coup l'espace graphique