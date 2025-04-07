#https://r4ds.hadley.nz/

# all packages can be loaded from a separate source file 

# Chapter 1 - https://r4ds.hadley.nz/data-visualize

install.packages("tidyverse")
library(tidyverse)

library(palmerpenguins)
library(ggthemes)

palmerpenguins::penguins

glimpse(penguins)
View(penguins);


ggplot(data = penguins, mapping=aes(x=flipper_length_mm, y = body_mass_g))+ geom_point() 

ggplot(data = penguins)+geom_point(mapping = aes(x= flipper_length_mm, y = body_mass_g))
ggplot(penguins, mapping = aes(flipper_length_mm,body_mass_g))+geom_point()
ggplot(penguins)+geom_point(aes(flipper_length_mm, body_mass_g))

ggplot(data = penguins, mapping = aes(x= flipper_length_mm, y = body_mass_g, color = species))+
  geom_point()+geom_smooth(method = "lm")

ggplot(data = penguins, mapping = aes(x= flipper_length_mm, y = body_mass_g))+
  geom_point(mapping = aes(color = species, shape = species))+geom_smooth(method = "lm")
last_plot() #This will call the last plot that was created

##
ggplot(data = penguins, mapping = aes(x = flipper_length_mm, y = body_mass_g))+
  geom_point(mapping = aes(color = species, shape = species))+
  geom_smooth(method = "lm")+
  labs(
    title = "Body Mass vs Flipper Length",
    subtitle = "Dimensions for Adelie, Chinstrap, and Gentoo Penguins",
    x = "Flipper Length (mm)",y = "Body Mass (g)",
    color = "species", shape = "species"
    )+
  scale_color_colorblind()

#We can also do this 

ggplot(data = penguins, mapping = aes(x = flipper_length_mm, y = body_mass_g))+
  geom_point(mapping = aes(color = species, shape = species ))+
  geom_smooth(method = "lm")+ scale_color_colorblind()+
  labs(
    title = "Penguins Information",
    subtitle = "Flipper length vs Body Mass",
    x = "Flipper length (m)", y = "Body mass (g)",
    color = "species", shape = "species"
  )

#

ggplot(data = penguins, mapping = aes(x = species, y = bill_depth_mm))+
  geom_col(mapping = aes(color = species))+
  labs(
    title = "Penguins Data",
    subtitles = "Species vs Bill Debth",
    x = "Species", y = "Bill Depth (mm)",
  )

# na.rm = T will remove all rows and columns with missing values.
ggplot(data = penguins, mapping = aes(x = flipper_length_mm, y = body_mass_g))+
  geom_point(na.rm = T, mapping = aes(color = species, shape = species))+
  labs(
    title = "Palmer Penguins Data",
    subtitle = "Flipper length vs Body mass",
    x = "Flipper Length (mm)", y = "Body mass (g)",
    color = "Species", shape = "species",
    caption = "(Data is bases on a study conducted between 2007-09)",
    tag = "Exhibit A",
    alt = "Penguins Data",
    alt_insight = "Penguins Data 2007-09"
  )+geom_smooth(method = "lm")

#to save the graph on as a file 

png(file = "penguin.png")

ggplot(data = penguins, mapping = aes(x = flipper_length_mm, y= body_mass_g))+
  geom_point(mapping = aes(color = species, shape = species))+
  geom_smooth(method = "lm")

dev.off()

############################## Saving files using ggsave 

penguins |> ggplot(mapping = aes(x = flipper_length_mm, y= body_mass_g))+geom_point()

penguins |> ggplot(mapping = aes(x = flipper_length_mm, y = body_mass_g))+
  geom_point(mapping = aes(color = species, shape = species))+
  geom_smooth(method = "lm")

my_bar_plot <- ggplot(mpg, aes(x = class)) + geom_bar()
my_scatter_plot <- ggplot(mpg, aes(x= cty, y = hwy)) + geom_point()

ggsave(filename = "mpg_bar_chart.png", plot = my_bar_plot)

############################### 
#Chapter 3 - https://r4ds.hadley.nz/data-transform

install.packages("nycflights13")
library(nycflights13)

flights |> 
  filter(dest == "IAH") |>
  group_by(year, month, day) |>
  summarize(arr_delay = mean(arr_delay, na.rm = T))


flights |> filter(dep_delay>120)
# Filter flights to show Jan and Feb
flights |> filter(month == 1 & day == 1)
# Filter flights to show Jan or Feb
flights |> filter(month ==1 | day == 2)
# Filter flights to show Jan or Feb
flights |> filter(month %in% c(1,2))

jan1 <- flights |> filter(month ==1 & day==1)
print(jan1)
glimpse(jan1)

# order by data using arrange
flights |> arrange(year, month, day, dep_time)
# order by descending order
flights |> arrange(desc(dep_delay))
# Find distinct data
flights |> distinct(origin, dest) 
# Find Distinct and keep all columns - distinct find the first occurence of the data and discards the rest. 
flights |> distinct(origin, dest, .keep_all = T)

#Find the number of occurences of a data set
flights |> count(origin, dest, sort = T)

# In a single pipeline for each condition, find all flights that meet the condition:
#   
#   *Had an arrival delay of two or more hours 
#   Flew to Houston (IAH or HOU)
#   *Were operated by United, American, or Delta
#   Departed in summer (July, August, and September)
#   Arrived more than two hours late but didn’t leave late
#   Were delayed by at least an hour, but made up over 30 minutes in flight

flights |> filter(
  arr_delay >=120,
  dest %in% c("IAH","HOU"), 
  carrier %in% c("UA","AA","DL"),
  month %in% c(7:9),
  )

flights |> filter(
  carrier %in% c("UA","AA","DL"),
  month %in% c(7:9),
  arr_delay >=120 & dep_delay <=0,
)


flights |> filter(
  arr_delay >=120, dep_delay <=0,
  arr_delay >=60, dep_delay - arr_delay <=30
)

# Sort flights to find the flights with the longest departure delays. 
# Find the flights that left earliest in the morning.

flights |> arrange(desc(dep_delay), hour)
flights |> arrange(hour)

summary(flights$dep_time)
flights |> filter(dep_time<=600)

# Find the fastest flight

flights |> arrange(distance/air_time)

# Was there a flight on every day of 2013?

flights |> distinct(year, month, day)
  
# Which flights traveled the farthest distance? Which traveled the least distance?
  
flights |> arrange(desc(distance))

##### mutate() and select()

flights |> mutate(
  gain = dep_delay - arr_time,
  speed = distance/air_time *60
  )


#mutate with .before argument

flights |> mutate(gain = dep_delay - arr_delay, speed = distance/air_time * 60, .before = 1)


#mutate with .after argument 

flights |> mutate(gain = dep_delay-arr_delay, speed = distance/air_time, .after = day)

#mutate with .keep argument 

