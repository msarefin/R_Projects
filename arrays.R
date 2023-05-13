#Arrays in R

vector1 <- c(5,9,3)
vector2 <- c(10,11,12,13,14,15)

result <- array(c(vector1,vector2),dim =c(3,3,2))
print(result)

#Naming Columns

column.names <- c("col1","col2","col3")
row.names <- c("row1","row2","row3")
matrix.names <- c("Matrix1", "Matrix2")

result <- array(c(vector1, vector2), dim =c(3,3,2), dimnames = list(row.names, column.names,matrix.names))

#print all the matrices
print(result)
#print the 3rd row of the 2nd matrix
print(result[3,,2])
#print the value on the 1st row and 3rd column of the 1st matrix
print(result[1,3,1])
#Print the third matrix
print(result[,,2])


#Manipulating Array Elements

array1 <- array(c(vector1, vector2), dim = c(3,3,2))

vector3 <- c(9,1,0)
vector4 <- c(6,0,11,3,14,1,2,6,9)

array2 <- array(c(vector1, vector2),dim = c(3,3,2))

matrix1 <- array1[,,2]
matrix2 <- array2[,,2]

result <- matrix1+matrix2
print(result)


#Calulations across Array Elements

new.array <- array(c(vector1, vector2),dim = c(3,3,2))
print(new.array)

#using apply to calulate the sum of all elements at each row

result <- apply(new.array, c(1),sum)
print(result)