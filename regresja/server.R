library(dplyr)
library(purrr)

function(input, output) {
  
  output$regression_sum_up <- renderPrint({
    model <- lm(mpg ~ ., data = mtcars %>% select(one_of("mpg", unlist(input$predictor))))
    summary(model)$coefficients[, c(1, 4)]
  })
  
  output$regression_plot <- renderPlot({
    data = mtcars %>% select(one_of("mpg", unlist(input$predictor)))
    model <- lm(mpg ~ ., data = data)
    plot(model, which = 1)
  })
  
  output$regression_rsq <- renderText({
    model <- lm(mpg ~ ., data = mtcars %>% select(one_of("mpg", unlist(input$predictor))))
    summary(model)$r.squared
  })
  
}
