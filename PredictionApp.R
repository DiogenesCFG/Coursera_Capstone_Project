library(shiny)
suppressPackageStartupMessages({
    library(tidyverse)
    library(stringr)
})

source("ngrams.R")

ui <- fluidPage(
    titlePanel("Text Prediction App"),
    p("This (rather simple) App predicts the next word from a phrase."), 
    p("It was developed as a part of the capstone project in the JHU-Coursera Data Cience Specialization"), 
    
    sidebarLayout(
        sidebarPanel(
            h2("Instructions"),
            h5("1. Enter a word of a phrase in the text bar at the side"), 
            h5("2. Below will be shown a list of 3 possible follow up words"), 
            h5("3. In case of misspelling, probably no only few words will appear")
        ), 
        mainPanel(
            textInput("phraseInput", "User Input", width = 600), 
            h2("Suggested predicted words"), 
            h3(span(textOutput("suggested_outputs"), style = "color:blue"))
        )
    )

)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$suggested_outputs <- renderText({
        predictText(input$phraseInput)
    })

}

# Run the application 
shinyApp(ui = ui, server = server)
