library(shiny)
library(ggplot2)

data_lang<-read.csv("http://hsequantling.wikispaces.com/file/view/all_words.csv", encoding = 'UTF-8', sep=",", header = TRUE)

data <- data_lang

# Define UI for application that draws a histogram
shinyUI(
  fluidPage(
    titlePanel("One thousand Most Frequently Used Words"),
    
    sidebarLayout(
      sidebarPanel(
        fluidRow(
          column(10,
                 selectInput("lang",
                             "Choose language:",
                             c("All languages",
                               unique(as.character(data$language))))
          )
        )
      ),
      mainPanel(
        p("��� ���������� ���������� 1000 ����� ��������� ���� ��������� ������. ������ �������� �� ���������� ����� http://www.101languages.net/common-words/. ������ �������������, ��� ������ ������� ������ (������� ����� ������ �� ����� �� ������), ����� ��� � �� ����� ������ ���������.")        
      )
    ),
    
    # Create a new row for the table.
    fluidRow(
      DT::dataTableOutput("table")
    )
  )
)