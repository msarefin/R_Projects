#https://r4ds.hadley.nz/

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

ggplot(data = penguins, mapping = aes(x= flipper_length_mm, y = body_mass_g, color = species))+geom_point()+geom_smooth(method = "lm")

ggplot(data = penguins, mapping = aes(x= flipper_length_mm, y = body_mass_g))+geom_point(mapping = aes(color = species, shape = species))+geom_smooth(method = "lm")
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
# Find Distinct and keep all columns - distinct find the first occurence of the the data and discards the rest. 
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

# Sort flights to find the flights with the longest departure delays. Find the flights that left earliest in the morning.

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

# Control which columns from .data are retained in the output. Grouping columns and columns created by ... are always kept.
# "all" retains all columns from .data. This is the default.
# "used" retains only the columns used in ... to create new columns. This is useful for checking your work, as it displays inputs and outputs side-by-side.
# "unused" retains only the columns not used in ... to create new columns. This is useful if you generate new columns, but no longer need the columns used to generate them.
# "none" doesn't retain any extra columns from .data. Only the grouping variables and columns created by ... are kept.

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
  , .keep = "used"
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
# Sketch out the process you’d use to calculate the rate for table2 and table3. You will need to perform four operations:
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


# readr::parse_number(). parse_number() is a handy function that will extract the first number from a string, ignoring all other text.

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

# pivot data, calculate the aggrigate number of cases grouped by diagnosis and gender and arrange(sort/order by) data by gender

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



