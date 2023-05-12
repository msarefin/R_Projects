list_data <- list("Red","Green",c(21,32,11),TRUE, 51.23,119.1)
print(list_data)

#Create list containing vectors, matrix, and list
list_data <- list(c("Jan","Feb","Mar"),matrix(c(3,9,5,1,-2,8),nrow = 2), list("green", "purple",15,12.3,"yellow"))
#give name to the elements of the list
names(list_data) <- c("1st Quarter","A_Matrix","A Inner list")
#print the elements
print(list_data)

#elements in the list can be called by their index numbers or by given names
list_data <- list(c("Jan", "Feb","Mar"), matrix(c(3,9,5,1,-2,8), nrow = 2),list("green",12.3))
names(list_data) <- c("1st Quarter","A_Matrix","A Inner List")
print(list_data[1])
print(list_data[3])
print(list_data$A_Matrix)

########################################################

list_data <- list(c("jan","feb","mar"), matrix(c(3,9,5,1,-2,8), nrow =2),list("green", 12.3))
names(list_data) <-c("1st Quarter","A_matrix","Inner list")
list_data[4] <- "new element"
print(list_data[4])
list_data[4] <- NULL
print(list_data[4])
list_data[3] <- "updated element"
print(list_data[3])


#merging list

list1 <- list(1,2,3)
list2 <- list("sun","mon","tue")

merged.list <- c(list1, list2)
print(merged.list)

#converting list to vector

v1 <- unlist(list1)
v2 <- unlist(list2)

print(v1)
print(v2)
print(paste(v1,v2))