shinyUI(fluidPage(
  titlePanel("Bioinformatics jobs"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Choose the link you want job you want to see"),
      
      uiOutput("cbItems"),
      
      
      actionButton(inputId = "prevPage",
                   label = "Prev"),
      actionButton(inputId = "nextPage",
                   label = "Next")
    ),
    
    mainPanel(
      uiOutput("xmlTitle"),
      uiOutput("xmlDescription"),
      uiOutput("xmlInfo"),
      uiOutput("xmlPubDate")
    )
  )
))