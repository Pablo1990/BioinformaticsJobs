#server.R
#This code executes the app is launched.
library("XML")

#feed <- xmlTreeParse(file = "http://www.inab.org/category/job-opportunities/feed/", isURL = TRUE)
#feed <- xmlTreeParse(file = "http://www.mathjobs.org/jobs?joblist-0-----rss", isURL = TRUE)
feed <- xmlTreeParse(file = "http://www.madrimasd.org/informacionidi/noticias/rss/empleo.ashx", isURL = TRUE)

feedItems <- xmlElementsByTagName(feed$doc$children$rss, name = "item", recursive = TRUE)

#xmlChildren(feedItems[1]$channel.item)

# for (item in feedItems) {
#   print(xmlChildren(item)$title)
# }

cont <- 0
contAnt <- cont
selectedItem <- 1
aux <- 1
first <- TRUE

#aux <- as.integer(input$pageItem) + cont
#print(xmlChildren(feedItems[aux]$channel.item))
listItem <- xmlChildren(feedItems[aux]$channel.item)



shinyServer(function(input, output) {
  #This code executes the user visits the site
  updateListFeed <- function (input, cont, feedItems) {
    if(!is.null(input$cbItems))
      aux <- as.integer(input$cbItems) + cont
    else
      aux <- 1
    #print(xmlChildren(feedItems[aux]$channel.item))
    listItem <- xmlChildren(feedItems[aux]$channel.item)
    
    #return (listItem)
  }
  
  output$cbItems <- renderUI({
    if(input$nextPage){
      contAnt <- cont
      cont <- cont + 10
      if(cont>=length(feedItems)){
        cont <- cont - 10
      }
    }
    if(input$prevPage){
      contAnt <- cont
      if(cont!=0){
        cont <- cont - 10
      }
    }
    print(cont)
    if(contAnt==cont)
      if(!is.null(input$cbItems))
        selectedItem <- as.integer(input$cbItems)
    else
      selectedItem <- contAnt + 1
    
    print(selectedItem)
    
    if(cont+10<length(feedItems))
      selectInput("cbItems", label = "Select job:", selected = selectedItem, choices = cont+1:cont+10)
    else{
      selectInput("cbItems", label = "Select job:", selected = selectedItem, choices = cont+1:length(feedItems))
    }
  })
  
  
  output$xmlTitle <- renderUI({
    listItem <- updateListFeed(input, cont, feedItems)
    title2 <- xmlValue(listItem$title)
    h4(title2)
  })
  
  output$xmlDescription <- renderUI({
    listItem <- updateListFeed(input, cont, feedItems)
    description <- xmlValue(listItem$description)
    p(description)
  })
  
  output$xmlInfo <- renderUI({
    listItem <- updateListFeed(input, cont, feedItems)
    info <- xmlValue(listItem$encoded)
    p(info)
  })
  
  output$xmlPubDate <- renderUI({
    listItem <- updateListFeed(input, cont, feedItems)
    pubDate <- xmlValue(listItem$pubDate)
    p(pubDate)
  })
  
})