# Control which columns from .data are retained in the output. 
# Grouping columns and columns created by ... are always kept.
# "all" retains all columns from .data. This is the default.
# "used" retains only the columns used in ... to create new columns. 
# This is useful for checking your work, as it displays inputs and outputs side-by-side.
# "unused" retains only the columns not used in ... to create new columns. 
# This is useful if you generate new columns, but no longer need the columns used to generate them.
# "none" doesn't retain any extra columns from .data. 
# Only the grouping variables and columns created by ... are kept.

flights |> mutate(gain = dep_delay - arr_delay, speed = distance/air_time * 60, .keep = "used")

#select 

flights |> select(year, month, day)

flights |> select(year:day)

flights |> select(!year:day)

flights |> select(where(is.character))

flights |> select (year:day,origin:distance )|> mutate(speed = distance/air_time *60, .after  = "distance")

#rename

flights |> rename(tail_num = tailnum)

#relocate

flights |> relocate(time_hour, air_time)

       flights |> relocate(year:dep_time, .after = time_hour)
flights |> relocate(starts_with("arr"),.before = dep_time)

#group by

flights |> group_by(month) |> summarize(avg_delay = mean(dep_delay, na.rm = T))

flights |> summarise(avg_delay = mean(dep_delay, na.rm = T), .by = month)


#Styler 

install.packages("styler")

flights |> mutate(
  speed = distance/air_time, 
  dep_hour = dep_time %/% 100, 
  dep_minute = dep_time %% 100,
   .keep = "used"
)

flights |> 
  filter(!is.na(arr_delay), !is.na(tailnum)) |> 
  count(dest)


flights |> 
  group_by(tailnum)|> 
  summarize(
    delay = mean(arr_delay, na.rm = T),
    n = n()
  )

flights |> 
  group_by(month) |>
  summarize(
    delay = mean(arr_delay, na.rm = T)
  ) |>
  ggplot(aes(x = month, y = delay))+
  geom_point()+
  geom_line()


flights |> group_by(dest) |>
  summarize(
    distance = mean(distance), 
    speed = mean(distance/ air_time, na.rm = T)
  ) |>
  ggplot(aes(x = distance, y = speed))+
  geom_smooth(
    method = "loess", 
    span = 0.5, 
    se = FALSE, 
    color = "white", 
    linewidth = 4
  )+geom_point()


# Chapter 5 https://r4ds.hadley.nz/data-tidy

table1 |>
  group_by(year) |>
  summarize(total_cases = sum(cases))

table1 |>
  ggplot(mapping = aes(x = year, y = cases))+
  geom_line(mapping = aes(group = country), color = "grey50")+
  geom_point(mapping = aes(color = country, shape = country))+
  scale_x_continuous(breaks = c(1999,2000))

### Exercise 5.2.1

# For each of the sample tables, describe what each observation and each column represents.
# 
# Sketch out the process you’d use to calculate the rate for table2 and table3. 
# You will need to perform four operations:
#   
# Extract the number of TB cases per country per year.
# Extract the matching population per country per year.
# Divide cases by population, and multiply by 10000.
# Store back in the appropriate place.


cases <- table2 |> 
  filter(type == "cases") |> 
  select(country, year, cases = count)

population <- table2 |> 
  filter(type == "population") |> 
  select(country, year, population = count)
  
TB_table <- merge(cases, population)

TB_table |> mutate(rate = cases/population *1000)

# easier way

table2 |> 
  pivot_wider(names_from = type, values_from = count) |>
  mutate(rate = cases/population *1000)




table3 |> 
  separate_wider_delim(cols = rate, delim = "/", names = c("cases","population")) |>
  mutate(rates = as.numeric(cases)/as.numeric(population) *1000)

table3 |> 
  separate_wider_delim(
    cols = rate, 
    delim = "/", 
    names = c("cases","population")) |>
  mutate(
    cases = as.numeric(cases),
    population = as.numeric(population),
    rate = cases/population *1000)


#pivoting data 

billboard |> pivot_longer(
  cols = starts_with("wk"),
  names_to = "Week",
  values_to = "rank"
)


billboard |>
  pivot_longer(
    cols = stats_with("wk"), 
    name_to = "week",
    values_to = "rank", 
    values_drop_na = T
  )

# There are five handy functions that allow you to extract specific rows within each group:
#   
# df |> slice_head(n = 1) takes the first row from each group.
# df |> slice_tail(n = 1) takes the last row in each group.
# df |> slice_min(x, n = 1) takes the row with the smallest value of column x.
# df |> slice_max(x, n = 1) takes the row with the largest value of column x.
# df |> slice_sample(n = 1) takes one random row.

flights |> 
  group_by(dest) |>
  slice_max(arr_delay, n = 1) |>
  relocate(dest)

daily <- flights |> group_by(year, month, day)
daily_flights <- daily |> summarize(n = n())
daily_flights1 <- daily |>summarize(n = n(), .groups = "drop_last")
daily_flights2 <- daily |>summarize(n = n(), .groups = "drop")
daily_flights3 <- daily |>summarize(n = n(), .groups = "keep")


flights |> 
  group_by(year, month, day) |>
  summarise(n = n(), .groups = "drop_last")

#ungroup data set
daily |> 
  ungroup() |> 
  summarize(
    avg_delay = mean(dep_delay, na.rm = T),
    flights = n()
  )


# 5.3 Data Lengthening - Pivot Table - Pivot_longer

billboard |> 
  pivot_longer(
    cols = starts_with("wk"),
    names_to = "week", 
    values_to = "rank"
  )

billboard |> 
  pivot_longer(
    cols = !c(artist, track, date.entered), 
    names_to = "week", 
    values_to = "rank", 
    values_drop_na = T
  )

billboard |> 
  pivot_longer(
    cols =! (artist:date.entered), 
    names_to = "weeks", 
    values_to = "rank"
    )

billboard |> 
  pivot_longer(
    cols = !c(artist, track, date.entered), 
    names_to = "week", 
    values_to = "rank", 
    values_drop_na = T
  )


# readr::parse_number(). parse_number() is a handy function that will extract 
# the first number from a string, ignoring all other text.

billboard |>
  pivot_longer(
    cols = starts_with("wk"), 
    names_to = "week", 
    values_to = "rank", 
    values_drop_na = T
  ) |>
  mutate(
    week = parse_number(week)
  )

# Lets plot the graph

billboard_pivot_long <- billboard |>
  pivot_longer(
    cols = starts_with("wk"),
    names_to = "week", 
    values_to = "rank", 
    values_drop_na = T
  ) |>
  mutate(
    week = parse_number(week)
  )

billboard_pivot_long |> 
  ggplot(mapping = aes(x = week, y = rank, group = track)) + 
  geom_line(alpha = 0.25)+
  scale_y_reverse()


#----------- How pivot works
df <- tribble(
  ~id,  ~bp1, ~bp2,
  "A",  100,  120,
  "B",  140,  115,
  "C",  120,  125
)

df

df_plot <- df |> pivot_longer(
  cols = starts_with("bp"), 
  names_to = "measurement", 
  values_to = "value", 
  values_drop_na = T
  )

df_plot |> ggplot(mapping = aes(x = measurement, y = value)) +
  geom_bar()


# 5.3.3 Many variables in column names

