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
