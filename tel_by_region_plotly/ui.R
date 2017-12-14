library(datasets)
library(shiny)
library(plotly)

fluidPage(    
  
  titlePanel("Liczba telefonów na przestrzeni lat"),
  
  sidebarLayout(      
    
    sidebarPanel(
      checkboxGroupInput("regions", "Wybierz regiony do wyświetlenia:", 
                  choices = colnames(WorldPhones),
                  selected = colnames(WorldPhones)),
      hr(),
      helpText("Dane pochodzą z AT&T (1961) The World's Telephones.")
    ),
    
    mainPanel(
      plotlyOutput("phonePlot")  
    )
    
  )
)
