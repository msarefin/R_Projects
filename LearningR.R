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


# This is just a multi line comment 
# all i have to put in s a hash tag using \


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