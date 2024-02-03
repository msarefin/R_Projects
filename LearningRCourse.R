#Learning R from Google Analytics

x <- c(1,3,5)
names(x) <- c("a","b","c")

list("a", 1L, 1.5, TRUE)

z <- list(list(list(1 , 3, 5)))

str(list("a", 1L, 1.5, TRUE))


#nameing list
list('Chicago' = 1, 'New York' = 2, 'Los Angeles' = 3)

install.packages("tidyverse")
library(tidyverse)
library(lubridate)

today()
now()

ymd("2020-10-12")
mdy("January 20th, 2021")
dmy("20-Jan-2021")
ymd(20210120)
ymd_hms("2021-01-20 20:11:59")
ymd_hms(now())
mdy_hm("01/20/2021 08:01")

as_date(now())


today <- as_date(now())
wday(today, label = TRUE)

with_tz(now(), "America/Chicago")
force_tz(now(), "America/Chicago")


#Data Frames

data.frame(x = c(1, 2, 3) , y = c(1.5, 5.5, 7.5))

#Create new directory in the current directory 
dir.create("sample")
#Copy a file to the sample directory
file.copy("LearningRCourse.R","sample")

#Delete a file in R using unlink()

unlink("sample/LearningRCourse.R")


install.packages("tidyverse")

library(tidyverse)
tidyverse_update()

#data analysts: ggplot2, dplyr, tidyr and readr. 

# tibble - data frame 
# purrr - Purrr works with functions and  vectors helping make your code easier to write and more expressive. 
# stringr - works with strings
# forcats - Solve common problems with factors


# Pipe operator  - A tool is R for expressing a sequence of multiple operations, represented with %>%

data("ToothGrowth") # loading the data set
View(ToothGrowth)
install.packages('dplyr')
library(dplyr)

# Filter Data
filtered_tg <- filter(ToothGrowth, dose == 0.5)
head(filtered_tg)

#Sort data in descending order
arrange(filtered_tg, len)

#nested functions - sorting the filtered data set
arrange(filter(ToothGrowth, dose == 0.5), len)

#Pipe functions %>%  - Ctrl|Cmd +Shift +m 

filtered_tooth_growth <- ToothGrowth %>% # Data set
  filter(dose == 0.5) %>% # Filter data
  arrange(len) # Sort the data

View(filtered_tooth_growth)


filtered_tooth_growth_group_by_supp <- ToothGrowth %>% 
  filter(dose == 0.5) %>% 
  group_by(supp) %>% 
  summarize(mean_len = mean(len, na.rm = T), group = "drop" )

View(filtered_tooth_growth_group_by_supp)

library(ggplot2)
data("diamonds")

head(diamonds)
str(diamonds)
colnames(diamonds)
glimpse(diamonds)

mutate(diamonds, carat_2 = carat*100)

as_tibble(diamonds)

#get the dististict cuts and the count of each cuts
diamonds %>% group_by(cut) %>% summarize(n())

#get the distict number of cut 
diamonds %>% summarize(n_distinct(cut))

d2 <- mutate(diamonds, carat2 = carat*100)

#read_csv(): comma-separated values (.csv) files
#read_tsv(): tab-separated values files
#read_delim(): general delimited files
#read_fwf(): fixed-width files
#read_table(): tabular files where columns are separated by white-space
#read_log(): web log files

readr_example()

read_csv(readr_example("challenge.csv"))
spec(read_csv(readr_example("challenge.csv")))

read_tsv(readr_example("epa78.txt"))
readr_example("epa78.txt")

read_fwf(readr_example("fwf-sample.txt"))
read_table(readr_example("massey-rating.txt"))

#Read Excel Files
library(readxl)
readxl_example()

read_xlsx(readxl_example("type-me.xlsx"))
read_excel(readxl_example("type-me.xlsx"))

excel_sheets(readxl_example("datasets.xlsx")) # List all the excel sheets with extension xlsx 
excel_sheets(readxl_example("datasets.xls")) # List all the excel sheets with extension xls

path <- readxl_example("datasets.xlsx")
path
typeof(path)

#list the name of all the sheets in the Workbook
excel_sheets(path)

# Read an individual sheet in a Workbook
read_excel(path, sheet = "iris")

# lapply reads all the sheets from the Excel Wrokbook
lapply(excel_sheets(path), read_excel, path = path)

mypath <- "input.xlsx"
lapply(excel_sheets(mypath), read_excel, path = mypath)

##### here, skimr & janitor
# here - makes referenceing files easier
# skimr - makes summarizing data eaier
# janitor - makes data cleaning easier

library("here")
library("skimr")
library("janitor")

install.packages("palmerpenguins")
library("palmerpenguins")

skim_without_charts(penguins)
glimpse(penguins)
head(penguins)

View(filter(penguins, sex == "male"))

# using pipe to filter data

# get the data set with specific columns
penguins %>% 
  select(species, island)

# Get the data set excluding sepcific columns 
penguins %>%  
  select(-species, -sex)

#Rename the column name of a specific column
penguins %>% 
  rename(gender = sex)

View(penguins %>% rename(gender = sex))

rename_with(penguins, toupper)
rename_with(penguins, tolower)


clean_names(penguins)

penguins %>% arrange(bill_length_mm)
penguins %>% arrange(-bill_length_mm)

penguins2 <- penguins %>% arrange(-bill_length_mm)
head(penguins2)


penguins %>% 
  group_by(island) %>% 
  drop_na() %>%  
  summarize(mean_bill_length_mm = mean(bill_length_mm))
