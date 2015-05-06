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
                        , HTML("<a href=\"https://es.linkedin.com/pub/pablo-vicente-munuera/2b/3a5/819\">
                                      <img src=\"https://static.licdn.com/scds/common/u/img/webpromo/btn_viewmy_160x25_es_ES.png?locale=\" 
                                      width=\"160\" height=\"25\" border=\"0\" alt=\"Ver el perfil de Pablo Vicente Munuera en LinkedIn\"></a>")
                        ),
                        #http://shiny.rstudio.com/gallery/including-html-text-and-markdown-files.html
                        mainPanel(
                          column(8,
                                 uiOutput(outputId = "h1"),
                                 uiOutput(outputId = "outputText")),
                          column(4,
                                 img(src = "avatar.jpg", heigth = '100%', width = '100%', style = "border-radius: 100%; text-align=center;"),
                                 br(), br(),
                                 HTML("<a class=\"twitter-timeline\" height=\"230px\" href=\"https://twitter.com/Pablo_1990\" 
                                      data-widget-id=\"588653808970035200\">Tweets por el @Pablo_1990.</a> <script>!function(d,s,id)
                                      {var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';
                                      if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+\"://platform.twitter.com/widgets.js\";
                                      fjs.parentNode.insertBefore(js,fjs);}}(document,\"script\",\"twitter-wjs\");</script>
                                      ")
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
