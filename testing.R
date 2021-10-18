# testing 

x <- 5

y <- 10

z <-15

w <- 20

#########

library(xml2)
library(rvest)
library(jsonlite)
library(robotstxt)
library(RSocrata)
library(tidyverse)
library(magrittr)

# scraping educated questions from cdc website
paths_allowed("https://www.cdc.gov/coronavirus/2019-ncov/vaccines/faq.html")
url <- read_html("https://www.cdc.gov/coronavirus/2019-ncov/vaccines/faq.html")  
nds <- html_nodes(url, xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "btn-link", " " ))]//span')
frqs <- html_text(nds)
frqs # scraped unnecessary contact info for cdc. Only need 1st 30 elements
frqs <- frqs[1:30]

# scraping myths from cdc website
myths <- read_html("https://www.cdc.gov/coronavirus/2019-ncov/vaccines/facts.html") %>%
  html_nodes(xpath = '//*[(@id = "accordion-2-card-4")]//span | //*[(@id = "accordion-2-card-3")]//span | //*[(@id = "accordion-2-card-2")]//span | //*[(@id = "accordion-2-card-1")]//span | //*[contains(concat( " ", @class, " " ), concat( " ", "h4", " " ))]//strong') %>% 
  html_text()
as.matrix(myths)