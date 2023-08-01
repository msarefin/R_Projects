install.packages("rvest")
library(rvest)
link <- "https://www.nytimes.com/"
NYT_page <- read_html(link)
NYT_page; 

#NYT_page %>% 
 # html_elements(xpath = "")

#NYT_page %>%
 # html_elements(css = "")

summaries_css <- NYT_page %>%
  html_elements(css = ".summary-class")

head(summaries_css)

summaries_xpath <- NYT_page %>%
  html_elements(xpath = "//*[contains(@class, 'summary-class')]")

head(summaries_xpath)



#################### From tutorials point - keeps failing on the given website


#install.packages("RCurl")
library(RCurl)

myfile <- getURL("https://www.geos.ed.ac.uk/~weather/jcmb_ws/JCMB_2006_Aug.csv")
mydata <- read.csv(textConnection(myfile),header = T)
head(mydata)

install.packages("XML")
install.packages("stringr")
install.packages("plyr")
library(XML)
library(stringr)
library(plyr)

url <- "http://www.geos.ed.ac.uk/~weather/jcmb_ws/"
links <- getHTMLLinks(url,externalOnly = TRUE)


