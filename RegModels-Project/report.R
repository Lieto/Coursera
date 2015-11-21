rm(list = ls())

library(ggplot2)
library(dplyr)
data(mtcars)

print(head(mtcars))

print(dim(mtcars))

## Change integer (numeric)  variables to factor
mtcars$cyl <- as.factor(mtcars$cyl)
mtcars$vs <- as.factor(mtcars$vs)
mtcars$am <- as.factor(mtcars$am)
mtcars$gear <- as.factor(mtcars$gear)
mtcars$carb <- as.factor(mtcars$carb)
attach(mtcars)

# Inference
result <- t.test(mpg ~ am)
print(result$p.value)
print(result$estimate)

# Regression Analysis
fullModel <- lm(mpg ~ ., data=mtcars)
print(summary(fullModel))

stepModel <- step(fullModel, k = log(nrow(mtcars)))
print(summary(stepModel))

testModel <- step(fullModel, direction = "both")
print(summary(testModel))
amIntWtModel <- lm(mpg ~wt + qsec + am + wt:am, data = mtcars)
print(summary(amIntWtModel))

amModel <- lm(mpg ~am, data = mtcars)
print(summary(amModel))

print(anova(amModel, stepModel, amIntWtModel))
print(confint(amIntWtModel))

print(summary(amIntWtModel)$coef)





# Appendix figures

## Boxplot of MPG vs Transmission
boxplot(mpg ~ am, xlab = "Transmission (0 = automatic, 1 = Manual)", ylab = "MPG",
        main = "Boxplot of MPG vs. Transmission")

## Pair Graph of Motor Trend Car Road Tests
pairs(mtcars, panel = panel.smooth, 
      main = "Pair Graph of Motor Trend Car Road Tests")

## Scatter plot of MPG vs. Weight by Transmission

g = ggplot(mtcars, aes(x = wt, y = mpg, group = am, color = am, height = 3, width = 3)) +
  geom_point() +
  scale_colour_discrete(labels = c("Automatic", "Manual")) +
  xlab("Weight") + 
  ggtitle("Scatter Plot of MPG vs. Weight by Transmission")

print(g)

# Residual Plots
par(mfrow = c(2, 2))
plot(amIntWtModel)

print(sum((abs(dfbetas(amIntWtModel))) > 1))


