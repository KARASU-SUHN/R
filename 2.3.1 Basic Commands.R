#command+return=run(Mac OS)
#How to check your R version?
getRversion()
#How to check your package version?
#packageVersion("mypackage")
packageVersion("stats")

#Update the R version
install.packages("installr")
library(installr)
version
updateR()
#Update the package version  #then choose yes/no/cancel
update.packages()

#If you want to view the help documentation for an installed package, use help()
#help(NAME)
help("stats")

#Temporarily changing the path is only valid for the current Rstudio window.
#Once the window is closed, it will return to the default path. 
#Use getwd() function to get the current path.
getwd()
#Tools—Global Options—default working directory—browse
#Finally apply and reopen R studio, the working path becomes the modified path.
#EXP
#When I want to input data, I read it in my default path, instead of complicated paths
read.csv('test.csv')
read.csv('/Users/karasu/RProjects/test.csv')
#read excel files into r
#The readxl package comes with the function read_excel() to read xls and xlsx files
install.packages("readxl")
library("readxl")
#read_excel("your excel files")


# BASIC
x<- c(1,3,2,5)
x
###assign x and y
x=c(1,6,2)
x
y=c(1,4,3)
y
###check length
length(x)
length(y)
###need same length to add the number from x to the number from y
x+y
###ls() look at a list of all the objects,such as data&func
ls()
###rm() delete any that we don't want
rm(x,y)
ls()
##remove all objects at once
rm(list=ls())

##matrix 
?matrix

x=matrix(data=c(1,2,7,4),nrow = 2,ncol = 2,byrow = TRUE)
x
#omit typing data=, nrow=, ncol=
x=matrix(c(1,2,3,4),2,2)
x
#default R create matrices by filling in columns
#use byrow=TRUE to populate the matrix in order of the rows
matrix(c(1,2,3,4),2,2,byrow = TRUE)

#calculate sqrt ^2   sqrt(x) 
sqrt(x)
x^2
x^6
x^3
###INDIX DATA
#matrix[row,column]
A=matrix(1:16,4,4)
A
A[2,3]
A[c(1,3),c(2,4)]
A[1:3,2:4]
A[1:2,]
A[,1:2]
A[1,]
A[-c(1,3),] #delete row 1&3
dim(A) #dimension 4*4

#generate a vector of random normal variables rnorm()
#compute the correlation between two variables
x=rnorm(50)
y=x+rnorm(50,mean = 50,sd=.1)
#use help check rnorm,explain the parameters
#default, rnorm create standard normal random variables
#with mean= 0, standard deviation =1
cor(x,y)

#reproduce the exact same set of random numbers
set.seed(100)
rnorm(50)

#compute themean and variance of a vector of numbers
set.seed(100000)
y=rnorm(50)
mean(y)
var(y)
sqrt(var(y))
sd(y)
#sqrt(var(y))=sd(y)


###GRAPHICS

#produce a scatterplot of the numbers in x versus the numbers in y
x=rnorm(100)
y=rnorm(100)
plot(x,y)
plot(x,y,xlab = "x-axis",ylab = "y-axis",main = "Plot of x and y")

#save the output of our plot
#depend on the file type that we would like to create
#pdf() jpeg()
pdf("Figure.pdf")
plot(x,y,col="green")
dev.off()
jpeg("figure.jpeg")
plot(x,y,col="red")
dev.off() #indicates to R that we are done creating the plot, also can simply copy
#find the file in your default working path

#create a sequence of numbers
x=seq(1,10)
x
seq(0,1,length=10)
x=1:10
x
x=seq(-pi,pi,length=50)
x

##produce a contour plot in order to represent 3-dimensional data

# vector of x
# vector of y
#matrix whose elements correspond to z for each pair of (x,y) coordinates
?contour
y=x
z=outer(x,y,function(x,y)cos(y)/(1+x^2))
#outer product of arrays
contour(x,y,z)
contour(x,y,z,nlevels = 45,add = T)
# nlevels=  contour levels
fa=(z-t(z))/2
#z minus transpose z divide by 2
contour(x,y,fa,nlevels = 15)

#display a color image
#image produce a color-coded plot whose colors depend on the z value
image(x,y,z)
image(x,y,fa)
#persp can be used to produce a 3-dimensional plot
persp(x,y,z)
persp(x,y,fa)
persp(x,y,fa,theta = 30)
persp(x,y,fa,theta = 30,phi = 20)
persp(x,y,fa,theta = 30,phi = 70)
persp(x,y,fa,theta = 30,phi = 40)
#theta and phi control the angles
# theta gives the azimuthal direction and phi the colatitude.


