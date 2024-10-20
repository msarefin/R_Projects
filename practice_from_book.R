#https://r4ds.hadley.nz/

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


