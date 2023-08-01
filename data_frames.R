#Data Frames

#Create the data frame

emp.data <- data.frame(
	emp_id = (1:5),
	emp_name = c("Rick","Dan","MIchelle","Ryan","Gary"),
	salary = c(323.3,515.2,611.0,729.0,843.25),

	start_date = as.Date(c("2012-01-01", "2013-09-23", "2014-11-15", "2014-05-11",
      "2015-03-27")),
	stringsAsFactors = FALSE
)

print(emp.data)
print(is.factor(emp.data$emp_id))

#Get the structure of the Data frame
str(emp.data)

#Print the summary 

print(summary(emp.data))

#extract data from frame 

result <- data.frame(emp.data$emp_name, emp.data$salary)
print(result)

print(emp.data)
#Extract Data from the first two rows 

result <- emp.data[1:2,]
print(result)

result <- emp.data[c(3,4),c(2,4)]
print(result)

#add the dept column 

emp.data$dept <- c("IT","Operations","IT","HR","Finance")
v <- emp.data
print(v)

#creating a second data frame to merge 

emp.newdata <- data.frame(
	emp_id =c(6:8),
	emp_name =c("Rasmi","Pranab","Tusar"),
	salary = c(578.0,722.5,632.8),
	start_date = as.Date(c("2013-05-21","2013-07-30","2014-06-17")),
	dept =c("IT","Operations","Finance"),
	stringsAsFactors = FALSE
)

emp.finalbind <- rbind(emp.data, emp.newdata)
print(emp.data)
print(emp.newdata)
print(emp.finalbind)



