#####            Indexing Data

#Suppose that our data is stored in the matrix A.
A=matrix(1:16,4,4)
A
#select the element corresponding to the second row and the third column. 
A[2,3]

A[c(1,3),c(2,4)]
A[1:3,2:4]
A [1:2 ,]
A [ ,1:2]
#The last two examples include either no index for the columns or no index for the rows.

#R treats a single row or column of a matrix as a vector.
A[1,]
#use of a negative sign - in the index tells R to keep all rows or columns except those indicated in the index.
A[-c(1,3),]
#dim() function outputs the number of rows followed by the number of columns of a given matrix.
dim(A)


#####              Loading Data
#the first step involves importing a data set into R   ##   read.table()
#write.table() to export data.

Auto=read.table("Auto.data") 
View(Auto)
#fix() function can be used to view it in a spreadsheet like window
fix(Auto)
#Note that Auto.data is simply a text file
Auto=read.csv("Auto.csv",header=T,na.strings ="?")
fix(Auto)
dim(Auto)
Auto [1:4 ,]
#na.omit() function to simply remove these rows
Auto=na.omit(Auto)
#dim() function tells us that the data has 397 rows, and nine columns.
dim(Auto)
#use names() to check the variable names.
names(Auto)


######           Additional Graphical and Numerical Summaries
plot(cylinders , mpg)
#Error in plot(cylinders, mpg) : object 'cylinders' not found
#To refer to a variable, we must type the data set and the variable name joined with a $ symbol.
plot(Auto$cylinders , Auto$mpg )
#use the attach() function in order to tell R to make the variables in this data frame available by name.
attach(Auto)
plot(cylinders,mpg) #cylinders variable is stored as a numeric vector

#as.factor() function converts quantitative variables into qualitative variables.
cylinders=as.factor(cylinders)
#If the variable plotted on the x-axis is categorial, then boxplots will automatically be produced by the plot() function. 

plot(cylinders, mpg )
plot(cylinders, mpg, col="red")
plot(cylinders, mpg, col="red", varwidth=T)
plot(cylinders, mpg, col="red", varwidth=T, horizontal=T)
plot(cylinders, mpg, col="red", varwidth=T,xlab="cylinders",ylab="MPG")

#hist() function can be used to plot a histogram.                
hist(mpg)
hist(mpg,col=2)
hist(mpg,col=2,breaks=15)

#pairs() function creates a scatterplot matrix
pairs(Auto)
pairs(~mpg + displacement + horsepower + weight + acceleration , Auto)

#identify() provides a useful interactive method for identifying the value for a particular variable for points on a plot.
plot(horsepower ,mpg)
identify(horsepower,mpg,name)

#summary() function produces a numerical summary of each variable in a particular data set.
summary(Auto) 
#We can also produce a summary of just a single variable.
summary(mpg)

#type q() in order to shut it down, or quit. 
q()
#save a record of all of the commands that we typed in the most recent session
savehistory() 
#load that history using the loadhistory() function.
loadhistory()
