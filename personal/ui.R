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
                      fluidRow(
                        column(4,
                               radioButtons("provider", label = h4("Choose the jobs provider:"),
                                            choices = list("Bioinformatics.org" = "Bioinformatics.org",
                                                           "inab.org" = "inab.org", 
                                                           "madrimasd.org" = "madridmasd.org"))
                               ),
                        column(8,
                               
                               uiOutput("xmlTitle"),
                               uiOutput("xmlDescription"))
                        
                      ),
                      sidebarLayout(
                        sidebarPanel(
                          helpText("Choose the link you want job you want to see"),
                          
                          uiOutput("cbItems")
                        ),
                        
                        mainPanel(
                        )
                      )
             )
  )
)
