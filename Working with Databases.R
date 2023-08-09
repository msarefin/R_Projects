#Working with databases
install.packages("RMySQL")
library(RMySQL)

mysqlconnection = dbConnect(MySQL(),user = "msarefin",password = 'abc123',dbname = 'sakila', host = 'localhost')
dbListTables(mysqlconnection)

result = dbSendQuery(mysqlconnection, "select * from actor")

data.frame = fetch(result, n = 5 )
print(data.frame)
