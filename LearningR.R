#Package for 3D Charts
install.packages("plotrix")

mystring <- "Hello World!"
print(mystring)
cat(mystring)

#This is just comment

if(FALSE){
  "This is a way to create a multi level comment
  since the parameter is always FALSE there is no out put!!!"
}

#Data types in R


# This is just a multi-line comment 
# all i have to put in is a hash tag using #
# keyboard shortcuts for R studio is Ctrl + Shift + C


#vector
v <- "This is a single valued vector"
vector <- c("This", "is","a","Multi-valued vector")

# list
List <- list(v,vector(),12.4, tan(0))
print(List)


num <- c(1:9)
#matirx
matrices <- matrix(num, nrow =3, ncol = 3, byrow  = TRUE)
print(matrices)
# array
arrays = array(num, dim = c(4,5,2))
print(arrays)

#factor
apple_colors <- c("red","green","yellow","yellow","green","red","red","yellow")
factor_apple_colors <- factor(apple_colors)
print(factor_apple_colors)
print(nlevels(factor_apple_colors))

# Data Frame
IBM <- data.frame(
  gender = c("Male","Male","Female"),
  height = c(152,171.5,165),
  weight = c(81,93,75),
  age = c(42,38,26)
)

print(IBM)
#writing a csv file with name IBM.csv
write.csv(IBM,file = "IBM.csv")

#remove a file named IBM.csv
file.remove("IBM.csv")

if(FALSE){
  "
  Variables can contain underscores, dots and numbers
  Variables cannot start with a number or an unerscore but can have them anywhere after the first character
  variables cannot start with a dot followed by a number
  variables cannot start or end with a special character except with a dot or an underscore
  
  variables can be assigned in the following manner 
  x = 'value'
  x <- 'value'
  value -> x
  
  to print the values of the variable 
  
  print(x)
  cat(x)
  
  to get the data type of a variable 
  class(x)
  "
}

#To list all the variables
ls()
ls(pattern="apple")
ls(all.names=TRUE)

#To delete a variable 
rm(IBM)

#To remove all variables 
rm(list= ls())

# Trying to save this file from getting deleted from my work 
# But how come I don't see this file on my mac R IDE?
#help

v <- c( 2,5.5,6)
t <- c(8, 3, 4)

v+t
v-t
v*t
v/t
v%%t
v%/%t

#the switch points to the 3rd case on the list
switch(
  3, 
  "first",
  "second",
  "third",
  "fourth"
)

#the switch points to the case by name
a = 3
b = 4
c = "m"

switch(
  c, 
  "a" = cat(a+b),
  "s" = cat(a-b),
  "m"  = cat(a*b),
  "d" = cat(a/b)
)

#loop - repeat
c <- 0
repeat{
  cat("*")
  c= c+1; 
  if(c>=10){ 
    c= 0 
    break}
  
}

#while loop 
c <- 0
while(c<=10){
  cat("+",c,"\n")
  c = c+1;
}

#For loop 

for(i in c(1:4)){
  print(letters[i])
  print(LETTERS[i])
}

#Function
fn <- function(a, b){
  
  c = a+b
  c
}

#String

a <- "Hello"
b <- "darkness"
c <- "my old friend"

paste(a,b,c)
paste(a,b,c, sep = "-")
paste(a,b,c, sep = "", collapse = "")

format(6)
format(60000.123456, digits = 2)
format(60000.123456, scientific = TRUE)
format(60000.123456, nsmall = 3)
format(6.123, width = 9 )

format(a, width = 8, justify = "l")
format(a, width = 8, justify = "r")
format(a, width = 8, justify = "c")

nchar(a)
toupper(a)
tolower(a)

substring("I am learning R to become a Data analyst!!", 10,15)

#vectors

v <- 5:13

print(v)

v1 = seq(1,10, by = 0.5)

show(v1)

#LIst 

list_dta <- list("red","green",v1, FALSE,3.14)
print(list_dta)
print(list_dta[4])

#matrix

m<- matrix(c(1:15),nrow = 3, byrow = TRUE)
show(m)

#Arrays

vector1 <- c(5,9,3)
vector2 <- c(seq(10,15, by = 1))
column.names <- c("col1","col2","col3")
row.names <- c("row1","row2","row3")
matrix.name <- c("Matrix1","Matrix2")

result<- array(c(vector1,vector2), dim = c(3,3,2),dimnames = list(row.names, column.names,matrix.name))
print(result)


#Data Interface

#CSV files

#read csv data and store in a variable 
data <- read.csv("input.csv")
print(data)

print(is.data.frame(data)) # Check if the variable contains data frames
print(ncol(data)) # number of columns 
print(nrow(data)) # number of rows

data$salary # all data under salary column
sal.list <- data$salary
print(sal.list)
class(sal.list)

sal <- max(data$salary)
print(sal)

subset(data, salary == max(salary))
subset(data, salary < ave(salary))


#write csv files 
output <- subset(data, salary < ave(salary))

# To remove the x column set the row.names = FALSE
write.csv(output, "output.csv", row.names = FALSE)


read.csv("output.csv")
