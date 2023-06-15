write.table(mtcars, file = "mtcars.csv",row.names = FALSE, na ="", col.names = TRUE, sep=",")

#Read the CSV file
new.mtcars <- read.table("mtcars.csv",sep=",", header = TRUE, nrow = 5)

#write the .dat file
write.filename = file("./bitmtcars.dat","wb")

#create connection to write the file 
writeBin(colnames(new.mtcars),write.filename)

#write into the file
writeBin(c(new.mtcars$cyl, new.mtcars$am, new.mtcars$gear),write.filename)

close(write.filename)

##########################
# reading file

