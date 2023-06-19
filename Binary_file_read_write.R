if(file.exists("mtcars.csv")){
  file.remove("mtcars.csv")
  print("mtcars.csv was found and removed")
}else{
  print("mtcars.csv not found")
}


write.table(mtcars, file = "mtcars.csv",row.names = FALSE, na ="", col.names = TRUE, sep=",")

#Read the CSV file
new.mtcars <- read.table("mtcars.csv",sep=",", header = TRUE, nrow = 5)


# Create a connection object to write the binary file using mode "wb".
write.filename = file("./bitmtcars.dat","wb")

# Write the column names of the data frame to the connection object.
writeBin(colnames(new.mtcars),write.filename)

# Write the records in each of the column to the file.
writeBin(c(new.mtcars$cyl, new.mtcars$am, new.mtcars$gear),write.filename)

close(write.filename)

##########################
# reading file

