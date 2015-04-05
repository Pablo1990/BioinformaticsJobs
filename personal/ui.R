shinyUI(fluidPage(
  titlePanel("Pablo Vicente Munuera"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("This is my personal page"),
      #img(src = "avatar.JPG", heigth = '50%', width = '50%'),
      radioButtons("whatYouSee",label = "What do you want to know about me?", 
                   choices = list("Profile" = "Profile", "Skills" = "Skills", 
                                  "Education" = "Eduction", "Languages" = "Languages"))
    ),
    #http://shiny.rstudio.com/gallery/including-html-text-and-markdown-files.html
    mainPanel(
      uiOutput(outputId = "h1"),
      uiOutput(outputId = "outputText")
    )
  )
))