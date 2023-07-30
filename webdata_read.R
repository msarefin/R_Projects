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



####################

install.packages("RCurl")
library(RCurl)

sample