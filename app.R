library(shiny)

# Define UI for the app
ui <- fluidPage(
  titlePanel("Mean Calculator"),
  sidebarLayout(
    sidebarPanel(
      numericInput("num1", "Enter first number:", value = 0),
      numericInput("num2", "Enter second number:", value = 0),
      numericInput("num3", "Enter third number:", value = 0),
      actionButton("calc", "Calculate Mean")
    ),
    mainPanel(
      textOutput("mean_result")
    )
  )
)

# Define server logic
server <- function(input, output) {
  observeEvent(input$calc, {
    mean_value <- mean(c(input$num1, input$num2, input$num3))
    output$mean_result <- renderText(paste("Mean is:", mean_value))
  })
}

# Run the application
shinyApp(ui = ui, server = server)
