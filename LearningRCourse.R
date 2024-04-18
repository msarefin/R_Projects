source('Package list.R')

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

head(diamonds) # Generate only the first 10 data frame
str(diamonds) # Structure of the date frame
colnames(diamonds) # Column names
glimpse(diamonds) # Gives you a glimpse of the high level info

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

#Get the list od all data sources in R - data()

data()

# To load the data of the penguins in the dataset 

data("penguins")

skim_without_charts(penguins)
glimpse(penguins)
head(penguins)


# Filter data from he penguins dataset - filter

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

# To rename all the columns of the dataset to either upper or lower 
rename_with(penguins, toupper)
rename_with(penguins, tolower)

penguins %>% rename_with(toupper)
penguins %>% rename_with(tolower)

# Ensure that the columns names only has letteres, number and underscores in them
clean_names(penguins)

penguins %>% clean_names()


#Organizing your data
#using arrange(), group_by(), filter()

#arrange()
penguins %>% arrange(bill_length_mm)
penguins %>% arrange(-bill_length_mm)

penguins2 <- penguins %>% arrange(-bill_length_mm)
head(penguins2)

#group_by()
penguins %>% 
  group_by(island) %>% 
  drop_na() %>%  
  summarize(mean_bill_length_mm = mean(bill_length_mm))

penguins %>% 
  group_by(island) %>% 
  drop_na() %>% 
  summarize(n())


penguins %>% 
  group_by(island) %>% 
  drop_na() %>% 
  summarize(max_bill_length_mm = max(bill_length_mm))

penguins %>% 
  group_by(island,species) %>% 
  drop_na() %>% 
  summarize(max_bl = max(bill_length_mm),mean_bl = mean(bill_length_mm))

#filter

penguins %>% filter(species=="Adelie")


## doing the exercise - Hotel booking from csv file
library(tidyverse)
library(skimr)
library(janitor)

bookings_df <- read_csv(file ="sample/hotel.csv")

head(bookings_df)
str(bookings_df)
glimpse(bookings_df)
colnames(bookings_df)
skim_without_charts(bookings_df)


#cleaning the data 

trimmed_df <- bookings_df %>% select(hotel, is_canceled, lead_time)

#renaming hotel to hotel type
trimmed_df <- bookings_df %>%  select(hotel, is_canceled, lead_time) %>%  rename(hotel_type = hotel)

# Uniting the two columns

example_df <- bookings_df %>% 
  select(arrival_date_year, arrival_date_month) %>% 
  unite(arrival_month_year, c("arrival_date_month","arrival_date_year"), sep = " ")

#mutate

example_df <- bookings_df %>% 
  mutate(guests = adults+children+babies)

# Calculate the total number of canceled bookings and average lead time booking

example_df <- bookings_df %>% 
  summarize(number_canceled  =sum(is_canceled),average_lead = mean(lead_time))

head(example_df)


#Manually creating data frame

id <- c(1:10)
name <- c("John Mendes", "Rob Stewart", "Rachel Abrahamson", "Christy Hickman", "Johnson Harper", "Candace Miller", "Carlson Landy", "Pansy Jordan", "Darius Berry", "Claudia Garcia")
job_title <- c("Professional", "Programmer", "Management", "Clerical", "Developer", "Programmer", "Management", "Clerical", "Developer", "Programmer")
employee <- data.frame(id, name, job_title)

print(employee)


# Transforming Data 
#separete(), unite(), mutate()


#separete()

separate(employee, name, into = c("first_name","last_name"), sep = ' ')

emp <- separate(employee, name, into = c("First_Name", "Last_Name"), sep = ' ')

print(emp)

#unite()

unite(emp, Name, First_Name, Last_Name, sep = ' ')

# mutate()

penguins %>% mutate(body_mass_kg = body_mass_g/1000, flipper_length_m = flipper_length_mm/1000)


#Pivot and Unpivot tables - pivot_longer(), pivot_wider()

pivot_longer(relig_income, cols = !religion, names_to = "income", values_to = "count")

relig_income %>% 
  pivot_longer(
    cols = !religion, # Every columns except religion will be pivoted from columns to rows
    names_to = "income", # Pivoted columns will be placed under the column "income"
    values_to="count"  # Values from the pivoted columns will be placed under the column "count"
    )


billboard %>% 
  pivot_longer(
    cols = starts_with("wk"), 
    names_to = "week", 
    values_to = "count", 
    values_drop_na = TRUE
    )


billboard %>% 
  pivot_longer(
    cols = starts_with("wk"),
    names_to = "week", 
    names_prefix = "wk",
    names_transform = as.integer, 
    values_to = "rank",
    values_drop_na = TRUE
  )

