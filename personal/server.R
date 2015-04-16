#server.R
#This code executes the app is launched.

library("XML")

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
<i>Languages:</i>
<ul>
  <li>Spanish native</li>
	<li>English (Certificated by <a href=\"https://certs.duolingo.com/u2a8u3uc\">Duolingo</a>).</li>
</ul>
<i>Programming tools:</i>
<ul>
	<li>Git</li>
	<li>SVN</li>
	<li>General IDEs: Eclipse, netbeans, Rstudio, ...</li>
</ul>
")
    }else if(input$whatYouSee == "Hobbies"){
      HTML("<h3>Free time</h3>

I enjoy my life day by day. Walking around with my girlfriend, have a dinner with her, or just being with her, it's a pleasure. I also enjoy listening music, reading books and playing sports. I love programming and i'm a passionate of my profession or what I do for living.

<h3>Music</h3>

Checkout my profile on spotify: <a href=\"https://open.spotify.com/user/pablo_1990\">profile</a>.

<h3>Sports</h3>

My sports is basketball, i really love play basket. But I enjoy play any kind of sports: football, tennis, running, walking, ...

<h3>Books</h3>

Checkout my profile on goodreads: <a href=\"https://www.goodreads.com/user/show/15879081-pablo-vicente-vicente\">profile</a>.")
    }else if(input$whatYouSee == "Education"){
      HTML("<p>I'd like you to tell a <i>story</i>... 
           When I was a young boy (around 17s)</p>")
    }else {
      HTML("<h3>Events</h3>

I've assited to some hack-a-thon-s in the last years: Hackathon \"El Mundo\" (<a href=\"https://github.com/Pablo1990/BioinfoTeam\">link</a>), Hacking Medicine Madrid (<a href=\"https://github.com/rafassmail/hackMadrid\">link</a>) and spaceApps by \"NASA\" (<a href=\"https://2015.spaceappschallenge.org/project/chic-communication-human-imagination-creativity-advertising/\">link</a>).

<h3>Personal projects</h3>

In my university years, i've contributed to several projects (solo or group-based):<br/>
<i>Group-based</i>
<ul>
  <li><a href=\"https://github.com/Pablo1990/3DVideogameABPSlayers\">Slayers</a>: 3D videogame</li>
	<li><a href=\"https://github.com/fawques/CodeSpain\">Codespain</a>: It's a web app to let developer find easily developer events in Spain.</li>
	<li><a href=\"https://github.com/fawques/SOR\">SOR project</a>: </li>
</ul>

<i>Solo projects</i>
<ul>
	<li><a href=\"https://github.com/Pablo1990/BioinformaticsJobs\">bioinfoJobs</a>:</li>
	<li><a href=\"https://github.com/Pablo1990/BeThePerfectTraveller\">BeThePerfectTraveller</a>: Select the country you want to know and the app will show you what is the percentege you have to pay (or what is recommended) and an advice if you travell to that country.</li>
</ul>")
      #Events assited, other relevant info
    }
  })
  
  #----------------- Jobs code --------------------#
#   cont <- 0
#   contAnt <- cont
#   selectedItem <- 1
#   #aux <- 1
#   prevPage <- 0
#   
#   feed <- xmlTreeParse(file = "http://www.inab.org/category/job-opportunities/feed/", isURL = TRUE)
#   #feed2 <- xmlTreeParse(file = "http://www.mathjobs.org/jobs?joblist-0-----rss", isURL = TRUE)
#   feedItemsInab <- xmlElementsByTagName(feed$doc$children$rss, name = "item", recursive = TRUE)
#   
#   feed <- xmlTreeParse(file = "http://www.madrimasd.org/informacionidi/noticias/rss/empleo.ashx", isURL = TRUE)
#   feedItemsMadrid <- xmlElementsByTagName(feed$doc$children$rss, name = "item", recursive = TRUE)
#   
#   url <- "http://www.bioinformatics.org/jobs/?group_id=101&summaries=1"
#   doc <- htmlTreeParse(url, useInternalNodes = T)
#   
#   links <- xpathSApply(doc, "//a[contains(@href, 'forums')]", xmlAttrs)
#   #the first item is useless
#   linksNames <- xpathSApply(doc, "//a[contains(@href, 'forums')]", xmlValue)
#   
#   #siguientePage <- 0
#   
#   #aux <- as.integer(input$pageItem) + cont
#   #print(xmlChildren(feedItems[aux]$channel.item))
#   listItem <- xmlChildren(feedItemsInab[1]$channel.item)
#   
#   
#   updateListFeed <- function (input, cont) {
#     if(!is.null(input$cbItems)){
#       if(input$provider == "inab.org"){
#         listItem <- xmlChildren(feedItemsInab[as.integer(input$cbItems)]$channel.item)
#       } else if(input$provider == "madrimasd.org"){
#         listItem <- xmlChildren(feedItemsMadrid[as.integer(input$cbItems)]$channel.item)
#       }
#     }else
#       listItem <- xmlChildren(feedItemsInab[1]$channel.item)
#   }
#   
#   output$cbItems <- renderUI({
#     lengthFeed <- 0 
#     
#     if(input$provider == "inab.org"){
#       lengthFeed <- length(feedItemsInab)
#     }else if(input$provider == "madrimasd.org"){
#       lengthFeed <- length(feedItemsMadrid)
#     }else{
#       lengthFeed <- 25
#     }
#     
#     selectInput("cbItems", label = "Select job:", selected = 1, choices = (cont+1):(lengthFeed))
#     #     }
#   })
#   
#   
#   output$xmlTitle <- renderUI({
#     listItem <- updateListFeed(input, cont)
#     title2 <- xmlValue(listItem$title)
#     if(input$provider == "Bioinformatics.org"){
#       title2 <- linksNames[as.integer(input$cbItems)+1]
#     }
#     h3(title2)
#   })
#   
#   output$xmlDescription <- renderUI({
#     listItem <- updateListFeed(input, cont)
#     description <- NA
#     pubDate <- NA
#     
#     if(input$provider == "Bioinformatics.org"){
#       description <-  paste(c('<a href="http://www.bioinformatics.org/',links[as.integer(input$cbItems)+1],'">Link offer</a>'), collapse='')
#     } else {
#       description <- xmlValue(listItem$description)
#       #info <- xmlValue(listItem$encoded)
#       pubDate <- xmlValue(listItem$pubDate)
#     }
#     
#     if(!is.na(pubDate)){
#       aux2 <- strsplit(pubDate, split = " ")
#       aux2 <- aux2[[1]]
#       pubDate <- paste(c(aux2[2], aux2[3], aux2[4]), collapse='-')
#       
#       HTML(paste(c(pubDate, "<br/><br/>", description), collapse=' '))
#     } else {
#       HTML(description)
#     }
#   })
})