who2 |>
  pivot_longer(
    cols = !(country:year),
    names_to = c("diagnosis","gender", "age"),
    names_sep = "_",
    values_to = "count"
  )

# pivot data, calculate the aggregate number of cases grouped by diagnosis and gender 
# and arrange(sort/order by) data by gender

who_cases <- who2 |> 
  pivot_longer(
    cols = !c(country:year),
    names_to = c("diagnosis", "gender", "age"),
    names_sep = "_", 
    values_to = "count",
    values_drop_na = T
  ) |> mutate(
    age = parse_number(age)
  )|> group_by(diagnosis, gender)|> summarize(n = n()) |> arrange(desc(gender))

who_cases

View(who_cases)

# 5.3.4 Data and variable names in the column headers

household |>
  pivot_longer(
    cols = !family, 
    names_to = c(".value","child"),
    names_sep = "_",
    values_drop_na = T
  )


#example 

who2 |>
  pivot_longer(
    cols = !c(country: year),
    names_to = c("diagnosis", "gender", ".value"),
    names_sep = "_",
    values_drop_na = T
  )

who2 |>
  pivot_longer(
    cols = !c(country, year),
    names_to = c("diagnosis",".value", "age"),
    names_sep = "_",
    values_drop_na = T
    )


#example 2 
tbl <- tribble(
  ~id, ~x_1, ~x_2, ~y_1, ~y_2, 
  "A",    1,    2,    3,    4,
  "B",    5,    6,    7,    8
  )

##

tbl |> 
  pivot_longer(
    cols = !id, 
    names_to = c(".value", "num"),
    names_sep = "_",
    values_drop_na = T
  ) |> select(id, x, y, num)

##

tbl |> 
  pivot_longer(
    cols = !id,
    names_to = c("type", ".value"),
    names_sep = "_",
    values_drop_na = T
  )


# pivot_wider()

cms_patient_experience |>
  distinct(measure_cd, measure_title)


# pivot wider
cms_patient_experience |>
  pivot_wider(
    names_from = measure_cd, 
    values_from = prf_rate
    )

# 

cms_patient_experience |>
  pivot_wider(
    id_cols = starts_with("org"),
    names_from = measure_cd, 
    values_from = prf_rate
  )

# sample data 

df <- tribble(
  ~id, ~measurement, ~value,
  "A",        "bp1",    100,
  "B",        "bp1",    140,
  "B",        "bp2",    115, 
  "A",        "bp2",    120,
  "A",        "bp3",    105
)


#
df |> 
  pivot_wider(
    id_cols = id, 
    names_from = measurement, 
    values_from = value
  )


#example 2 

df <- tribble(
  ~id, ~measurement, ~value,
  "A",        "bp1",    100,
  "A",        "bp1",    102,
  "A",        "bp2",    120,
  "B",        "bp1",    140, 
  "B",        "bp2",    115
)

df |> group_by(id, measurement) |> summarise(n = n(), .groups = "drop") |> filter(n > 1)


usethis::use_blank_slate()

# https://r4ds.hadley.nz/data-import
# 7 - Data Import 


# create a csv file 
sample <- "Student ID,Full Name,favourite.food,mealPlan,AGE
1,Sunil Huffmann,Strawberry yoghurt,Lunch only,4
2,Barclay Lynn,French fries,Lunch only,5
3,Jayendra Lyne,N/A,Breakfast and lunch,7
4,Leon Rossini,Anchovies,Lunch only,
5,Chidiegwu Dunkel,Pizza,Breakfast and lunch,five
6,Güvenç Attila,Ice cream,Lunch only,6"


# Check if the file exists
file.exists("data/sample.csv")

# Create the file 

file.create("data/sample.csv")

# write data to file
writeLines(sample, "data/sample.csv")
# OR 
write_lines(sample, "data/sample.csv")

# read csv file

read.csv("data/sample.csv")

# Access csv data from the web 

students <- read_csv("https://pos.it/r4ds-students-csv")
file.create("data/students.csv")
file.remove("data/students.csv")

write.csv(students, "data/students.csv") 
# This will include the row numbers by default

write_csv(students, "data/students_csv.csv")
# This doesn't include the row number by default

write.csv(students, "data/students.csv", row.names = F)
# setting row.names to F will simply remove the row numbers from the csv export

read.csv("data/students.csv")

# write.csv by default you cannot remove the header row, to do that you will need write.table

write.table(students, "data/students_no_header.csv",
            sep = ",",
            row.names = F, 
            col.names = F,
            )

# replaces NA strings with NA 
read.csv(file = "data/students_no_header.csv", na = "NA")
#
read.csv("data/students_no_header.csv", col.names = c("ID","Names","Fav_food","meal_Plan","age"))

read_csv("data/students_no_header.csv", col_names = F)

read_csv("data/students_no_header.csv", col_names = c("id","names", "fav_food", "meal_plan","age"))

read_delim(file = "data/students_no_header.csv",delim = ",")

# Read csv and ignore "" and "N/A"

students <- read_csv("data/Student.csv", na = c("N/A",""))

# to replace variable names separated by anything other than an _ either rename with and _

students |> rename(
  student_id  = `Student ID`, 
  full_name = `Full Name`
)

# clean variable names using the janitor::clean_names() from Janitor package
students |> janitor::clean_names()

# Convert meal plan variable from character to factor

students |> 
  janitor::clean_names() |> 
  mutate(
    meal_plan = factor(meal_plan)
    )

# change the age value five to 5

students <- students |> 
  janitor::clean_names() |>
  mutate(
    meal_plan = factor(meal_plan),
    age = parse_number(if_else(age == "five", "5", age))
  )


#7.2.2 Other arguments


read_csv(
  "a,b,c
  1,2,3
  4,5,6"
)

# if you want to skip the first row in the csv file then you can use skip = 2 option #

read_csv(
  "The first line of metadata 
  The second line of metadata 
  x,y,z
  1,2,3",
  skip = 2
  )

# if you want to skip lines that starts with # use comment = "#"
read_csv(
  "# The first line of metadata 
  The second line of metadata 
  x,y,z
  1,2,3",
  comment = "#"
)

# if a csv file has no header line you can use col_names = F to auto generate column names as x1,x2,..xn
read_csv(
  "1,2,3
  4,5,6",
  col_names = F
)

# alternatively you can also use col_names = c("x","y","z") to manually provide colnames 

read_csv(
  "1,2,3
  4,5,6",
  col_names = c("x","y","z")
  
)

# 7.2.3 Other file types
# Once you’ve mastered read_csv(), using readr’s other functions is straightforward; 
# it’s just a matter of knowing which function to reach for:
#   
# read_csv2() reads semicolon-separated files. These use ; 
# instead of , to separate fields and are common in countries that use , as the decimal marker.
# 
# read_tsv() reads tab-delimited files.
# 
# read_delim() reads in files with any delimiter, 
# attempting to automatically guess the delimiter if you don’t specify it.
# 
# read_fwf() reads fixed-width files. 
# You can specify fields by their widths with fwf_widths() or by their positions with fwf_positions().
# 
# read_table() reads a common variation of fixed-width files where columns are separated by white space.

