#Reading csv files
print("********* Reading a CSV file *********")
csv.data <- read.csv("input.csv")

print(csv.data)

print(is.data.frame(csv.data))
print(ncol(csv.data))
print(nrow(csv.data))
print("********* max salary *********")
sal <- max(csv.data$salary)
print(sal)
print("********* Query data with max salary *********")
retval <- subset(csv.data, salary == max(csv.data$salary))
print(retval)
print("********* Query dept IT *********")
retval <- subset(csv.data, dept =="IT")
print(retval)
print("********* Query salary >600 and dept IT *********")

retval <- subset(csv.data, salary >600 & dept =="IT")
print(retval)

print("********* Started on and after 2014 *********")

retval <- subset(csv.data, as.Date(start_date) > as.Date("2014-01-01"))
print(retval)