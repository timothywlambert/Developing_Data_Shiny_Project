#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("2018 NCAA Football Win Distribution"),
   
   # Sidebar with a slider input for number of bins 
   pageWithSidebar(
     headerPanel("Select Team"),
     sidebarPanel(
       selectInput("variable", "Team", colnames(Teams.Wins.2018))
     ),
     mainPanel(
       plotOutput('plot1')
     )
   )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  
  output$plot1 <- renderPlot ({
    hist(Teams.Wins.2018[,input$variable],
         main = input$variable,
         xlab = "Wins")
    
  })
  
}

# Run the application 
shinyApp(ui = ui, server = server)