# read_log() reads Apache-style log files.


library(tidyverse)

ggplot(diamonds, aes(x = carat, y = price)) + 
  geom_hex()
ggsave("diamonds.png")

write_csv(diamonds, "data/diamonds.csv")


# When reading csv files it pull 1000^2 rows ignoring the missing values
# then it runs through the collowing questions to determine the variable type for each columns 
# Does it contain only F, T, FALSE, or TRUE (ignoring case)? If so, it’s a logical.
# Does it contain only numbers (e.g., 1, -4.5, 5e6, Inf)? If so, it’s a number.
# Does it match the ISO8601 standard? If so, it’s a date or date-time. 
# (We’ll return to date-times in more detail in Section 17.2).
# Otherwise, it must be a string.

# Immagine a column that has numbers and one of the values is a . ; 
# the entire column is now presented as a String/ char

simple_csv <- "
  x
  10
  .
  20
  30"

read_csv(simple_csv)

# The variable type is a char because of the missing value

df <- read_csv(
  simple_csv, 
  col_types = list(x = col_double())
)

# Now read_csv() reports that there was a problem, 
# and tells us we can find out more with problems():

problems(df)

# this gives us the list of rows and the problems with 
#the type casue by the data entered. 

# To resolve the issue we use the following 

read_csv(simple_csv, na = ".")

# This will replace the . with NA while reading the csv file. 


#  https://r4ds.hadley.nz/data-import#sec-readr-directory
# 7.4 Reading data from multiple files

sales_files <- c(
  "https://pos.it/r4ds-01-sales",
  "https://pos.it/r4ds-02-sales",
  "https://pos.it/r4ds-03-sales"
)
read_csv(sales_files, id = "file")

# Visualize 
# https://r4ds.hadley.nz/layers

# 9  Layers

mpg |> ggplot(mapping = aes(x = displ, y = hwy, colour = class)) + 
  geom_point()
mpg |> ggplot(mapping = aes(x = displ, y = hwy, shape = class)) + 
  geom_point()
mpg |> ggplot(mapping = aes(x = displ, y = hwy, size = class)) + 
  geom_point()
mpg |> ggplot(mapping = aes(x = displ, y = hwy, alpha = class)) + 
  geom_point()

mpg |> ggplot(mapping = aes(x = displ, y = hwy)) + 
  geom_point(color = "blue")

mpg |> ggplot(mapping = aes(x = displ, y = hwy)) + 
  geom_point()

mpg |> ggplot(mapping = aes(x = displ, y = hwy)) + 
  geom_smooth()

mpg |> ggplot(mapping = aes(x = displ, y = hwy, shape = drv)) + 
  geom_smooth()

mpg |> ggplot(mapping = aes(x = displ, y = hwy, linetype = drv))+ 
  geom_smooth()

mpg |> ggplot(mapping = aes(x = displ, y = hwy, color = drv)) + 
  geom_line() + 
  geom_smooth(mapping = aes(linetype = drv))

mpg |> ggplot(mapping = aes(x = displ, y = hwy, color = drv)) + 
  geom_point() + 
  geom_smooth(mapping = aes(linetype = drv))

mpg |> ggplot(mapping = aes(x = displ, y = hwy)) + 
  geom_smooth()

mpg |> ggplot(mapping = aes(x = displ, y = hwy)) + 
  geom_smooth(aes(group = drv))

mpg |> ggplot(mapping = aes(x = displ, y = hwy)) + 
  geom_smooth(aes(color = drv), show.legend =  F)

mpg |> ggplot(mapping = aes(x = displ, y = hwy)) + 
  geom_point(aes(color = class)) + geom_smooth()

ggplot(mpg, aes(x = displ, y = hwy))+
  geom_point()+
  geom_point(
    data = mpg |> filter(class == "2seater"),
    color = "red"
  )+
  geom_point(
    data = mpg |> filter(class == "2seater"), 
    shape = "circle open", size = 3, color = "red"
  )


# Histogram

mpg |> ggplot(aes(x = hwy))+ geom_histogram(binwidth = 2)

# Desnsity Graph 

mpg |> ggplot(aes(x = hwy))+ geom_density()

# boxplot 

mpg |> ggplot(aes(x = hwy)) + geom_boxplot()


# Sampling - https://exts.ggplot2.tidyverse.org/gallery/ 

install.packages("ggridges")
library(ggridges)
ggplot(mpg, aes(x = hwy, y = drv, fill = drv, color = drv))+
  geom_density_ridges(alpha = 0.5, show.legend = F)


mpg |> ggplot(mapping = aes(x = displ, y = hwy, colour =  class))+
  geom_point() + 
  geom_smooth(se = F)


###
mpg |> ggplot(aes(x = displ, y = hwy))+
  geom_point()+
  geom_smooth(se = F)

mpg |> ggplot(mapping = aes(x = displ, y = hwy)) + 
  geom_point() + 
  geom_smooth(aes(line = drv), se = F)


mpg |> ggplot(mapping = aes(x = displ, y = hwy)) + 
  geom_point(aes(color = drv)) + 
  geom_smooth(se = F)

mpg |> ggplot(mapping = aes(x = displ, y = hwy, linetype = drv)) + 
  geom_point(aes(color = drv)) + 
  geom_smooth(se = F)

mpg |> ggplot(mapping = aes(x = displ, y = hwy, linetype = drv)) + 
  geom_point(aes(color = drv))

# 9.4 Facets

mpg |> ggplot(mapping = aes(x = displ, y = hwy)) + 
  geom_point() + facet_wrap(~cyl)

mpg |> ggplot(mapping = aes(x = displ, y = hwy)) + 
  geom_point() + facet_grid(drv~cyl)

# scale allows each plot to have it's own scale 
# This can be either "free_x", "free_y" and "free"
mpg |> ggplot(mapping = aes(x = displ, y = hwy))+ 
  geom_point()+ facet_grid(drv~cyl, scales = "free")


#  9.4.1 Exercises

mpg |> ggplot()+ geom_point(aes(x = drv, y = cyl))

ggplot(mpg) + 
  geom_point(aes(x = displ, y = hwy)) +
  facet_grid(drv ~ .)

ggplot(mpg) + 
  geom_point(aes(x = displ, y = hwy)) +
  facet_grid(. ~ cyl)

ggplot(mpg) + 
  geom_point(aes(x = displ, y = hwy)) + 
  facet_wrap(~ cyl, nrow = 2)

ggplot(mpg, aes(x = displ)) + 
  geom_histogram() + 
  facet_grid(drv ~ .)

ggplot(mpg, aes(x = displ)) + 
  geom_histogram() +
  facet_grid(. ~ drv)

ggplot(mpg) + 
  geom_point(aes(x = displ, y = hwy)) +
  facet_grid(drv ~ .)



# 9.5 Statistical transformations

diamonds |> ggplot(aes(x = cut))+
  geom_bar()

# geom_bar displays a bar chart with the y-axis showing the number of occurrences
# by default geom_bar() uses count as the default stat(statistical transformation)
# You can change the default stat to "identity" which allows to map high of the bars to the raw variable of y.

