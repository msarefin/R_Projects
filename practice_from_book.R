#https://r4ds.hadley.nz/

install.packages("tidyverse")
library(tidyverse)

library(palmerpenguins)
library(ggthemes)

palmerpenguins::penguins

glimpse(penguins)
View(penguins)


ggplot(data = penguins)
