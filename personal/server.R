#server.R
#This code executes the app is launched.

library("XML")

feed <- xmlTreeParse(file = "http://www.inab.org/category/job-opportunities/feed/", isURL = TRUE)
#feed <- xmlTreeParse(file = "http://www.mathjobs.org/jobs?joblist-0-----rss", isURL = TRUE)
#feed <- xmlTreeParse(file = "http://www.madrimasd.org/informacionidi/noticias/rss/empleo.ashx", isURL = TRUE)

feedItems <- xmlElementsByTagName(feed$doc$children$rss, name = "item", recursive = TRUE)

#xmlChildren(feedItems[1]$channel.item)

# for (item in feedItems) {
#   print(xmlChildren(item)$title)
# }

siguientePage <- 0

shinyServer(function(input, output) {
  #This code executes the user visits the site
  
  #------------------- Personal page code ---------------------#
  output$h1 <- renderUI({
    h1(input$whatYouSee)
  })
  
  output$outputText <- renderUI({
    if(input$whatYouSee == "Profile"){
      HTML("Looking for a career on bioinformatics. 
        Trying to help the environment. Active in social media.
        Not enough knowledge of biology, but trying to improve it.
        Honest and hard work. Really love system biology. 
        Open mind and open source (when it's possible). 
        Love impressive presentations. Always looking for challenges. 
        Traveling is ok.")
      #maybe profiles of other webs here?
    }
    else if(input$whatYouSee == "Skills"){
      HTML("<i>Programming languages:</i>
<ul>
  <li>R</li>
	<li>Java</li>
	<li>Python</li>
	<li>Matlab</li>
	<li>C/C++</li>
	<li>HTML5/Javascript/Php</li>
</ul>
<i>Programming tools:</i>
<ul>
	<li>Git</li>
	<li>SVN</li>
	<li>General IDEs: Eclipse, netbeans, Rstudio, ...</li>
</ul>
")
    }else if(input$whatYouSee == "Languages"){
      HTML("Spanish native and English proficient (Certificated by Duolingo).")
      #programming languages here?
    }else if(input$whatYouSee == "Education"){
      HTML("<p>I'd like you to tell a <i>story</i>... 
           When I was a young boy (around 17s)</p>")
    }else {
      HTML("HackingMedicine Madrid, Hackathon El Mundo, ...")
      #Events assited, other relevant info
    }
  })
  
  #----------------- Jobs code --------------------#
  cont <- 0
  contAnt <- cont
  selectedItem <- 1
  aux <- 1
  prevPage <- 0
  
  #aux <- as.integer(input$pageItem) + cont
  #print(xmlChildren(feedItems[aux]$channel.item))
  listItem <- xmlChildren(feedItems[aux]$channel.item)
  
  
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
    #     if(input$nextPage != siguientePage){
    #       siguientePage = input$nextPage[1]
    #       
    #       contAnt <- cont
    #       cont <- cont + 10
    #       if(cont>=length(feedItems)){
    #         cont <- contAnt
    #       }
    #     }
    #     if(input$prevPage != prevPage){
    #       prevPage <- prevPage + 1
    #       
    #       contAnt <- cont
    #       cont <- cont - 10
    #       if(cont<0){
    #         cont <- contAnt
    #       }
    #     }
    #print(cont)
    #     if(contAnt==cont)
    #       if(!is.null(input$cbItems))
    #         selectedItem <- as.integer(input$cbItems)
    #     else
    #       selectedItem <- cont + 1
    #     
    #     if(cont+10<length(feedItems)){
    #       selectInput("cbItems", label = "Select job:", selected = selectedItem, choices = (cont+1):(cont+10))
    #     }else{
    selectInput("cbItems", label = "Select job:", selected = 1, choices = (cont+1):(length(feedItems)))
    #     }
  })
  
  
  output$xmlTitle <- renderUI({
    listItem <- updateListFeed(input, cont, feedItems)
    title2 <- xmlValue(listItem$title)
    h3(title2)
  })
  
  output$xmlDescription <- renderUI({
    listItem <- updateListFeed(input, cont, feedItems)
    description <- xmlValue(listItem$description)
    info <- xmlValue(listItem$encoded)
    pubDate <- xmlValue(listItem$pubDate)
    HTML(paste(c(description, info, pubDate), collapse=' '))
  })
})