# override the default stat
diamonds|> 
  count(cut)|>
  ggplot(aes(x = cut, y = n))+
  geom_bar(stat = "identity")

# override the default mapping
# display bar chart of proportions instead of count

# Computed variables
# These are calculated by the 'stat' part of layers and can be accessed with delayed evaluation.
# 
# after_stat(count)
# number of points in bin.
# 
# after_stat(prop)
# groupwise proportion

diamonds |> 
  ggplot(aes(x= cut, y = after_stat(prop),group = 1))+
  geom_bar()

diamonds |> 
  ggplot(aes(x= cut, y = after_stat(prop)))+
  geom_bar()


diamonds |> 
  ggplot(aes(x= cut, y = after_stat(count),group = 1))+
  geom_bar()


# stat_summary()

ggplot(diamonds) + 
  stat_summary(
    aes(x = cut, y = depth),
    fun.min = min,
    fun.max = max,
    fun = median
  )



# this doesn't divide the graphs by fill
ggplot(diamonds, aes(x = cut, y = after_stat(prop))) + 
  geom_bar()

# This separetes the graph by color using fill

ggplot(diamonds, aes(x = cut, fill = color, y = after_stat(prop))) + 
  geom_bar()


# 9.6 Position adjustments


ggplot(mpg, aes(x = drv, color = drv))+ geom_bar()

ggplot(mpg, aes(x = drv, fill = drv))+ geom_bar()

ggplot(mpg, aes(x = drv, fill = class))+ geom_bar()


#stacked data 
# The stacking is performed automatically using the position 
# adjustment specified by the position argument.
# If you don’t want a stacked bar chart, you can use one of
# three other options: "identity", "dodge" or "fill"

#position = "identity" will place each object exactly where it falls
#in the context of the graph. This is not very useful for bars, 
#because it overlaps them. 
#To see that overlapping we either need to make the bars slightly 
#transparent by setting alpha to a small value, or completely 
#transparent by setting fill = NA."

# overlapping graph
mpg |> ggplot(aes(x = drv, fill = class)) +
  geom_bar(alpha = 1/5, position = "identity")

ggplot(mpg, aes(x = drv, color = class))+
  geom_bar(fill = NA, position = "identity")

# 
# The identity position adjustment is more useful for 2d geoms, like points, where it is the default.
# 
# position = "fill" works like stacking, but makes each set of stacked bars the same height. 
# This makes it easier to compare proportions across groups.
# 
# position = "dodge" places overlapping objects directly beside one another. 
# This makes it easier to compare individual values.


ggplot(mpg, aes(x = drv,fill = class))+
  geom_bar(position = "identity")

ggplot(mpg, aes(x = drv, color = class))+
  geom_bar(alpha = 0.5, position = "identity")

# Shows the value a proportion
ggplot(mpg, aes(x = drv, fill = class))+
  geom_bar(position = "fill")

# Shows individual values for comparison
ggplot(mpg ,aes(x = drv, fill = class))+
  geom_bar(position = "dodge")

# position = "jitter" used in scatter plot that adds noise and avoids gridding 

ggplot(mpg, aes(x = displ, y = hwy))+ 
  geom_point()

ggplot(mpg, aes(x = displ, y = hwy))+
  geom_point(position = "jitter")

ggplot(mpg, aes(x = displ, y = hwy))+ 
  geom_jitter()

# 9.6.1 Exercises

ggplot(mpg, aes(x = cty, y = hwy)) + 
  geom_point()

ggplot(mpg, aes(x = cty, y = hwy)) + 
  geom_col()


ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point()
ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point(position = "identity")

#
ggplot(mpg, aes(cyl, hwy)) +
  geom_jitter()

ggplot(mpg, aes(cyl, hwy)) +
  geom_jitter(width = 0.25)

ggplot(mpg, aes(cyl, hwy)) +
  geom_jitter(height = 0.25)

#

ggplot(mpg, aes(cyl, hwy))+
  geom_jitter();

ggplot(mpg, aes(cyl, hwy))+
  geom_count()

# 9.7 Coordinate systems

nz <- map_data("nz")

ggplot(nz, aes(x = long, y = lat, group = group))+
  geom_polygon(fill = "white", color ="black")


ggplot(nz, aes(x = long, y = lat, group = group))+
  geom_polygon(fill = "white", color = "black")+
  coord_quickmap()

# coord_polar()

bar <- ggplot(data = diamonds)+ 
  geom_bar(
    mapping = aes(x = clarity, fill = clarity),
    show.legend = F, width = 1
  )+theme(aspect.ratio = 1)

bar+coord_flip()
bar+coord_polar()


ggplot(diamonds)+
  geom_bar(aes(x = cut, fill = clarity),width = 1)+coord_polar()




ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) +
  geom_point() + 
  geom_abline() +
  coord_fixed()

# Chapter 10 - https://r4ds.hadley.nz/eda#variation

# 10.3 Variation

ggplot(diamonds, aes(x = carat))+ geom_histogram(binwidth = 0.5)

# 10.3.1 Typical values

# diamonds less than 3 carats 
smaller<- diamonds |> filter(carat<3)

ggplot(smaller, aes(x = carat))+ geom_histogram(binwidth = 0.01)

ggplot(data = diamonds, aes(x = y))+
  geom_histogram(binwidth = 0.5)

# Sometimes values are not qite visible on the chart.
# We can resolve this by zooming into the values on the y-axis 

diamonds |> ggplot(aes(x = y))+ 
  geom_histogram(binwidth = 0.5)+
  coord_cartesian(ylim = c(0,50))

# diamonds |> ggplot(aes(x = y))+
#   geom_histogram(binwidth = 0.5)+
#   coord_cartesian(xlim = c(50,0))

unusual <- diamonds |> 
  filter (y <3 | y > 20)|>
  select(price, x, y , z) |>
  arrange(y)

ggplot(mpg, aes(x = fct_reorder(class, hwy, median), y = hwy)) +
  geom_boxplot()

# 10.3.3 Exercises
# Explore the distribution of each of the x, y, and z variables in diamonds. What do you learn? Think about a diamond and how you might decide which dimension is the length, width, and depth.
#
summary(select(diamonds, x, y, z))
summary |> select(x,y,z) |> summary()

filter(diamonds, x==0 | y==0 |z==0)
diamonds |> filter(x==0 | y==0, z==0)

diamonds %>%  arrange(desc(y)) %>% head()
diamonds %>%  arrange(desc(z)) %>% head()

filter(diamonds, x>0, x<10) %>% 
  ggplot()+
  geom_histogram(mapping = aes(x = x), binwidth = 0.01)+
  scale_x_continuous(breaks = 1:10)

filter(diamonds, y >0, y <10) %>% 
  ggplot()+
  geom_histogram(mapping = aes(x = y), binwidth = 0.01)+
  scale_x_continuous(breaks = 1:10)

summarise(diamonds, mean(x>y),mean(x>z), mean(y>z))

