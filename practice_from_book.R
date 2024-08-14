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

penguins |> ggplot(mapping = aes(x = flipper_length_mm, y= body_mass_g))+geom_point()

penguins |> ggplot(mapping = aes(x = flipper_length_mm, y = body_mass_g))+
  geom_point(mapping = aes(color = species, shape = species))+
  geom_smooth(method = "lm")

my_bar_plot <- ggplot(mpg, aes(x = class)) + geom_bar()
my_scatter_plot <- ggplot(mpg, aes(x= cty, y = hwy)) + geom_point()

ggsave(filename = "mpg_bar_chart.png", plot = my_bar_plot)

