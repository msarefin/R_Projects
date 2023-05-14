#Data Reshaping

#create vector objects
city <- c("Tampa","Seattle","Hartford","Denver")
state <- c("FL","WA","CT","CO")
zipcode <- c(33602,98104,06161,80294)

#combine above vectors into data frame
address <- cbind(city,state,zipcode)

#print a header
cat('#### The First sata frame\n')

print(address)

new.address <- data.frame(
	city = c("Lowry","Charlotte"),
	state = c("Co","FL"),
	zipcode = c("80230","33949")
	stringsAsFactors = FALSE
)

#Print header
cat("### The Second Data frame\n")

#print the data frame
print(new.address)

all.addresses <- rbind(address, new.address)

cat("### The Combined frame\n")

print(all.addresses)