install.packages("RCurl")
install.packages("XML")
install.packages("stringr")
install.packages("plyr")

#get Data from the web

url <- "http://www.geos.ed.ac.uk/~weather/jcmb_ws/"
links <- getHTMLLinks(url);