billboard %>% 
  pivot_longer(
    cols = starts_with("wk"),
    names_to = "week",
    names_transform = readr::parse_number,
    values_to = "rank",
    values_drop_na = TRUE
  )

# Many variable in column names

whod<- who %>% 
  pivot_longer(
    cols = new_sp_m014:newrel_f65,
    names_to = c("diagnosis", "gender", "age"), 
    names_pattern = "new_?(.*)_(.)(.*)",
    values_to = "count", 
    #values_drop_na = TRUE
  )


who %>% 
  pivot_longer(
    cols = new_sp_m014:newrel_f65,
    names_to = c("diagnosis","gender","age"), 
    names_pattern = "new_?(.*)_(.)(.*)",
    names_transform = list(
      gender = ~ readr::parse_factor(.x,levels = c("f","m")),
      age = ~ readr::parse_factor(
        .x,
        levels= c("014", "1524", "2534", "3544", "4554", "5564", "65"),
        ordered = TRUE
      )
    ),
    values_to = "count"
  )

#multiple observations per row

print(household) # This data set has 2 observations per row

print(household)

household %>% pivot_longer(
  cols = !family,
  names_to = c(".value","child"), #.value tells that there is part of the col specifies the value being measured
  names_sep = "_",
  values_drop_na = TRUE
)

hh <- household %>% 
  rename(
    children1_dob = dob_child1, 
    children2_dob = dob_child2, 
    children1_name = name_child1, 
    children2_name = name_child2
    )

hh %>% pivot_longer(
  cols = !family, 
  names_to = c("children",".value"), 
  names_sep = "_",
  values_drop_na = T
)

anscombe %>% 
  pivot_longer(
    cols = everything(), 
    cols_vary = "slowest",
    names_to = c(".value","set"),
    names_pattern = "(.)(.)"
  )

pnl <- tibble(
  x = 1:4,
  a = c(1, 1,0, 0),
  b = c(0, 1, 1, 1),
  y1 = rnorm(4),
  y2 = rnorm(4),
  z1 = rep(3, 4),
  z2 = rep(-2, 4),
)

print(pnl)

pnl %>% 
  pivot_longer(
    cols = !c(x,a,b),
    names_to = c(".value","time"),
    names_pattern = "(.)(.)"
  )

##pivot_wider() - the opposite of pivot_longer()

fish_encounters

fish_encounters %>% 
  pivot_wider(
    names_from = station, 
    values_from = seen,
    values_fill = 0
  )

#Aggrigation with pivot_wider

warpbrakes <- warpbreaks %>% tibble() %>% select(wool, tension, breaks)

warpbrakes %>% count(wool, tension)

warpbrakes %>% pivot_wider(names_from = wool, values_from = breaks, values_fn = mean)
warpbrakes %>% pivot_wider(names_from = wool, values_from = breaks, values_fn = median)
warpbrakes %>% pivot_wider(names_from = wool, valeus_from = breaks, values_fn = sum)

#Create a function for mode
getmode <- function(v){
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}

warpbrakes %>% pivot_wider(names_from = wool, values_from = breaks, values_fn = getmode)

# Generate column names from multiple variables

#Data Combination Product, country, year
         
production <- 
  expand_grid(
    product = c("A", "B"), 
    country = c("AI", "EI"), 
    year = 2000:2014
  ) %>%
  filter((product == "A" & country == "AI") | product == "B") %>% 
  mutate(production = rnorm(nrow(.)))

production

production %>% 
  pivot_wider(
    names_from = c(product, country), 
    values_from = production
    )

production %>%  pivot_wider(
  names_from = c(product, country), 
  names_sep = ".", 
  names_prefix = "prod.",
  values_from = production
)

production %>% pivot_wider(
  names_from = c(product, country), 
  values_from = production,
  names_glue = "prod_{product}_{country}"
)

us_rent_income %>% pivot_wider(names_from = variable, values_from = c(estimate, moe))

us_rent_income %>% pivot_wider(names_from = variable, values_from = c(estimate, moe), names_sep = ".", names_prefix = "Hist.")


#implicite missing values  - Occasionally you will come across data where the name variables are encoded but not all not all the data is represented
# In this case the week day is encoded but not all days of the week are presented or has values against them.

weekday <- c("Mon","Tue","Wed","Thu","Fri","Sat","Sun")

daily <-tibble(
  day= factor(c("Tue","Thu","Fri","Mon"),levels = weekday),
  values = c(2,3,1,5)
)

daily %>% pivot_wider(names_from = day, values_from = values)

# In some cases it is prefered to expand the data to get a better representation of the data. 
#This is done by setting names_expand to TRUE.

