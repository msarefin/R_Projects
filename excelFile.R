#Check if excel package is installed
bool <- any(grepl("xlsx",installed.packages()))

print(bool)

if(bool){
  print("excel Package already installed!!")
  
  
}else{
  #install excel package
  print("installing xlsx package to work with excel files")
  install.packages("xlsx")
}

#load excel packages

library("xlsx")

data <- read.xlsx("input.xlsx",sheetIndex = 1)
print(data)

print(read.xlsx("input.xlsx",sheetName = "city"))