#Book link - https://r4ds.hadley.nz/

install.packages("tidyverse")
library(tidyverse)

#R variables
mystring <- "Hello R!"
print(mystring)

#R only supports single line comments

if(FALSE){
  "One way to have multi line comments is to create if statement 
  with falls passed on to it"
}

#The variable types in R are determined the data type of the R-Object
# R-Object types
# Vectors
# Lists
# Matrices
# Arrays
# Factors
# Data Frames

################### Vectors ################### 

#There are 6 classes of vectors 
# Logical
# Neumeric
# Integer
# Complex
# Character
# Raw


################### Logical Vector ################### 

v1 <- TRUE
v2 <- FALSE

print(class(v1))

################### Numeric Vector ################### 

v3 <- 23.5

print(class(v3))

################### Integer Vector ################### 

v4 = 2L

print(class(v4))

################### Complex Vector ################### 

v5 <- 2+5i
print(class(v5))

################### Character Vector ################### 

v6 <- "TRUE"
print(class(v6))

################### Raw Vector ################### 

v7 <- charToRaw(v6)
print(v7)

v8 <- charToRaw("Hello")
print(v8)
print(class(v7))
print(class(v8))

################### Multiple element Vector ################### 

apple <- c("Red","Blue","Green")
print(class(apple))

v <- c(1,2,3,4,5+2i)
print(class(v))

#vector manipulation

d <- c("sun","mon","tue","wed","thu","fri","sat")
print(d[c(2,3,6)])
print(d[c(TRUE,FALSE,TRUE,TRUE,FALSE,FALSE,FALSE)])
print(d[c(T,T,F,F,T,F,T)])
print(d[c(-2,-5)])
print(d[c(0,0,1,0,1,1,0)])

v1 <- c(3,8,4,5,0,11)
v2 <- c(4,11,0,8,1,2)

print(v1+v2)
print(v1-v2)
print(v1/v2)
print(v1*v2)

#vector element recycling

v1 <- c(3,8,4,5,0,11)
v2 <- c(4,11)
#v2 becomes c(4,11,4,11,4,11)

print(v1+v2)
print(v1-v2)

#vector sorting
v <- c(3,8,4,5,0,11, -9, 304)

print(sort(v))
print(sort(v, decreasing = T))

v <- c("Red ","Blue","yellow","violet")
print(sort(v))
print(sort(v, decreasing = T))

################### List ################### 

list1 <- list(c(1,2,3,4), "Just a list", 23.5, sin)
print(list1)

x <- list("a")
x <- list(x)

print(x)

list_data <- list("Red", "Green", c(21,32,11), TRUE, 51.23, 119.1)
print(list_data)

list_data <- list(month.name,c(1:12),matrix(c(1:28),nrow = 4, ncol =7, byrow = TRUE),matrix(c(1:28),nrow = 7, ncol =4, byrow = FALSE) )
names(list_data) <- c("Months", "number sequence","4x7 Matrix","7x4 Matrix")

print(list_data)

print(list_data$`7x4 Matrix`)
print(list_data$`4x7 Matrix`)

#Manipulating List Element
list_data1 <- list(c("Jan","Feb","Mar"), matrix(c(3,9,5,1,-2,8), nrow = 2),list("green",12.3))
names(list_data1)<- c("1st Quarter", "A_Matrix", "A Inner list")

#list leangth 

length(list_data)
v<-list(c(seq(1,100, by = 8)))

list_data1[5] <- v
names(list_data1[5])<- c("1 to 100 by 8")

list_data1

#merged list
l1 <- list(2,4,5,6)
l2 <- list("jan", "feb", "mar")

l3 <- c(l1, l2)

l3

#Converting list to vector

unlist(list_data[1])
unlist(list_data$`7x4 Matrix`)

list_data1

list_data1$`A Inner list`
transpose(list_data1$`A Inner list`)
  
################### Matrix ###################

m1 <- matrix(c('a','a','b','b','c','b','a'), nrow = 2, ncol = 3, byrow = TRUE)
print(m1)

m2 <- matrix(c('a','a','b','b','c','b','a'), nrow = 2, ncol = 3, byrow = FALSE)
print(m2)

m3 <- matrix(c('a','a','b','b','c','b','a'), nrow = 2, ncol = 3)
print(m3)

##

M <- matrix(c(3:14),nrow = 4, byrow = TRUE)
N <- matrix(c(13:24), nrow = 4, byrow = FALSE)
M
N

#add 

result <- M+N
result

#subtract
result <- M-N
result

#multiply

result <- M*N
result

#divide 

result  = M/N
result

rownames <- c("Row1","Row2","Row3","Row4")
colnames <- c("col1", "col2", "col3")

x <- matrix(c(3:14), nrow = 4, byrow = TRUE, dimnames = list(rownames, colnames))
x

x[1,3]
x[,2]
x[1,]



################### Array ################### 

a <- array(c("green","blue"),dim = c(3,3,2))
print(a)

vector1 <- c(5,9,3)
vector2 <- c(10:15)

arr <- array(c(vector1, vector2), dim = c(3,3,2))
arr

#Naming Columns and Rown

vector1 <- c(5,9,3)
vector2 <- c(10,11,12,13,14,15)
vector3 <- c(9,1,0)
vector4 <- c(6,0,11,3,14,1,2,6,9)
column.names <- c("COL1","COL2","COL3")
row.names <- c("ROW1","ROW2","ROW3")
matrix.names <- c("Matrix1","Matrix2")

