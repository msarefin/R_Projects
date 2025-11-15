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

ggplot(data = penguins, 
       mapping = aes(x=flipper_length_mm, y = body_mass_g, color = species)) + 
  geom_point()+
  geom_smooth()

ggplot(data = penguins, 
       mapping = aes(x = flipper_length_mm, y = body_mass_g, color = species))+
  geom_point()+
  geom_smooth(method = "lm")


ggplot(data = penguins,mapping = aes(x = flipper_length_mm, y = body_mass_g))+
  geom_point(mapping = aes(color = species))+
  geom_smooth(method = "lm")

ggplot(data = penguins, mapping = aes(x = flipper_length_mm, y = body_mass_g, shape = species))+
  geom_point(mapping = aes(color = species))+
  geom_smooth(method = "lm")


penguins |> ggplot(mapping = aes(x = flipper_length_mm, y = body_mass_g))+
  geom_point(mapping = aes(color = species, shape = species))+
  geom_smooth(method = "lm")

penguins |> ggplot()+
  geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g, color = species))+
  geom_smooth(mapping = aes(x = flipper_length_mm, y = body_mass_g, color = species), method = "lm")

penguins |> ggplot(mapping = aes(x = flipper_length_mm, y = body_mass_g))+
  geom_point(aes(color = species, shape = species))+
  geom_smooth(method = "lm")+
  scale_color_colorblind()+
  labs(
    title = "Palmer Penguins: Flipper length vs Body Mass", 
    subtitle = "Comparing three penguin species",
    x = "Flipper Length (mm)",y = "Body Mass (g)",
    color = "Species", shape = "Species"
  )
  