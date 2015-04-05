#server.R
#This code executes the app is launched.

shinyServer(function(input, output) {
  #This code executes the user visits the site
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
    }else{
      HTML("")
    }
  })
})