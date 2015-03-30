# week 2 - Linear regression
wine <- read.csv("wine.csv")
str(wine)
summary(wine)
model1 <- lm(Price~AGST,data=wine)
summary(model1)

# Adding more variables to the model
model2  <- lm(Price ~ AGST + WinterRain,data=wine)
summary(model2)

# Adding all variables to the model
model3 <- lm(Price ~ AGST + WinterRain + Year + Age +HarvestRain + FrancePop,data=wine)
summary(model3)
