#Working with databases
install.packages("RMySQL")
library(RMySQL)

mysqlconnection = dbConnect(MySQL(),user = "msarefin",password = 'abc123',dbname = 'sakila', host = 'localhost')
dbListTables(mysqlconnection)


result = dbSendQuery(mysqlconnection, "select * from actor")

data.frame = fetch(result, n = 5 )
print(data.frame)

data.actor = fetch(result)
print(data.actor)

print(fetch(dbSendQuery(mysqlconnection, "select * from store")))

result = dbSendQuery(mysqlconnection, "select * from actor where last_name = 'TORN'")
data.frame = fetch(result, n = -1)
print(data.frame)

######### Create tables in mysql database using R 

dbWriteTable(mysqlconnection, "mtcars",mtcars[,],overwrite = TRUE)

dbSendQuery(mysqlconnection, "insert into mtcars(row_names, mpg, cyl, disp, hp, drat, wt, qsec, vs, am, gear, carb)
   values('New Mazda RX4 Wag', 21, 6, 168.5, 110, 3.9, 2.875, 17.02, 0, 1, 4, 4)"
            )

dbSendQuery(mysqlconnection, 'drop table if exists mtcars')