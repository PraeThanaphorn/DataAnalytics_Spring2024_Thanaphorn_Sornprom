#Lab1_Thanaphorn Sornprom_1-23-2024
rm(list = ls())

#Import 2010EPI_data
install.packages("csv")
library(csv)
data_2010EPI <- read.csv("2010EPI_Data.csv")
str(data_2010EPI)
View(data_2010EPI)
names(data_2010EPI) <- as.matrix(data_2010EPI[1,])
data_2010EPI <- data_2010EPI[-1,]
data_2010EPI[] <- lapply(data_2010EPI, function(x)type.convert(as.character(x)))
data_2010EPI
View(data_2010EPI)
str(data_2010EPI)

#Exercise 1: exploring the distribution
#using 2010EPI_data
summary(data_2010EPI) #summary for all variables in the 2010 data
summary(data_2010EPI$EPI) #summary only EPI data
stem(data_2010EPI$EPI) #stem and leaf plot
hist(data_2010EPI$EPI) # plot histrogram graph
hist(data_2010EPI$EPI, seq(30., 95., 1.0), prob=TRUE) #density function
lines(density(data_2010EPI$EPI, na.rm=TRUE, bw=1.)) #add the line to the histogram
rug(data_2010EPI$EPI)
help(rug)
data_2010EPI$EPI
tf <- is.na(data_2010EPI$EPI) #collect missing data
E <- data_2010EPI$EPI[!tf] #remove the missing data
E
summary(data_2010EPI$EPI)
summary(E)

#Fitting a distribution beyond histrogram
plot(ecdf(data_2010EPI$EPI), do.points=FALSE, verticals = TRUE) #plot cumulative density function
#plot(ecdf(data_2010EPI$EPI), do.points=TRUE, verticals=TRUE)

par(pty = "s")
help(par)

qqnorm(data_2010EPI$EPI) #plot q-q graph
qqline(data_2010EPI$EPI) #add the line to the q-q graph

x <- seq(30,95,1)
qqplot(qt(ppoints(250), df=5), x, xlab = "Q-Q plot for t dsn")
qqline(x)

help(qqplot)
y <- seq(45, 95, 1)
qqplot(qt(ppoints(300), df=5), y, xlab = "Q-Q plot for t dsn")
qqline(y)

#Consider Daly variable
hist(data_2010EPI$DALY)
hist(data_2010EPI$DALY, seq(20, 100, 150), prob=FALSE) #density function
lines(density(data_2010EPI$DALY, na.rm=TRUE, bw=1.)) #add the line to the histogram
rug(data_2010EPI$DALY)

tf_daly <- is.na(data_2010EPI$DALY) #collect missing data
daly_no_missing <- data_2010EPI$DALY[!tf_daly] #remove the missing data
data_2010EPI$DALY
daly_no_missing
summary(daly_no_missing)
plot(daly_no_missing)
hist(daly_no_missing)

#Fitting a distribution beyond histrogram
plot(ecdf(data_2010EPI$DALY), do.points=FALSE, verticals = TRUE) #plot cumulative density function
plot(ecdf(daly_no_missing), do.points=FALSE, verticals=TRUE)

qqnorm(data_2010EPI$DALY) #plot q-q graph
qqline(data_2010EPI$DALY) #add the line to the q-q graph

#Consider WATER_H
hist(data_2010EPI$WATER_H)
hist(data_2010EPI$WATER_H, seq(20, 100, 150), prob=FALSE) #density function
# hist(data_2010EPI$WATER_H, seq(30., 95., 1.0), prob=FALSE)
lines(density(data_2010EPI$WATER_H, na.rm=TRUE, bw=1.)) #add the line to the histogram
rug(data_2010EPI$WATER_H)

tf_water_h <- is.na(data_2010EPI$WATER_H) #collect missing data
water_h_no_missing <- data_2010EPI$WATER_H[!tf_water_h] #remove the missing data
data_2010EPI$WATER_H
water_h_no_missing

plot(ecdf(data_2010EPI$WATER_H), do.points=FALSE, verticals = TRUE) #plot cumulative density function

qqnorm(data_2010EPI$WATER_H) #plot q-q graph
qqline(data_2010EPI$WATER_H) #add the line to the q-q graph

#Consider Biodiversity
hist(data_2010EPI$BIODIVERSITY)
lines(density(data_2010EPI$BIODIVERSITY, na.rm=TRUE, bw=1.))

