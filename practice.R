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


