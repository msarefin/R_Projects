data <- c("East","West","East","North","North","East","West","West","West","East","North")

print(data)
print(is.factor(data))

#Apply factor_data function

factor_data <- factor(data)

print(factor_data)
print(is.factor(factor_data))

# Create the vectors for data frame.
height <- c(132,151,162,139,166,147,122)
weight <- c(48,49,66,53,67,52,40)
gender <- c("male","male","female","female","male","female","male")

# Create the data frame.
input_data <- data.frame(height,weight,gender)
print(input_data)

# Test if the gender column is a factor.
print(is.factor(input_data$gender))

# Print the gender column so see the levels.
print(input_data$gender)


info <- data.frame(height, weight, gender)
print(info)

print(is.factor(info$gender))


<<<<<<< HEAD

data <- c("East","West","East","North","North","East","West",
          "West","West","East","North")


#create factors
factor_data <- factor(data)
print(factor_data)

#apply new factor function

new_order_data <- factor(factor_data, levels = c("East","West","North"))
print(new_order_data)
=======
#generate vector lables

v <- gl(3,4,labels = c("Tampa","Seattle","Boston"))
print(v)
>>>>>>> d77bf2210262a5d19150f907d573e5364e3d75eb
