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

shinyServer(function(input, output) {
  #This code executes the user visits the site
  output$xmlOutput <- renderUI({
    if(cont!=0){
      if(input$prevPage){
        cont <- cont + 10
      } else {
        cont <- cont - 10
      }
    }
    aux <- as.integer(input$pageItem) + cont
  
    print(xmlChildren(feedItems[aux]$channel.item))
    listItem <- xmlChildren(feedItems[aux]$channel.item)
    print("oeoe")
    title <- listItem$title
    description <- listItem$description
    info <- listItem$encoded
    date <- listItem$pubDate
    paste(h1("title"), br(), 
            p(description) , br() , 
            p(info) , br() , 
            p(date), br())
  })
  
})