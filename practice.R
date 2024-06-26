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

################### List ################### 

list1 <- list(c(1,2,3,4), "Just a list", 23.5, sin)
print(list1)

x <- list("a")
x <- list(x)

print(x)


################### Matrix ###################

m1 <- matrix(c('a','a','b','b','c','b','a'), nrow = 2, ncol = 3, byrow = TRUE)
print(m1)

m2 <- matrix(c('a','a','b','b','c','b','a'), nrow = 2, ncol = 3, byrow = FALSE)
print(m2)

m3 <- matrix(c('a','a','b','b','c','b','a'), nrow = 2, ncol = 3)
print(m3)

################### Array ################### 

a <- array(c("green","blue"),dim = c(3,3,2))
print(a)

################### Factors ###################

apple_colors <- c('green','green','yellow','red','red','red','green')
factor_color <- factor(apple_colors)
print(factor_color)
print(nlevels(factor_color))
print(apple_colors)

################### Data Frames  ###################

BMI <- data.frame(
  gender = c("male","male","female"),
  height = c(152, 171.5, 165),
  weight = c(81,93, 78),
  Age = c(42,38,26)
)

print(BMI)
print(class(BMI))

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