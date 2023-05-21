#Data Reshaping

<<<<<<< HEAD
#create vector objects
=======
########### Joining Columns and Data frames ###########

print("########### Joining Columns and Data frames ###########")

# Create vector objects.
>>>>>>> 904725307a8eded308cd2ed6968a88b9f1b78700
city <- c("Tampa","Seattle","Hartford","Denver")
state <- c("FL","WA","CT","CO")
zipcode <- c(33602,98104,06161,80294)

<<<<<<< HEAD
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
=======
# Combine above three vectors into one data frame.
addresses <- cbind(city,state,zipcode)

# Print a header.
cat("# # # # The First data frame\n") 

# Print the data frame.
print(addresses)

# Create another data frame with similar columns
new.address <- data.frame(
   city = c("Lowry","Charlotte"),
   state = c("CO","FL"),
   zipcode = c("80230","33949"),
   stringsAsFactors = FALSE
)

# Print a header.
cat("# # # The Second data frame\n") 

# Print the data frame.
print(new.address)

# Combine rows form both the data frames.
all.addresses <- rbind(addresses,new.address)

# Print a header.
cat("# # # The combined data frame\n") 

# Print the result.
print(all.addresses)

########### Merging Data Frames ###########

print("########### Merging Data Frames ###########")

library(MASS)

merged.Pima <- merge(x = Pima.te,y = Pima.tr,
	by.x = c("bp","bmi"),
	by.y = c("bp","bmi")
)

print(merged.Pima)
nrow(merged.Pima)

print("Melting and Casting")

print(ships)

print("@@@@@@ melt")
molten.ships <- melt(ships, id = c("type","year"))

print(molten.ships)

recasted.ship <- cast(molten.ships, type+year~variable, sum)
print(recasted.ship)
>>>>>>> 904725307a8eded308cd2ed6968a88b9f1b78700
