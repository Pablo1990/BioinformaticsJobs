#server.R
#This code executes the app is launched.
library("XML")

feed <- xmlTreeParse(file = "http://www.inab.org/category/job-opportunities/feed/", isURL = TRUE)

feedChildren2 <- xmlElementsByTagName(feed$doc$children$rss, name = "item", recursive = TRUE)

feedChildren2[2]

shinyServer(function(input, output) {
  #This code executes the user visits the site
  
})