# Explore the distribution of price. Do you discover anything unusual or surprising? (Hint: Carefully think about the binwidth and make sure you try a wide range of values.)
# 
ggplot(filter(diamonds, price < 2500), aes(x = price))+
  geom_histogram(binwidth = 10, center = 0)

ggplot(filter(diamonds), aes(x = price))+ geom_histogram(binwidth = 100, center = 0)

# How many diamonds are 0.99 carat? How many are 1 carat? What do you think is the cause of the difference?
#
diamonds %>% 
  filter(carat >=0.99, carat <=1) %>% 
  count(carat)

diamonds %>% 
  filter(carat >=0.9, carat <= 1.1) %>% 
  count(carat) %>% 
  print(n = Inf)

#   Compare and contrast coord_cartesian() vs. xlim() or ylim() when zooming in on a histogram. What happens if you leave binwidth unset? What happens if you try and zoom so only half a bar shows?

ggplot(diamonds)+
  geom_histogram(mapping = aes(x = price))+
  coord_cartesian(xlim =c(100,5000), ylim = c(0,3000))

ggplot(diamonds)+ geom_histogram(mapping =  aes(x= price))+
  xlim(100,5000)+
  ylim(0,3000)

# 10.4 Unusual values
# There are 2 ways to handle unsusal data
# 1. drop rows that have strange values

diamonds2 <- diamonds |>
  filter(between(y, 3, 20))

# 2.Replace the unusual rows with missing values

diamonds3 <- diamonds %>% 
  mutate(y = if_else(y <3 | y >20, NA, y))

diamonds3 |> ggplot(aes(x = y , y = y ))+geom_point()

diamonds3 |> ggplot(aes(x = y , y = y ))+geom_point(na.rm = T)


library("nycflights13")
flights

flights %>% 
  mutate(
    cancelled = is.na(dep_time),
    sched_hour = sched_dep_time %/% 100, 
    sched_min = sched_dep_time %% 100, 
    sched_dep_time = sched_hour + (sched_min/60)
  ) |> relocate(c(cancelled, sched_hour, sched_min, sched_dep_time), 1)


# 10.5 Covariation https://r4ds.hadley.nz/eda#covariation

# 10.5.1 A categorical and a numerical variable

ggplot(diamonds, aes(x = price)) + 
  geom_freqpoly(aes(color = cut), binwidth = 500, linewidth = 0.75)


ggplot(diamonds, aes(x = price, y = after_stat(density))) + 
  geom_freqpoly(aes(color = cut), binwidth = 500, linewidth = 0.75)

ggplot(diamonds, aes(x = cut, y = price)) +
  geom_boxplot()


ggplot(mpg, aes(x = class, y = hwy)) +
  geom_boxplot()


ggplot(mpg, aes(x = fct_reorder(class, hwy, median), y = hwy)) +
  geom_boxplot()

ggplot(mpg, aes(x = hwy, y = fct_reorder(class, hwy, median))) +
  geom_boxplot()


# 10.5.2 Two categorical variables https://r4ds.hadley.nz/eda#two-categorical-variables

ggplot(diamonds, aes(x = cut, y = color)) +
  geom_count()


diamonds |> 
  count(color, cut)


diamonds |> 
  count(color, cut) |>  
  ggplot(aes(x = color, y = cut)) +
  geom_tile(aes(fill = n))


# 10.5.3 Two numerical variables https://r4ds.hadley.nz/eda#two-numerical-variables


ggplot(smaller, aes(x = carat, y = price)) +
  geom_point()


ggplot(smaller, aes(x = carat, y = price)) +
  geom_bin2d()

# install.packages("hexbin")
ggplot(smaller, aes(x = carat, y = price)) +
  geom_hex()


ggplot(smaller, aes(x = carat, y = price)) + 
  geom_boxplot(aes(group = cut_width(carat, 0.1)))



# 11  Communication https://r4ds.hadley.nz/communication#introduction

# 11.2 Labels https://r4ds.hadley.nz/communication#labels

ggplot(mpg, aes(x = displ, y = hwy))+
  geom_point(aes(color = class))+
  geom_smooth(se = F)+
  labs(
    x = "Engine Displacemet(L)", 
    y = "Highway fuel economy (mpg)", 
    color = "Car Type", 
    title = "Fuel Efficincy generally decreases with engine size",
    subtitle = "Two seater (sports car) are an exception becasue of their light weight",
    caption = "Data from fueleconomy.gov"
  )

# replace x and y axis with formula using quote()

df <- tibble(
  x = 1:10, 
  y = cumsum(x^2)
)


ggplot(df, aes(x, y))+
  geom_point()+
  labs(
    x = quote(x[i]),
    y = quote(sum(x[i]^2, i ==1, n))
  )


# Annotations - https://r4ds.hadley.nz/communication#annotations

label_info <- mpg |>
  group_by(drv) |>
  arrange(desc(displ))|>
  slice_head(n = 1)|>
  mutate(
    drive_type = case_when(
      drv == "f" ~ "front-wheel drive",
      drv == "r" ~ "rear-wheel drive",
      drv == "4" ~ "4-wheel drive"
    )
  )|>
  select(displ, hwy, drv, drive_type)
#
label_info
#
ggplot(mpg, aes(x = displ, y = hwy, color = drv))+
  geom_point(alpha = 0.3)+
  geom_smooth(se = F)+
  geom_text(
    data = label_info, 
    aes(x = displ, y = hwy, label = drive_type),
    frontface = "bold", size = 5, hjust = "right", vjust = "bottom"
  )+
  theme(legend.position = "none")

#
install.packages("ggrepl")
library(ggrepel)

ggplot(mpg, aes(x = displ, y = hwy, color = drv))+
  geom_point(alpha = 0.3)+
  geom_smooth(se = F)+
  geom_label_repel(
    data = label_info, 
    aes(x = displ, y = hwy, label = drive_type),
    frontface = "bold", size = 5, nudge_y = 2
  )+
  theme(legend.position = "none")


#

potential_outliners <- mpg |> 
  filter(hwy >40 | (hwy>20 & displ >5))

#
potential_outliners
#
ggplot(mpg, aes(x = displ, y = hwy))+
  geom_point()+
  geom_text_repel(data = potential_outliners, aes(label = model))+
  geom_point(data = potential_outliners, color = "red")+
  geom_point(
    data = potential_outliners,
    color = "red", size = 3, shape = "circle open"
  )

#
trend_text <- "Larger engine sizes tend to have lower fuel economy." |>
  str_wrap(width = 30)

#
trend_text
#

ggplot(mpg, aes(x = displ, y = hwy))+
  geom_point()+
  annotate(
    geom = "label", x = 3.5, y = 38, 
    label = trend_text, 
    hjust = "left", color = "red"
  )+
  annotate(
    geom = "segment",
    x = 3, y = 35, xend = 5, yend = 25, color = "red", 
    arrow = arrow(type= "closed")
    
  )
  

# Scales - https://r4ds.hadley.nz/communication#scales


ggplot(mpg, aes(x = displ, y = hwy))+
  geom_point(aes(color = class))


ggplot(mpg, aes(x = displ, y = hwy))+
  geom_point(aes(color = class))+
  scale_x_continuous()+
  scale_y_continuous()+
  scale_color_discrete()

