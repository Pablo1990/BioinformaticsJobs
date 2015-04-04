shinyUI(fluidPage(
  titlePanel("Bioinformatics jobs"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Choose the link you want job you want to see"),
      
      uiOutput("cbItems")
    ),
    
    mainPanel(
      uiOutput("xmlTitle"),
      uiOutput("xmlDescription"),
      uiOutput("xmlInfo"),
      uiOutput("xmlPubDate")
    )
  )
))