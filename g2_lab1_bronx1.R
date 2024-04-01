install.packages("gdata")
library(gdata) 

getwd()
library(readxl)
bronx1 <- read_xls("rollingsales_bronx.xls")
str(bronx1)

names(bronx1) <- as.matrix(bronx1[4,])
View(bronx1)
bronx1 <- bronx1[-1:-4,]
View(bronx1)
str(bronx1)
summary(bronx1)
bronx1 <- lapply(bronx1, function(x)type.convert(as.character(x)))
str(bronx1)

df_sp <- bronx1$`SALE
PRICE`
summary(df_sp)

df_GSF <- bronx1$`GROSS SQUARE FEET`
summary(df_GSF)

df_LSF <- bronx1$`LAND SQUARE FEET`
summary(df_LSF)

df_NB <- bronx1$NEIGHBORHOOD
summary(df_NB)

df_BCC <- bronx1$`BUILDING CLASS CATEGORY`
summary(df_BCC)

df_bronx1 <- data.frame(df_sp, df_GSF, df_LSF, df_NB, df_BCC)
summary(df_bronx1)

is.na(df_bronx1)

#Model 1
m1<-lm(df_bronx1$bronx1..SALE.nPRICE. ~ df_bronx1$df_GSF)
summary(m1)
abline(m1,col="red",lwd=2)
plot(resid(m1))

plot(log(df_bronx1$df_GSF), log(df_bronx1$bronx1..SALE.nPRICE.)) 

df_bronx1_cleaned <- subset(df_bronx1, df_bronx1$bronx1..SALE.nPRICE. > 0)
df_bronx1_cleaned <- subset(df_bronx1_cleaned, df_bronx1_cleaned$df_GSF > 0)
df_bronx1_cleaned <- subset(df_bronx1_cleaned, df_bronx1_cleaned$df_LSF > 0)
summary(df_bronx1_cleaned)

#log_SP <- log(df_bronx1_cleaned$bronx1..SALE.nPRICE.)
#log_GSF <- log(df_bronx1_cleaned$df_GSF)
#summary(log_SP)

df_log <- data.frame(log(df_bronx1_cleaned$bronx1..SALE.nPRICE.), log(df_bronx1_cleaned$df_GSF))
summary(df_log)

m1a <- lm(df_log$log.df_bronx1_cleaned.bronx1..SALE.nPRICE.. ~ df_log$log.df_bronx1_cleaned.df_GSF.)
summary(m1a)
abline(m1a,col="red",lwd=2)
plot(resid(m1a))

# Model 2

m2<-lm(log(df_bronx1_cleaned$bronx1..SALE.nPRICE.)~
         log(df_bronx1_cleaned$df_GSF)+log(df_bronx1_cleaned$df_LSF)+factor(df_bronx1_cleaned$df_NB))
summary(m2)
plot(resid(m2))

# Suppress intercept - using "0+ ..."
m2a<-lm(log(df_bronx1_cleaned$bronx1..SALE.nPRICE.)~0+log(df_bronx1_cleaned$df_GSF)
        +log(df_bronx1_cleaned$df_LSF)+factor(df_bronx1_cleaned$df_NB))
summary(m2a)
plot(resid(m2a))

# Model 3
m3<-lm(log(df_bronx1_cleaned$bronx1..SALE.nPRICE.)~0+log(df_bronx1_cleaned$df_GSF)
       +log(df_bronx1_cleaned$df_LSF)+factor(df_bronx1_cleaned$df_NB)
       +factor(df_bronx1_cleaned$df_BCC))
summary(m3)
plot(resid(m3))

# Model 4
m4<-lm(log(df_bronx1_cleaned$bronx1..SALE.nPRICE.)~0+log(df_bronx1_cleaned$df_GSF)
       +log(df_bronx1_cleaned$df_LSF)+factor(df_bronx1_cleaned$df_NB)*factor(df_bronx1_cleaned$df_BCC))
summary(m4)
plot(resid(m4))

