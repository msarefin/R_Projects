install.packages("tidyverse")
install.packages("rvest")
library(tidyverse)
library(rvest)

url = "https://en.wikipedia.org/wiki/World_Happiness_Report"

happy = read_html(url)%>%
  html_element('tables.wikitable')%>%
  html_table()
