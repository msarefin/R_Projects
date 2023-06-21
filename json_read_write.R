library("rjson")

result <- fromJSON(file = "./input.json")
print(result)


json_data_frame <- as.data.frame(result)
print(json_data_frame)