tf_bio <- is.na(data_2010EPI$BIODIVERSITY) #collect missing data
bio_no_missing <- data_2010EPI$BIODIVERSITY[!tf_bio] #remove the missing data
data_2010EPI$BIODIVERSITY
bio_no_missing

plot(ecdf(data_2010EPI$BIODIVERSITY), do.points=FALSE, verticals = TRUE)
qqnorm(data_2010EPI$BIODIVERSITY) #plot q-q graph
qqline(data_2010EPI$BIODIVERSITY) #add the line to the q-q graph

#Comparing distribution
boxplot(data_2010EPI$EPI, data_2010EPI$DALY)
boxplot(data_2010EPI$EPI, data_2010EPI$WATER_H)
boxplot(data_2010EPI$DALY, data_2010EPI$WATER_H)
boxplot(data_2010EPI$BIODIVERSITY, data_2010EPI$WATER_H)
boxplot(data_2010EPI$ENVHEALTH, data_2010EPI$ECOSYSTEM)

#qqplot for two variables
qqplot(data_2010EPI$EPI, data_2010EPI$DALY)
qqplot(data_2010EPI$EPI, data_2010EPI$WATER_H)
qqplot(data_2010EPI$DALY, data_2010EPI$WATER_H)
qqplot(data_2010EPI$BIODIVERSITY, data_2010EPI$WATER_H)
qqplot(data_2010EPI$ECOSYSTEM, data_2010EPI$ENVHEALTH)

help("distributions")

#Exercise 2: filtering (populations)
#Conditional filtering
View(data_2010EPI)
EPILandlock <- data_2010EPI$Landlock #filter only landlock column
hist(EPILandlock)

#Select the data only landlock == 1
EPILand_1 <- subset(data_2010EPI, Landlock == "1")
str(EPILand_1$Landlock) 
summary(EPILand_1$Landlock)
tf_landlock <- is.na(data_2010EPI$Landlock) #collect missing data
landlock_no_missing <- data_2010EPI$Landlock[!tf_landlock] 
landlock_no_missing
hist(landlock_no_missing)
hist(landlock_no_missing, seq(10, 20, 35), prob=TRUE)

Eland <- data_2010EPI$Landlock[!is.na(data_2010EPI$Landlock)] #remove all missing data
str(Eland)
hist(Eland)

No_surface_wafer <- data_2010EPI$No_surface_water
No_surface_wafer_NM <- data_2010EPI$No_surface_water[!is.na(data_2010EPI$No_surface_water)]
hist(No_surface_wafer_NM)
summary(No_surface_wafer_NM)

#Another way to remove missing data
tf_No_surface_water <- is.na(data_2010EPI$No_surface_water) #collect missing data
No_surface_water_no_missing <- data_2010EPI$No_surface_water[!tf_No_surface_water]
No_surface_water_no_missing

No_surface_wafer_0 <- subset(data_2010EPI, No_surface_wafer == "0")
str(No_surface_wafer_0$No_surface_water)
summary(No_surface_wafer_0)

#Consider High_Population_Density variable
High_Population_Density <- data_2010EPI$High_Population_Density
High_Population_Density

#Remove NA for High_Population_Density
High_Population_Density_NM <- data_2010EPI$High_Population_Density[!is.na(data_2010EPI$High_Population_Density)]
High_Population_Density_NM
summary(High_Population_Density_NM)

#Consider Desert
Desert <- data_2010EPI$Desert
Desert
Desert_NM <- data_2010EPI$Desert[!is.na(data_2010EPI$Desert)]
Desert_NM
hist(Desert_NM)
boxplot(Desert_NM)

#Consider EPI_regions
EPI_regions <- data_2010EPI$EPI_regions #filter only the EPI region
str(EPI_regions)

#Remove missing data
EPI_regions_NM <- data_2010EPI$EPI_regions[!is.na(data_2010EPI$EPI_regions)]
EPI_regions_NM

#Consider GEO_subregion
GEO_subregion <- data_2010EPI$GEO_subregion #filter only GEO_subregion
str(GEO_subregion)

#Remove missing data
GEO_subregion_NM <- data_2010EPI$GEO_subregion[!is.na(data_2010EPI$GEO_subregion)]
GEO_subregion_NM

#Import GPW3_GRUMP data
GPW3 <- read.csv("GPW3_GRUMP_SummaryInformation_2010.csv")
str(GPW3)
View(GPW3)
summary(GPW3)
hist(GPW3$PopulationPerUnit)
summary(GPW3$PopulationPerUnit)

