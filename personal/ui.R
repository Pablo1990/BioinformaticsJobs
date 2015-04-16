shinyUI(
  navbarPage("Pablo Vicente Munuera",
             tabPanel("Personal page", 
                      sidebarLayout(
                        sidebarPanel(
                          helpText("This is my personal page"),
                          radioButtons("whatYouSee",label = "What do you want to know about me?", 
                                       choices = list("Profile" = "Profile", "Skills" = "Skills", 
                                                      "Education" = "Education", "Hobbies" = "Hobbies"
                                                      , "Other" = "Other"))
                        ),
                        #http://shiny.rstudio.com/gallery/including-html-text-and-markdown-files.html
                        mainPanel(
                          column(8,
                                 uiOutput(outputId = "h1"),
                                 uiOutput(outputId = "outputText")),
                          column(4,
                                 br(),
                                 img(src = "avatar.jpg", heigth = '100%', width = '100%', style = "border-radius: 100%;")
                                 )
                        )
                      )
             ),
             
             #------------------------------------------------
             
#              tabPanel("Jobs page",
#                       sidebarLayout(
#                         sidebarPanel(
#                           radioButtons("provider", label = h4("Choose the jobs provider:"),
#                                        choices = list("inab.org" = "inab.org",
#                                                       "Bioinformatics.org" = "Bioinformatics.org", 
#                                                       "madrimasd.org" = "madrimasd.org")
#                         ),
#                           helpText("Choose the link you want job you want to see"),
#                           
#                           uiOutput("cbItems")
#                         ),
#                         
#                         mainPanel(
#                           uiOutput("xmlTitle"),
#                           uiOutput("xmlDescription")
#                         )
#                       )
#              )
            footer = HTML("<footer style=\"margin-top: 2%; border-top: 1px solid #e5e5e5; padding-top: 2%; text-align: center; color: #767676;\">
                          <i>Special thanks to: Mónica Martínez Farias, Francisco Escolano & my family.</i>
                            </footer>")

  )
)
