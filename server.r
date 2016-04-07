library(shiny)
library(ggplot2)

data_lang<-read.csv("http://hsequantling.wikispaces.com/file/view/all_words.csv", encoding = 'UTF-8', sep=",", header = TRUE)


# Define server
shinyServer(function(input, output) {
  
  # Filter data
  output$table <- DT::renderDataTable(DT::datatable({
    data <- data_lang
    
    if (input$lang != "All languages"){
      data <- data[data$language == input$lang,]
      data
    }
    
  }))
  
})