plot(ecdf(GPW3$PopulationPerUnit), do.points=FALSE, verticals = TRUE) #plot cumulative density function

qqnorm(GPW3$PopulationPerUnit) #plot q-q graph
qqline(GPW3$PopulationPerUnit) #add the line to the q-q graph

populationperunit <- GPW3$PopulationPerUnit #filter only population per unit
boxplot(populationperunit)

plot(ecdf(GPW3$Num.UE.s.from.DCW))
qqnorm(GPW3$Num.UE.s.from.DCW) #plot q-q graph
qqline(GPW3$Num.UE.s.from.DCW) #add the line to the q-q graph

#Select resolution variable
resolution <- GPW3$Resolution
resolution

#Remove missing values
resolution_NM <- GPW3$Resolution[!is.na(GPW3$Resolution)]
resolution_NM
summary(resolution_NM)
hist(resolution_NM)
boxplot(resolution_NM)
qqnorm(resolution_NM)
qqline(resolution_NM)

#Select Numunits
NumUnits <- GPW3$NumUnits
NumUnits

#Remove missing valuez
Numunits_NM <- GPW3$NumUnits[!is.na(GPW3$NumUnits)]
Numunits_NM
summary(Numunits_NM)
hist(Numunits_NM)
boxplot(Numunits_NM)
qqnorm(Numunits_NM)
qqline(Numunits_NM)
dist(Numunits_NM)
plot(Numunits_NM)

#Import water treatment data
water_treatment <- read.csv("water-treatment.csv")
str(water_treatment)
View(water_treatment)

#Consider COND.E
COND_E <- water_treatment$COND.E
COND_E

COND_E_NM <- water_treatment$COND.E[!is.na(water_treatment$COND.E)] #Remove missing values
COND_E_NM
summary(COND_E_NM)
plot(COND_E_NM)
hist(COND_E_NM)
hist(COND_E_NM, seq(10, 20, 30), prob=TRUE) #density function
#lines(density(COND_E_NM, na.rm=TRUE, bw=1.)) #add the line to the histogram
rug(COND_E_NM)
qqnorm(COND_E_NM)
qqline(COND_E_NM)

#Consider COND.P
COND_P <- water_treatment$COND.P
COND_P

COND_P_NM <- water_treatment$COND.P[!is.na(water_treatment$COND.P)] #Remove missing values
COND_P_NM
summary(COND_P_NM)
plot(COND_P_NM)
hist(COND_P_NM)
hist(COND_P_NM, seq(10, 20, 30), prob=TRUE) #density function
lines(density(COND_P_NM, na.rm=TRUE, bw=1.))
rug(COND_P_NM)
qqnorm(COND_P_NM)
qqline(COND_P_NM)

#Consider PH.D
PH_D <- water_treatment$PH.D
PH_D

PH_D_NM <- water_treatment$PH.D[!is.na(water_treatment$PH.D)] #Remove missing values
PH_D_NM
summary(PH_D_NM)
hist(PH_D_NM)
hist(PH_D_NM, seq(30, 95, 100), prob=TRUE) #density function
lines(density(PH_D_NM, na.rm=TRUE, bw=1.)) #add the line to the histogram
rug(PH_D_NM)
qqnorm(PH_D_NM)
qqline(PH_D_NM)

#Consider SS_D
SSV_D <- water_treatment$SSV.D
SSV_D

SSV_D_NM <- water_treatment$SSV.D[!is.na(water_treatment$SSV.D)] #Remove missing values
SSV_D_NM
summary(SSV_D_NM)

#Consider COND.D
COND_D <- water_treatment$COND.D
COND_D

COND_D_NM <- water_treatment$COND.D[!is.na(water_treatment$COND.D)] #Remove missing values
COND_D_NM

dist(COND_D_NM)
hist(COND_D_NM)
hist(COND_D_NM, seq(30, 95, 100), prob=TRUE) #density function
lines(density(COND_D_NM, na.rm=TRUE, bw=1.)) #add the line to the histogram
qqnorm(COND_D_NM)
qqline(COND_D_NM)

summary(COND_D_NM)
boxplot(COND_D_NM)
boxplot(COND_D_NM, COND_E_NM, COND_P_NM)
qqplot(COND_D_NM, COND_E_NM)

boxplot(water_treatment$PH.D, water_treatment$PH.E)
qqplot(water_treatment$PH.D, water_treatment$PH.E)
qqnorm(water_treatment$PH.D)
qqline(water_treatment$PH.D)