# 11.4.2 Axis ticks and legend keys - https://r4ds.hadley.nz/communication#axis-ticks-and-legend-keys


ggplot(mpg, aes(x = displ, y = hwy, color = drv))+
  geom_point()+
  scale_y_continuous(breaks = seq(15, 40, by = 5))

#

ggplot(mpg, aes(x = displ, y = hwy, color = drv)) +
  geom_point() +
  scale_x_continuous(labels = NULL) +
  scale_y_continuous(labels = NULL) +
  scale_color_discrete(labels = c("4" = "4-wheel", "f" = "front", "r" = "rear"))


#
install.packages("scales")
library(scales)

ggplot(data = diamonds, mapping = aes(x = price, y = cut))+
  geom_boxplot(alpha = 0.5)+
  scale_x_continuous(labels = label_dollar())

ggplot(data = diamonds, mapping = aes(x = price, y = cut))+
  geom_boxplot(alpha = 0.5)+
  scale_x_continuous(
    labels = label_dollar(scale = 1/1000, suffix = "K"),
    breaks = seq(1000, 19000, by = 6000)
  )

# https://r4ds.hadley.nz/communication.html#replacing-a-scale

ggplot(diamonds, aes(x = carat, y = price))+
  geom_bin2d();


ggplot(diamonds, aes(x=log10(carat),y = log10(price)))+
  geom_bin2d()

ggplot(diamonds, aes(x = carat, y = price))+
  geom_bin2d()+
  scale_x_log10()+
  scale_y_log10()


ggplot(mpg, aes(x = displ, y = hwy))+
  geom_point(aes(color= drv))

ggplot(data = mpg, mapping = aes(x = displ, y = hwy))+
  geom_point(aes(color = drv))+
  scale_color_brewer(palette = "Set1")



presidential |>
  mutate(id = 33 + row_number())|>
  ggplot(aes(x = start, y = id, color = party))+
  geom_point()+
  geom_segment(aes(xend = end, yend = id))+
  scale_color_manual(values = c(Republican = "#E81B23", Democratic = "#00AEF3"))


df <- tibble(
  x = rnorm(10000),
  y = rnorm(10000)
)


ggplot(df, aes(x, y))+
  geom_hex()+
  coord_fixed()+
  labs(title = "Default Continuous", x = NULL, y = NULL)

ggplot(df, aes(x, y))+
  geom_hex()+
  coord_fixed()+
  scale_fill_viridis_c()+
  labs(title = "Virdis, Continuous", NULL, NULL)
  
ggplot(df, aes(x, y))+
  geom_hex()+
  coord_fixed()+
  scale_fill_viridis_b()+
  labs(title = "Virdis, binned", NULL, NULL)


# Zooming - https://r4ds.hadley.nz/communication.html#zooming


ggplot(mpg, aes(x = displ, y = hwy))+
  geom_point(aes(color = drv))+
  geom_smooth()


mpg |> 
  filter(displ >= 5 & displ <= 6 & hwy >= 10 & hwy <=25) |>
  ggplot(aes(x = displ, y = hwy))+
  geom_point(aes(color = drv))+
  geom_smooth()


ggplot(mpg, aes(x = displ, y = hwy))+
  geom_point(aes(color = drv))+
  geom_smooth()+
  scale_x_continuous(limits = c(5,6))+
  scale_y_continuous(limits = c(10, 25))


ggplot(mpg, aes(x = displ, y = hwy))+
  geom_point(aes(color = drv))+
  geom_smooth()+
  coord_cartesian(xlim = c(5,6),ylim = c(10,25))


suv <- mpg %>%  filter(class== "suv")
compact <- mpg %>%  filter(class == "compact")

ggplot(suv, aes(x = displ, y = hwy, color = drv))+
  geom_point()

ggplot(compact, aes(x = displ, y = hwy, color = drv))+
  geom_point()


 x_scale<- scale_x_continuous(limits = range(mpg$displ))
 y_scale<- scale_y_continuous(limits = range(mpg$hwy))
 col_scale<- scale_color_discrete(limit = unique(mpg$drv))

 #left
 
 ggplot(suv, aes(x = displ, y = hwy, color = drv))+
   geom_point()+
   x_scale + y_scale + col_scale

 
 #right
 
 ggplot(compact, aes(x = displ, y = hwy, color = drv))+
   geom_point()+
   x_scale+ y_scale+ col_scale

 
 # 11.4.6 Exercise - https://r4ds.hadley.nz/communication.html#exercises-2
 
 df <- tibble(
   x = rnorm(10000), 
   y = rnorm(10000)
 )
 
 ggplot(df, aes(x, y))+
   geom_hex()+
   scale_color_gradient(low = "white", high = "red")+ 
   coord_fixed()
   
 
 # Themes - https://r4ds.hadley.nz/communication.html#sec-themes
 
ggplot(mpg, aes(x=displ, y = hwy))+
 geom_point(aes(colour = class))+
 geom_smooth(se = F)+ 
 theme_bw()
 

ggplot(mpg, aes(x=displ, y = hwy))+
  geom_point(aes(colour = class))+
  geom_smooth(se = F)+ 
  theme_dark() 

ggplot(mpg, aes(x=displ, y = hwy))+
  geom_point(aes(colour = class))+
  geom_smooth(se = F)+ 
  theme_classic() 
 
ggplot(mpg, aes(x=displ, y = hwy))+
  geom_point(aes(colour = class))+
  geom_smooth(se = F)+ 
  theme_light()


ggplot(mpg, aes(x=displ, y = hwy))+
  geom_point(aes(colour = class))+
  geom_smooth(se = F)+ 
  theme_minimal()

ggplot(mpg, aes(x=displ, y = hwy))+
  geom_point(aes(colour = class))+
  geom_smooth(se = F)+ 
  theme_grey()

ggplot(mpg, aes(x=displ, y = hwy))+
  geom_point(aes(colour = class))+
  geom_smooth(se = F)+ 
  theme_void()


ggplot(mpg, aes(x = displ, y = hwy, color = drv))+
  geom_point()+
  labs(
    title = "Large engine sizes tend to have lower fuel economy",
    caption = "Souce: https//fueleconoy.gov"
  )+
  theme(
    legend.position = c(0.6 , 0.7),
    legend.direction = "horizontal",
    legend.box.background = element_rect(color = "black"),
    plot.title = element_text(face = "bold"),
    plot.title.position = "plot", 
    plot.caption.position = "plot",
    plot.caption = element_text(hjust = 0)
  )


# Layout https://r4ds.hadley.nz/communication.html#layout

p1 <- ggplot(mpg, aes(x = displ, y = hwy)) + 
  geom_point() + 
  labs(title = "Plot 1")
p2 <- ggplot(mpg, aes(x = drv, y = hwy)) + 
  geom_boxplot() + 
  labs(title = "Plot 2")

library(patchwork)

p1 + p2

p3 <- ggplot(mpg, aes(x = cty, y = hwy)) + 
  geom_point() + 
  labs(title = "Plot 3")
