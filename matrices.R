#matrix(data, nrow, ncol, byrow, dimnames)

M <- matrix(c(3:14),nrow =4, byrow=TRUE)
print(M)

M <- matrix(c(3:14),nrow =4, byrow=FALSE)
print(M)

rownames = c("row1","row2","row3","row4")
colnames = c("col1","col2","col3")

P <- matrix(c(3:14),nrow=4, byrow=TRUE, dimnames = list(rownames,colnames))

print(P)

#Accessing elements of a matrix

print(P[1,3])
print(P[4,2])
print(P[2,])
print(P[,3])


#Matrix calculations

matrix1 <- matrix(c(3,9,-1,4,2,6), nrow =2)
matrix2 <- matrix(c(5,2,0,9,3,4), nrow =2)

print(matrix1)
print(matrix2)

print(matrix1+matrix2)
print(matrix1-matrix2)
print(matrix1*matrix2)
print(matrix1/matrix2)