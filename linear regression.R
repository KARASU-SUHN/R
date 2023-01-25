###     Simple Linear Regression

library(MASS) 
library(ISLR)

fix(Boston)
names(Boston)
?Boston
head(Boston)
#We will start by using the lm() function to fit a simple linear regression model
#The basic lm() syntax is lm(y∼x,data), where y is the response, x is the predictor, and data is the data set in which these two variables are kept.
lm.fit=lm(medv~lstat)
#The command causes an error because R does not know where to find the variables medv and lstat. 
#The next line tells R that the variables are in Boston. If we attach Boston, the first line works fine because R now recognizes the variables.
lm.fit=lm(medv~lstat,data=Boston)
attach(Boston)
lm.fit=lm(medv~lstat)
lm.fit
#lm.fit, some basic information about the model is output
#more detailed information, we use summary(lm.fit)
summary(lm.fit)
#use the names() function in order to find out what other pieces of information are stored in lm.fit.
names(lm.fit)
coef(lm.fit)
#In order to obtain a confidence interval for the coefficient estimates, we can use the confint() command.
confint(lm.fit)
#predict() function can be used to produce confidence intervals and prediction intervals for the prediction of medv for a given value of lstat.
predict(lm.fit,data.frame(lstat=c(5,10,15)), interval ="confidence")
predict(lm.fit,data.frame(lstat=c(5,10,15)),interval = "prediction")

predict(lm.fit,data.frame(lstat=c(5,10,15)),interval = "none")


#plot medv and lstat along with the least squares regression line using the plot()
plot(lstat,medv)
#The abline() function can be used to draw any line, not just the least squares regression line. 
abline(lm.fit)

abline(lm.fit,lwd=3)
abline(lm.fit,lwd=3,col="red")
plot(lstat,medv,col="red")
plot(lstat,medv,pch=20)
plot(lstat,medv,pch="+")
plot(1:20,1:20,pch=1:20)

#view all four plots together,achieve this by using the par() function
#par(mfrow=c(2,2)) divides the plotting region into a 2 × 2 grid of panels.
par(mfrow=c(2,2))
plot(lm.fit)
#Alternatively, we can compute the residuals from a linear regression fit using the residuals() function. 
#rstudent() will return the studentized residuals, and we can use this function to plot the residuals against the fitted values.
plot(predict(lm.fit), residuals(lm.fit))
plot(predict(lm.fit), rstudent(lm.fit))
#Leverage statistics can be computed for any number of predictors using the hatvalues() function.
plot(hatvalues (lm.fit))
#which.max() function identifies the index of the largest element of a vector. 
which.max(hatvalues (lm.fit))

####          Multiple Linear Regression
View(Boston)
lm.fit=lm(medv~lstat+age,data=Boston)
#The syntax lm(y∼x1+x2+x3) is used to fit a model with three predictors, x1, x2, and x3.
summary(lm.fit)

lm.fit=lm(medv~.,data=Boston)
summary(lm.fit)

#We can access the individual components of a summary object by name (type ?summary.lm to see what is available). 
summary(lm.fit)$r.sq
#gives us the R^2
summary(lm.fit)$sigma
#gives us the RSE.

#The vif() function, part of the car package, can be used to compute variance inflation factors.
library(car)
vif(lm.fit)
#The following syntax results in a regression using all predictors except age.
lm.fit1=lm(medv~.-age,data=Boston)
summary(lm.fit1)

#Alternatively, the update() function can be used.
lm.fit1=update(lm.fit, ~.-age)

#####    Interaction Terms
#The syntax lstat*age simultaneously includes lstat, age,
summary(lm(medv~lstat*age,data=Boston))


####       Non-linear Transformations of the Predictors
#lm() function can also accommodate non-linear transformations of the predictors.
#given a predictor X, we can create a predictor X2 using I(X^2).
lm.fit2=lm(medv~lstat+I(lstat^2))
summary(lm.fit2)
#use the anova() function to further quantify the extent to which the quadratic fit is superior to the linear fit.
lm.fit=lm(medv~lstat)
anova(lm.fit ,lm.fit2)
#here Model 1 represents the linear submodel containing only one predictor,lstat, 
#while Model 2 corresponds to the larger quadratic model that has two predictors, lstat and lstat2.

par(mfrow=c(2,2))
plot(lm.fit2)

#A better approach involves using the poly() function to create the polynomial within lm().
#the following command produces a fifth-order polynomial fit:
lm.fit5=lm(medv~poly(lstat ,5))
summary(lm.fit5)
#we are in no way restricted to using polynomial transformations of the predictors
#Here we try a log transformation.
summary(lm(medv~log(rm),data=Boston))

####       Qualitative Predictors

#examine the Carseats data, which is part of the ISLR library.
fix(Carseats)
names(Carseats)
View(Carseats)
#The Carseats data includes qualitative predictors such as Shelveloc,
lm.fit=lm(Sales~.+Income:Advertising+Price:Age,data=Carseats)
#Given a qualitative variable such as Shelveloc, R generates dummy variables automatically. 
summary(lm.fit)
#The contrasts() function returns the coding that R uses for the dummy variables.
attach(Carseats)
contrasts (ShelveLoc)
?contrasts