(p1 | p3) / p2

##

p1 <- ggplot(mpg, aes(x = drv, y = cty, color = drv)) + 
  geom_boxplot(show.legend = FALSE) + 
  labs(title = "Plot 1")

p2 <- ggplot(mpg, aes(x = drv, y = hwy, color = drv)) + 
  geom_boxplot(show.legend = FALSE) + 
  labs(title = "Plot 2")

p3 <- ggplot(mpg, aes(x = cty, color = drv, fill = drv)) + 
  geom_density(alpha = 0.5) + 
  labs(title = "Plot 3")

p4 <- ggplot(mpg, aes(x = hwy, color = drv, fill = drv)) + 
  geom_density(alpha = 0.5) + 
  labs(title = "Plot 4")

p5 <- ggplot(mpg, aes(x = cty, y = hwy, color = drv)) + 
  geom_point(show.legend = FALSE) + 
  facet_wrap(~drv) +
  labs(title = "Plot 5")

(guide_area() /p5/ (p1 + p2) / (p3 + p4)) +
  plot_annotation(
    title = "City and highway mileage for cars with different drive trains",
    caption = "Source: https://fueleconomy.gov."
  ) +
  plot_layout(
    guides = "collect",
    heights = c(1,2,4,2)
  ) &
  theme(legend.position = "top")


# Chapter 12 - Logical vectors - 

x <- c(1, 2, 3, 5, 7, 11, 13)
x*2

df <- tibble(x)

df |> mutate(y = x*2)

library(nycflights13)

flights |>
  filter(dep_time > 600 & dep_time <2000 & abs(arr_delay)<20)

flights |> 
  mutate(
    daytime = dep_time > 600 & dep_time<2000,
    approx_ontime = abs(arr_delay)<20,
    .keep = "used"
    )

flights |> 
  mutate(
    daytime = dep_time > 600 & dep_time < 2000,
    approx_ontime = abs(arr_delay) < 20,
  ) |> 
  filter(daytime & approx_ontime)

# https://r4ds.hadley.nz/logicals.html#sec-fp-comparison

x <- c(1 / 49 * 49, sqrt(2) ^ 2)

x == c(1,2) # the vectors are not equal hence the result is FALSE FALSE

print(x, digits = 16)

near(x, c(1,2)) # as solution use near() whcich ignores the difference between the numbers caused during the calulation

# https://r4ds.hadley.nz/logicals.html#sec-na-comparison

# unknown values always yield NA for almost any operations. To determine if a variable is NA use is.na()

NA >5 

is.na(NA)

a <- NA 
b <- NA

a==b

# If you wants to retrieve data set where dep_time is NA
flights |> filter(dep_time == NA) # this will yield no value

flights |> filter(is.na(dep_time)) # this will yield data set 

flights |> filter(month == 1, day == 2) |> arrange(dep_time) |> select(dep_time)

# when arranging data set the NA is arrange is first. 
flights |> filter(month ==1, day == 2) |>
  arrange(desc(is.na(dep_time)), dep_time)

# https://r4ds.hadley.nz/logicals.html#sec-na-boolean

df <- tibble(x = c(T,F,NA))

df |> mutate(and = x & NA, or = x | NA)

tdf <- tibble(x = c(T,F,NA), y= c(NA,NA,NA))
tdf |> mutate(and = x & y, or = x | y)

# https://r4ds.hadley.nz/logicals.html#sec-order-operations-boolean

flights |> filter(month == 11 | month == 12)

flights |> mutate(nov = month ==11, final = nov | 12, .keep = "used")

# https://r4ds.hadley.nz/logicals.html#in
1:12 %in% c(2,5,8,3)

flights |>
  filter(month %in% c(11,12))


c(2,3,NA) == NA 
c(2,3, NA) %in% NA


flights |> filter(dep_time %in% c(NA, 0800))

# https://r4ds.hadley.nz/logicals.html#exercises-1

# Find all flights where arr_delay is missing but dep_delay is not. 
# Find all flights where neither arr_time nor sched_arr_time are missing, but arr_delay is.


flights |> filter(arr_delay %in% NA , !dep_delay %in% NA)
flights |> filter(is.na(arr_delay), !is.na(dep_delay))              
flights |> filter(!is.na(arr_delay), is.na(dep_delay))                  
flights |> filter(!arr_delay %in% NA, dep_delay %in% NA)                  


flights |> group_by(dep_time) |>
  filter(dep_time %in% NA ) |> select (dep_time , n = n())

# https://r4ds.hadley.nz/logicals.html#logical-summaries

# using all() -All values are true - all(c(T,F,T,T,T)) this returns False
# any() - atleast one value is true - any(c(T,F,T,T,T)) - this returns ture

flights |> 
  group_by(year, month, day) |>
  summarise(
    all_delayed = all(dep_delay <= 60, na.rm = T),
    any_long_delay = any(arr_delay >=300, na.rm = T),
    .groups = "drop"
  )

#https://r4ds.hadley.nz/logicals.html#sec-numeric-summaries-of-logicals

# True represents 1 and False represents 0 
# sum(c(T,F,T,T,T)) returns 4
# mean(c(T,F,T,T,T)) returns 0.8 (sum(T)/length of vector)

sum(c(T,F,T,T,T))

mean(c(T,F,T,T,T))

flights |>
  group_by(year, month, day)|>
  summarise(
    proportion_delay = mean(dep_delay<= 60, na.rm = T),
    count_long_delay = sum(arr_delay >= 300, na.rm = T),
    .groups = "drop"
    
  )

# https://r4ds.hadley.nz/logicals.html#logical-subsetting

# Imagine we wanted to look at the average delay 
# just for flights that were actually delayed. 
# One way to do so would be to first filter the 
# flights and then calculate the average delay:

flights |>
  filter(arr_delay > 0) |>
  group_by(year, month, day) |>
  summarise(
    behind  = mean(arr_delay),
    n = n(), 
    .groups = "drop"
  )

#inline filtering - vector[vector >= value]

v <- c(65,46,98,47,65,98,4,65,49,8,74)

v[v>65]

flights |>
  group_by(year, month, day) |>
  summarise(
    behind = mean(arr_delay[arr_delay > 0],na.rm = T),
    ahead = mean(arr_delay[arr_delay < 0], na.rm = T), 
    n = n(),
    .groups = "drop"
  )


# How many flights have a missing dep_time?
# What other variables are missing in these rows? What might these rows represent?

flights |>group_by()|>
  filter(dep_time %in% NA ) |>
  summarise(n())

summary(flights)


# What does prod() return when applied to a logical vector? 
# What logical summary function is it equivalent to? 
# What does min() return when applied to a logical vector? 
# What logical summary function is it equivalent to? 
# Read the documentation and perform a few experiments.

# When prod() is applied to a logical vector, it returns a numeric value: 
# 1 if all elements are TRUE, and 0 if any element is FALSE. 
# It's equivalent to the logical summary function all(). 
# min() applied to a logical vector returns FALSE if any element is FALSE, 
# and TRUE if all elements are TRUE, equivalent to any(). 

