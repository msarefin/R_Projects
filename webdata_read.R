install.packages("RCurl")
install.packages("XML")
install.packages("stringr")
install.packages("plyr")
install.packages("rvest")

library(RCurl)
library(XML)
library(stringr)
library(plyr)
library(rvest)

url <- "http://www.geos.ed.ac.uk/~weather/jcmb_ws/"
link <- getHTMLLinks(url)