daily %>% pivot_wider(names_from = day, values_from = values, names_expand = T)

daily %>%  pivot_wider(names_from = day, values_from = values, names_expand = T, values_fill = 0)

percentages <- tibble(
  year = c(2018,2019,2020,2020),
  type = factor(c("A","B","A","B"), levels = c("A","B")),
  percentage = c(100,100,40,60)
)

percentages %>% pivot_wider(
  names_from = c(year, type),
  values_from = percentage,
  names_expand = T, 
  values_fill = 0
)

daily <- mutate(daily, type = factor(c("A", "B", "B", "A")))
daily

daily %>%  pivot_wider(
  names_from = type, 
  values_from = values, 
  values_fill = 0
)

daily %>% pivot_wider(
  names_from = type, 
  values_from = values, 
  values_fill = 0, 
  id_expand = T
)

daily %>%  pivot_wider(
  names_from = day, 
  values_from = values, 
  values_fill = 0,
  names_expand = T
)

#Unused Columns 

update <- tibble(
  county = c("Wake","Wake","Wake","Guilford","Guilford"), 
  date = c(as.Date("2020-01-01")+0:2, as.Date("2020-01-03")+0:1), 
  system = c("A","B","C","A","C"), 
  value = c(3.2,4,5.5,2,1.2)
)

update %>% pivot_wider(
  id_cols = county, 
  names_from = system,
  values_from = value
)

update %>%  pivot_wider(
  id_cols = county, 
  names_from = system,
  values_from = value, 
  values_fill = 0, 
  unused_fn = list(date = max)
)

update %>%  pivot_wider(
  id_cols = county, 
  names_from = system, 
  values_from = value,
  values_fill = 0, 
  unused_fn = list(date = list)
)

contacts <- tribble(
  ~field, ~value, 
  "name","Jiena McLellan",
  "company","Toyota",
  "name","John Smith",
  "company","google",
  "email","john@google.com",
  "name", "Huxkey Ratcliffe"
)

contacts <- contacts %>% 
  mutate(person_id = cumsum(field == "name"))

contacts %>%  pivot_wider(
  names_from = field, 
  values_from = value, 
  #values_fill = "None"
)

#Using both Longer() and wider() to represent data

# The data set used here is world_bank_pop
world_bank_pop

# In the data set the years are spread out. 
#So, we will use pivot_longer to put all the years in the year column and the values in the value column

pop2 <- world_bank_pop %>% 
  pivot_longer(
    cols = `2000`:`2017`,
    names_to = "year",
    values_to = "value"
  )

#count the number of indicators
pop2 %>% count(indicator,name = "Number of indicators")

#split the values into to separate columns - area and variable
pop3 <- pop2 %>%  separate(indicator, c(NA, "area","variable"))

#pivot wider to conver the the variable to columns
pop3 %>% pivot_wider(names_from = variable, values_from = value)


#Multi-choice 

multi <- tribble(
  ~id, ~choice1, ~choice2, ~choice3,
  1, "A", "B", "C",
  2, "C", "B",  NA,
  3, "D",  NA,  NA,
  4, "B", "D",  NA
)

multi

multi2 <- multi %>% 
  pivot_longer(
    cols = !id, 
    values_drop_na = T
  ) %>% mutate(checked = T)

multi2

multi2 %>%  pivot_wider(
  id_cols = id,
  names_from = name, 
  values_from = checked,
  values_fill = FALSE
)


spec <- relig_income %>% build_longer_spec(
  cols = !religion, 
  names_to = "income", 
  values_to = "count"
)
spec 
pivot_longer_spec(relig_income, spec)

us_rent_income

us_rent_income %>% pivot_wider(
  names_from = variable, 
  values_from = c(estimate, moe)
)

spec1 <- us_rent_income %>% 
  build_wider_spec(
    names_from = variable, 
    values_from = c(estimate, moe)
  )

spec1

us_rent_income %>%  pivot_wider_spec(spec1)

spec2 <- spec1 %>%  mutate(.name = paste0(variable, ifelse(.value == "moe","_moe","")))

spec2  

us_rent_income %>%  pivot_wider_spec(spec2)

#By hand

construction

spec <- tribble(
  ~.name,            ~.value, ~units,  ~region,     
  "1 unit",          "n",     "1",     NA,          
  "2 to 4 units",    "n",     "2-4",   NA,          
  "5 units or more", "n",     "5+",    NA,          
  "Northeast",       "n",     NA,      "Northeast", 
  "Midwest",         "n",     NA,      "Midwest",   
  "South",           "n",     NA,      "South",     
  "West",            "n",     NA,      "West",      
)

