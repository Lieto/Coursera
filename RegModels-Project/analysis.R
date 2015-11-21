# Analysis

data("mtcars")

print(head(mtcars))

pairs(mtcars)

# mt and am variables should be categorial varaibles
mtcars$vs <- as.factor(mtcars$vs)
mtcars$am <- as.factor(mtcars$am)

# realtion hip between mpg and transmission
boxplot(mpg ~ am, data = mtcars, xlab="Transmission (0 = automatic, 1 = manual")

fit_simple <- lm(mpg ~ am, data=mtcars)
print(summary(fit_simple))

# analysis of variance
analysis <- aov(mpg ~., data = mtcars)
print(summary(analysis))

# first model
lm <- lm(mpg ~ cyl + disp + wt + drat + am, data=mtcars)
print(summary(lm))

#refine
lm <- lm(mpg ~  cyl + disp + wt + am, data=mtcars)
print(summary(lm))

#final
lm <- lm(mpg ~ cyl + wt+ am, data = mtcars)
print(summary(lm))

par(mfrow = c(2, 2))
plot(lm)
