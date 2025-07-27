# Chapter 1 - https://r4ds.hadley.nz/data-visualize.html

install.packages("tidyverse")
library(tidyverse)

library(palmerpenguins)
library(ggthemes)

penguins
glimpse(penguins)
?penguins
summary(penguins)


# 1.2.3 Creating ggplot - https://r4ds.hadley.nz/data-visualize.html#creating-a-ggplot

ggplot(data = penguins)

ggplot(data = penguins, 
       mapping = aes(x = flipper_length_mm, y = body_mass_g)
       )

ggplot(data = penguins, 
       mapping = aes(x = flipper_length_mm, y = body_mass_g)
       ) + 
  geom_point()


# 1.2.4 Adding aesthetics and layers - https://r4ds.hadley.nz/data-visualize.html#sec-adding-aesthetics-layers

ggplot(data = penguins, 
       mapping = aes(x=flipper_length_mm, y = body_mass_g, color = species)) + geom_point()
