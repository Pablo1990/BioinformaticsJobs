shinyUI(
  navbarPage("Pablo Vicente Munuera",
             tabPanel("Personal page", 
                      sidebarLayout(
                        sidebarPanel(
                          helpText("This is my personal page"),
                          #img(src = "avatar.JPG", heigth = '50%', width = '50%'),
                          radioButtons("whatYouSee",label = "What do you want to know about me?", 
                                       choices = list("Profile" = "Profile", "Skills" = "Skills", 
                                                      "Education" = "Education", "Hobbies" = "Hobbies"
                                                      , "Other" = "Other"))
                        ),
                        #http://shiny.rstudio.com/gallery/including-html-text-and-markdown-files.html
                        mainPanel(
                          uiOutput(outputId = "h1"),
                          uiOutput(outputId = "outputText")
                        )
                      )
             ),
             
             #------------------------------------------------
             
             tabPanel("Jobs page",
                      sidebarLayout(
                        sidebarPanel(
                          radioButtons("provider", label = h4("Choose the jobs provider:"),
                                       choices = list("inab.org" = "inab.org",
                                                      "Bioinformatics.org" = "Bioinformatics.org", 
                                                      "madrimasd.org" = "madrimasd.org")
                        ),
                          helpText("Choose the link you want job you want to see"),
                          
                          uiOutput("cbItems")
                        ),
                        
                        mainPanel(
                          uiOutput("xmlTitle"),
                          uiOutput("xmlDescription")
                        )
                      )
             )
  )
)
