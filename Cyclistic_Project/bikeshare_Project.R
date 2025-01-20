source("Package list.R")
library(data.table)
df <- 
  list.files(
    path = "~/Projects/R_projects/Capstone Project/Cyclistic/2023/", 
    pattern = "*.csv", 
    full.names = T) 

myfiles<- lapply(df, read.csv)
