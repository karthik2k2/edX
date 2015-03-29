#week 1 - learning from food and nutrition data
usda <- read.csv("USDA.csv")
str(usda)
summary(usda)
HighSodium <- subset(usda,Sodium>10000)

#visualization
plot(usda$Protein,usda$TotalFat,
     xlab="Protein",
     ylab="Fat",
     main="Protein vs Fat",
     col="red")

#histogram of sodium
hist(usda$VitaminC,xlab="Vitamin C(mg)",main="Vitamin C content of food",
     xlim=c(0,100),
     breaks=2000)

#boxplot of sugar
boxplot(usda$Sugar,main="Boxplot of sugar levels",ylab="Sugar(g)")

#adding variable
usda$HighCarbs <- as.numeric(usda$Carbohydrate>mean(usda$Carbohydrate,na.rm=TRUE))
usda$HighSodium <- HighSodium
str(usda)

#Three ways of doing the same thing!(using base R)
tapply(usda$VitaminC,usda$HighCarbs,summary,na.rm=TRUE)
by(usda$VitaminC,usda$HighCarbs,summary,na.rm=TRUE)
aggregate(usda$VitaminC,by=list(HighCarb=usda$HighCarbs),FUN=summary,na.rm=TRUE)
