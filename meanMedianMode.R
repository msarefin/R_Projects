#mean - t is calculated by taking the sum of the values and dividing with the number of values in a data series.
x <- c(12,7,3,4.2,18,2,54,-21,8,-5)

result.mean <- mean(x)
print(result.mean)

#Trim option 
 
#NA represents a missing value. To remove the missing value 
x <- c(12,7,3,4.2,18,2,54,-21,8,-5,NA)
# if there is a missing value the result will be NA
result.mean <- mean(x);
print(result.mean)

#To ignore missing values use na.rm = true 

result.mean <- mean(x, na.rm = TRUE)
print(result.mean)

#median - The middle most value in a data series is called the median.
x <- c(12,7,3,4.2,18,2,54,-21,8,-5)
median.result <- median(x)
print(median.result)

#mode - The mode is the value that has highest number of occurrences in a set of data.

#create the function 
getmode <- function(v){
  uniqv <-unique(v); 
  uniqv[which.max(tabulate(match(v,uniqv)))]
}

v <- c(2,1,2,3,1,2,3,4,1,5,5,3,2,3)
result <- getmode(v)
print(result)

charv <- c("o","it","the","it","it")

result <- getmode(charv)
print(result)