result <- array(c(vector1,vector2),dim = c(3,3,2),dimnames = list(row.names,column.names,matrix.names))

result

result[2,2,2]
result[,2,2]
result[2,,2]
result[2,2,]
result[,,2]

array1 <- array(c(vector1,vector2),dim = c(3,3,2))
array2 <- array(c(vector1,vector2),dim = c(3,3,2))

array1
array2

matrix1 <- array1[,,2]
matrix2 <- array2[,,2]

matrix1
matrix2

result <- matrix1+matrix2
print(result)

#calclate accross array elements

apply(array1, c(1),sum) # sum of rows
apply(array1, c(2),sum) # sum of columns


################### Factors ###################

apple_colors <- c('green','green','yellow','red','red','red','green')
factor_color <- factor(apple_colors)
print(factor_color)
print(nlevels(factor_color))
print(apple_colors)

levels(factor_color) # factor
nlevels(factor_color) # number of factors
is.factor(factor_color)


## Factors in data frame

height <- c(132,151,162,139,166,147,122)
weight <- c(48,49,66,53,67,52,40)
gender <- c("male","male","female","female","male","female","male")

sex <- factor(gender)
table <- data.frame(height, weight, sex)
table

is.factor(table$sex)
table$sex

# Chnage the order of factors

data <- c("East","West","East","North","North","East","West","West","West","East","North")
f1 <- factor(data)
f1
f2 <- factor(f1, levels = c("North", "East","West"))
f2

#Generating Factor labels

gl <- gl(4,2,labels = c("Tampa", "Seattle","New York","Boston"))
gl


################### Data Frames  ###################

BMI <- data.frame(
  gender = c("male","male","female"),
  height = c(152, 171.5, 165),
  weight = c(81,93, 78),
  Age = c(42,38,26)
)

print(BMI)
print(class(BMI))


#Employee Data

emp.data <- data.frame(
  emp_id = c (1:5), 
  emp_name = c("Rick","Dan","Michelle","Ryan","Gary"),
  salary = c(623.3,515.2,611.0,729.0,843.25), 
  start_date = as.Date(c("2012-01-01", "2013-09-23", "2014-11-15", "2014-05-11","2015-03-27")),
  stringsAsFactors = FALSE
)

emp.data
emp.data$start_date
str(emp.data) #get the structure of the data frame
summary(emp.data) # summary of the data

################### Decision Making  ###################

x<- 30L

if(is.integer(x)){
  cat(x," is an integer!")
}else{
  cat(x," is not an integer!!")
}

x<- switch(2, "First","Second","Third")
print(x)

day <- 3

weekday <- switch(day, "Sunday", "Monday","Tuesday","Wednesday","Thursday","Friday")
print(weekday)


### Weekday or Weekend ?
day.work <- c("Monday", "Tuesday","Wednesday","Thursday","Friday")
today <- weekdays(Sys.Date())
daycheck <- toString(today %in% day.work)
output <- switch(
  daycheck,
  "TRUE" = "Weekday - Time to work!!", 
  "Weekend - Time to relax!!"
  )

print(output)

### What is the season?

monthOfTheYear <- month.name
season <- c("Spring","Summer","Fall","Winter")



TimeOfTheYear <- switch(month(Sys.Date()), 
                        "January",
                        "February",
                        "March",
                        "April",
                        "May",
                        "June",
                        "July",
                        "August",
                        "September",
                        "October",
                        "November",
                        "December" 
  )

print(TimeOfTheYear)

#Loops - repeat, while, for

#Repeat loop
cnt <- 0;
repeat{
  cnt <- cnt+1;
  cat("Repeat Count: ",cnt,"\n");
  
  if(cnt>=5){
    cnt <- 0
    break;
  }
}

#While loop
cnt <- 0
while(cnt<5){
  cnt <- cnt +1
  cat("while count: ",cnt,"\n")
}

#For loop

small_alphabets <- letters[1:26]
capital_letters <- LETTERS[1:26]

for(a in small_alphabets){
  print(a)
}

for(A in capital_letters){
  print(A)
}

#Functions

print(seq(1:25))
print(mean(1:100))
print(sum(1:100))

#User defeined Function

new.fn <- function(a){
  for(i in 1:a){
      output <- i^2;
      print(output)
  }
}
new.fn(25)


new.fn1<- function(a = 2, b = 3){
  output <- a^b
  print(output)
}
new.fn1(6,2)


#string function

  a = "Hello"
  b = "and welcome"
  c = "Stranger!"
  
  print(paste(a,b,c))
  
  msg <- function(a,b,c){
    out <- paste(a,b,c, sep = "-", collapse = " ")
    return (out)
  }
  
print(msg(a,b,c))

#format(x, digits, nsmall, scientific, width, justify = c("left", "right", "centre", "none")) 

print(format(24.654984654984, digits = 6))
print(format(c(12,54.984), scientific = T))  
print(format(354.5, nsmall = 3))

a <- format(34.8, width = 4)  
print(a)

print(format("Hello", width = 8 , justify = "r"))
print(format("Hello", width = 8 , justify = "l"))
print(format("Hello", width = 8 , justify = "c"))

str <- "when you have eleminated the impossible, what remains however imporbable must be the turth"

nchar(str)

toupper("This string will be capitalized")
tolower("ALL LOWER CASE")

substring("QA testing involves a lot of effort to detect functional and non-functional defects in a system",10,22)


#Vector 