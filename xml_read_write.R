#install.packages("XML")

library("XML")
library("methods")
result <- xmlParse(file = "input.xml")
print(result)

rootnode <- xmlRoot(result)
rootsize <- xmlSize(rootnode)
print(rootsize)

print(rootnode[1])

print(rootnode[[1]][[5]])

print(rootnode[[3]][[2]])

xmlDataFrame <- xmlToDataFrame("./input.xml")
print(xmlDataFrame)