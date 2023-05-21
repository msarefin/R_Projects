#Reading csv files

csv.data <- read.csv("https://people.sc.fsu.edu/~jburkardt/data/csv/crash_catalonia.csv")

print(csv.data)

print(is.data.frame(csv.data))
print(ncol(csv.data))
print(nrow(csv.data))

max.crash <- max(csv.data$Number.of.Crashes)
print(max.crash)