myStr <- "text entered!!!!"
print(myStr)
#Data Types - 
  #Vectors
  #Lists
  #Matrices
  #Arrays
  #Factors
  #Data Frames
print("----------------------------Vector----------------------------")
v <- TRUE
cat("true is", class(v),"\n")
v <- 23.5
cat("true is", class(v),"\n")
v <- 2L
cat("true is", class(v),"\n")
v <- 3+2i
cat("true is", class(v),"\n")
v <- "This is a Character"
cat("true is", class(v),"\n")
v <- charToRaw(v)
cat("true is", class(v),"\n")

#Vectors with multiple elements
apple <- c('red','green',"yellow")
print(apple)
print("apple vector is of type ")
print(class(apple))

#List
print("----------------------------List----------------------------")
list1 <- list(c(2,5,3),21.3, sin)
print(list1)

print("----------------------------Matrices----------------------------")

M = matrix(c('a','a','b','c','b','a'),nrow = 2, ncol = 3, byrow = TRUE)
print(M)

print("----------------------------Array----------------------------")

a <- array(c('red','green','blue'),dim = c(3,3,2))
print(a)

print("----------------------------Factors----------------------------")

apple_color <- c('green','green','yellow','red','red','red','green')
factor_apple <- factor(apple_color)

print(factor_apple)
print(nlevels(factor_apple))


print("----------------------------Data Frame----------------------------")

BMI <- 	data.frame(
  gender = c("Male", "Male","Female"), 
  height = c(152, 171.5, 165), 
  weight = c(81,93, 78),
  Age = c(42,38,26)
)
print(BMI)

#Assigining calues to variable
print("-----------Assigning Values-----------")
var.1 = c(0,1,2,3)
var.2 <- c("learn","R")
c(TRUE, 1) -> var.3

print(var.1)

cat("var.1 is ",var.1, "\n")
cat("var.2 is ",var.2, "\n")
cat("var.3 is ",var.3, "\n")

# list of all variables
print("List of all variables used")
print(ls())
print("-------------------------")
print(ls(pattern = "var"))
print("-------------------------")
print(ls(all.name = TRUE))

#Removing variables
#rm(var.3)
print(var.3)

print("*************remove all variables")
rm(list = ls())
print(ls())




