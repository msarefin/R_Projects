#Check if excel reader package is installed
bool <- any(grepl("readxl",installed.packages()))

print(bool)

if(bool){
  print("excel Package already installed!!")
  
  
}else{
  #install excel package
  print("installing xlsx package to work with excel files")
  install.packages("readxl")
}

#load excel packages

library("readxl")

excelData <- read_excel("input.xlsx", sheet = "sheet1")
print(excelData)

data <- read_excel("input.xlsx",sheet = 1)
print(data)
str(data)

print(read_excel("input.xlsx",sheet = "city"))
print(read_excel("input.xlsx",col_names = FALSE))