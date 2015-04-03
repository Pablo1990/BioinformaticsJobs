shinyUI(fluidPage(
  titlePanel("Bioinformatics jobs"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Choose the link you want job you want to see"),
      
      selectInput("pageItem", 
                  label = "Select the job:",
                  choices = c(1:10),
                  selected = 1),
      
      
      actionButton(inputId = "prevPage",
                   label = "Prev"),
      actionButton(inputId = "nextPage",
                   label = "Next")
    ),
    
    mainPanel(
      uiOutput("xmlOutput")
    )
  )
))