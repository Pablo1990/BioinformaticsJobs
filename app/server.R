#server.R
#This code executes the app is launched.
library("XML")

feed <- xmlTreeParse(file = "http://www.inab.org/category/job-opportunities/feed/", isURL = TRUE)

feedItems <- xmlElementsByTagName(feed$doc$children$rss, name = "item", recursive = TRUE)

#xmlChildren(feedItems[1]$channel.item)

# for (item in feedItems) {
#   print(xmlChildren(item)$title)
# }

cont <- 0

aux <- 1

#aux <- as.integer(input$pageItem) + cont
#print(xmlChildren(feedItems[aux]$channel.item))
listItem <- xmlChildren(feedItems[aux]$channel.item)

shinyServer(function(input, output) {
  #This code executes the user visits the site
  
#   if(input$prevPage){
#     cont <- cont + 10
#   } else {
#     if(cont!=0)
#       cont <- cont - 10
#   }
  
   
  
  output$xmlTitle <- renderUI({
    aux <- as.integer(input$pageItem) + cont
    #print(xmlChildren(feedItems[aux]$channel.item))
    listItem <- xmlChildren(feedItems[aux]$channel.item)
    
    title2 <- xmlValue(listItem$title)
    #title2 <- listItem$title
    #description <- listItem$description
    #info <- listItem$encoded
    #pubDate <- listItem$pubDate
    h4(title2)
    #p(description)
    #p(info) 
    #p(date)
  })
  
  output$xmlDescription <- renderUI({
    aux <- as.integer(input$pageItem) + cont
    #print(xmlChildren(feedItems[aux]$channel.item))
    listItem <- xmlChildren(feedItems[aux]$channel.item)
    description <- xmlValue(listItem$description)
    p(description)
  })
  
  output$xmlInfo <- renderUI({
    aux <- as.integer(input$pageItem) + cont
    #print(xmlChildren(feedItems[aux]$channel.item))
    listItem <- xmlChildren(feedItems[aux]$channel.item)
    info <- xmlValue(listItem$encoded)
    p(info)
  })
  
  output$xmlPubDate <- renderUI({
    aux <- as.integer(input$pageItem) + cont
    #print(xmlChildren(feedItems[aux]$channel.item))
    listItem <- xmlChildren(feedItems[aux]$channel.item)
    pubDate <- xmlValue(listItem$pubDate)
    p(pubDate)
  })
  
})