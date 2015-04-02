#server.R
#This code executes the app is launched.
library("XML")

feed <- xmlTreeParse(file = "http://www.inab.org/category/job-opportunities/feed/", isURL = TRUE)

feedItems <- xmlElementsByTagName(feed$doc$children$rss, name = "item", recursive = TRUE)

xmlChildren(feedItems[1]$channel.item)$title

for (item in feedItems) {
  print(xmlChildren(item)$title)
}

shinyServer(function(input, output) {
  #This code executes the user visits the site
  
})