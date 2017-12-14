library(datasets)
library(dplyr)

function(input, output) {
  
  output$phonePlot <- renderPlotly({

    data <- WorldPhones %>% 
      {as.data.frame(., row.names = rownames(.))} %>% 
      select(one_of(input$regions)) 
    
    p <- plot_ly(x = rownames(data), y = data[[1]], type = "bar", name = colnames(data)[1]) %>%
      layout(yaxis = list(title = 'Count'), barmode = 'group')
    
    plot_data <- data %>% 
      select(-1)
    
    plot_series_names <- colnames(plot_data)
    
    reduce2(
      .x = plot_data, 
      .y = plot_series_names, 
      .f = function(plot, series, series_name) {
        add_trace(plot, y = series, name = series_name)}, 
      .init = p)
    
  })
}