#######################################

#Same Data, different outcome

install.packages("Tmisc")
library(Tmisc)
data("quartet")
print(quartet)

quartet %>%  
  group_by(set) %>% 
  summarize(mean(x), sd(x),mean(y),sd(y), cor(x,y))

ggplot(quartet, aes(x,y))+geom_point()+geom_smooth(method=lm, se = FALSE)+facet_wrap(~set)

install.packages('datasauRus') 

library('datasauRus')

ggplot(datasaurus_dozen,aes(x=x,y=y,colour=dataset))+geom_point()+theme_void()+theme(legend.position = "none")+facet_wrap(~dataset,ncol=3)

#The Bias Function 

install.packages("SimDesign")
library(SimDesign)


actual_temp <- c(68.3,70,72.4,71,67,70)
predicted_temp <- c(67.9,69,71.5,70,67,69)
bias(actual_temp, predicted_temp)


actual_sales <- c(150,203,137,247,116,287)
predicted_sales <- c(200,300,150,250,150,300)
bias(actual_sales, predicted_sales)

penguins %>% tibble()


p <- penguins %>% mutate(
  bill_length_mm = ifelse(is.na(bill_length_mm),0, bill_length_mm),
  bill_depth_mm = ifelse(is.na(bill_depth_mm), 0 , bill_depth_mm), 
  flipper_length_mm = ifelse(is.na(flipper_length_mm),0, flipper_length_mm),
  body_mass_g = ifelse(is.na(body_mass_g), 0, body_mass_g)
  )
p


ggplot(data = penguins) + geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g))

ggplot(data = penguins, aes(x = flipper_length_mm, y = body_mass_g))+geom_point()

ggplot(data = penguins, aes(x = flipper_length_mm, y = body_mass_g))+geom_point(aes(color = species))+facet_wrap(~species)+labs(title = "Palmer Penguins:Body Mass vs. Flipper Length")

ggplot(data = penguins, aes(x = flipper_length_mm, y = body_mass_g))+
geom_point(aes(color = species))+
facet_wrap(~species)+
labs(title = "Palmer Penguins: Body mass vs Flipper Length")

# Lerning from https://ggplot2.tidyverse.org/


ggplot(mpg, aes(displ, hwy, colour = class))+geom_point()
ggplot(data = mpg, aes(x = displ, y = hwy, colour = class),facet_wrap(~class),labs(title = "Class of cars - hwy vs displ"))+geom_point()



#Getting started with ggplot

library("ggplot2")
library("palmerpenguins")

data("penguins")


ggplot(data= penguins)+
  geom_point(mapping = aes(x = flipper_length_mm, y= body_mass_g))


ggplot(data= penguins)+
  geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g, color = species))


ggplot(data = penguins)+
  geom_point(mapping = aes(x= bill_length_mm, y = bill_depth_mm, color = species))+facet_wrap(~species)


ggplot()+geom_point(data = penguins, mapping = aes(x = flipper_length_mm, y = body_mass_g, color = species, shape = sex), show.legend = T)+facet_wrap(~species ~sex)


ggplot(data = penguins)+
  geom_point(
    mapping = aes(
      x = flipper_length_mm, 
      y = body_mass_g, 
      color = species, shape = sex, size = sex, alpha = species),
    color = "maroon")+
  facet_wrap(~species)

ggplot(data = penguins, aes(x= flipper_length_mm, y = body_mass_g, color = species ))+geom_smooth()

ggplot(data = penguins, aes(x = flipper_length_mm, y = body_mass_g)) + geom_point()+geom_smooth()

ggplot(data = penguins, aes(x = flipper_length_mm, y = body_mass_g,linetype = species))+ geom_smooth()

ggplot(data = penguins, aes(x = flipper_length_mm, y = body_mass_g,linetype = species))+ geom_point()
ggplot(data = penguins, aes(x = flipper_length_mm, y = body_mass_g,linetype = species))+ geom_jitter()


ggplot(data = diamonds)+geom_bar(mapping = aes(x = cut))
ggplot(data = diamonds)+geom_bar(mapping = aes(x = cut, color = cut))
ggplot(data = diamonds)+geom_bar(mapping = aes(x = cut, fill = cut))
ggplot(data = diamonds)+geom_bar(mapping = aes(x = cut, fill = clarity))

ggplot(data = diamonds)+geom_bar(mapping = aes(x = cut, fill = clarity))+facet_wrap(~clarity)
ggplot(data = diamonds)+geom_bar(mapping = aes(x = cut, fill = clarity))+facet_grid(cut~clarity)

#Learning rmarkdown
install.packages("rmarkdown")
library(rmarkdown)

