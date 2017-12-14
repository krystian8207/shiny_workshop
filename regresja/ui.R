library(shiny)
fluidPage(    
  
  titlePanel("Regresja liniowa w zbiorze mtcars"),
  
  tags$hr(),
  
  sidebarLayout(      
    
    sidebarPanel(
      checkboxGroupInput("predictor", "Wybierz zmienne objaśniające:", 
                  choices = c("cyl", "disp", "hp", "drat", "wt", "qsec", "vs", "am", "gear", "carb"),
                  selected = c("cyl", "disp", "hp", "drat", "wt", "qsec", "vs", "am", "gear", "carb")),
      hr(),
      helpText("Wybrane zmienne posłużą jako predyktory zmiennej mpg.")
    ),

    mainPanel(
      tags$h2("Rezidua względem dopasowanych wartości", style = "text-align: center;"),
      plotOutput("regression_plot"),
      tags$table(
        tags$tr(
          tags$td(
            tags$h2("Istotność", tags$br(), "współczynników"),
            verbatimTextOutput("regression_sum_up")
          ),
          tags$td(valign = "top",
            HTML("<h2>Współczynnik <br> R<sup>2</sup></h2>"),
            verbatimTextOutput("regression_rsq")
          )
        )
      )
    )
    
  )
)
