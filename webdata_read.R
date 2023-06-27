#install.packages("RCurl")
#install.packages("XML")
#install.packages("stringr")
#install.packages("plyr")

library("XML")
library("methods")
result <- xmlParse(file="input.xml")
print(result)

rootnode <- xmlRoot(result)

rootsize <- xmlSize(rootnode)

print(rootsize)

print(rootnode[1])

print(rootnode[[1]][[1]])
print(rootnode[[1]][[5]])
print(rootnode[[1]][[2]])

xmldataframe <- xmlToDataFrame("input.xml")
print(xmldataframe)