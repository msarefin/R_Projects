star <- "*"
count <- 1

repeat{
  star <- paste(star,"*") 
  count = count +1
  if(count ==10){
    break
  }
}

print(star)

#Reading csv files
print(paste(star, "Reading a CSV file", star))
csv.data <- read.csv("input.csv")

print(csv.data)

print(is.data.frame(csv.data))
print(ncol(csv.data))
print(nrow(csv.data))
print(paste(star, "max salary",star))
sal <- max(csv.data$salary)
print(sal)
print(paste(star, "Query data with max salary",star))
retval <- subset(csv.data, salary == max(csv.data$salary))
print(retval)
print(paste(star, "Query dept IT",star))
retval <- subset(csv.data, dept =="IT")
print(retval)
print(paste(star, "Query salary >600 and dept IT",start))

retval <- subset(csv.data, salary >600 & dept =="IT")
print(retval)

print(paste(star, "Started on and after 2014",star))

retval <- subset(csv.data, as.Date(start_date) > as.Date("2014-01-01"))
print(retval)

#Write  Filterd date into new file
print(paste(star, "Writing to csv file",star))

write.csv(retval,"output.csv")
newdata <- read.csv("output.csv")
print(newdata)
