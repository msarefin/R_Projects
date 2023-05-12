#matrix(data, nrow, ncol, byrow, dimnames)

M <- matrix(c(3:14),nrow =4, byrow=TRUE)
print(M)

M <- matrix(c(3:14),nrow =4, byrow=FALSE)
print(M)

rownames = c("row1","row2","row3","row4")
colnames = c("col1","col2","col3")

P <- matrix(c(3:14),nrow=4, byrow=TRUE, dimnames = list(rownames,colnames))

print(P)