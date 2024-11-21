
library(shiny)
library(ggplot2)
library(DT)

# dataset
medication_data <- read.csv("medication_data.csv")

# UI
ui <- fluidPage(
  
  # Title of my app
  titlePanel("Trend of Excess COPD Medication Costs by Type"),
  
  
  #Using a layout-sidebarLayout()
  sidebarLayout(
    sidebarPanel(
      #Input-Select Box
      selectInput("type", 
                  label = "Select type of cost", 
                  choices = unique(medication_data$Type), 
                  selected = "OOP"),
      #Input-Sliders
      sliderInput("year_range", 
                  label = "Select Year Range", 
                  min = min(medication_data$FU_year),  
                  max = max(medication_data$FU_year), 
                  value = c(min(medication_data$FU_year), max(medication_data$FU_year)), 
                  step = 1,
                  round = TRUE,
                  ticks = TRUE,
                  animate = TRUE)
    ),
    
    mainPanel(
      #Creating outputs
      plotOutput("trendPlot"),
      h3("Medication Data Table"),
      dataTableOutput("dataTable") 
    )
  )
)

# Using Server to assemble input into outputs
server <- function(input, output, session) {
  
  # Based on selected Type and Year range, one can filter the data-both Type and FU_year are reactive variables
  filtered_data <- reactive({
    medication_data[medication_data$Type == input$type & 
                      medication_data$FU_year >= input$year_range[1] & 
                      medication_data$FU_year <= input$year_range[2], ]
  })
  
  # Building outputs: saving objects into output$ and building objects with render*
  output$trendPlot <- renderPlot({
    ggplot(filtered_data(), aes(x = FU_year, y = Estimate, group = Type, color = Type)) +
      geom_line(size = 1.2) +
      geom_point(size = 2) +
      labs(
        title = paste("Trend over years for excess medication cost related to COPD:", input$type),
        x = "Follow-Up Year",
        y = "Estimate (in $2020 CAD)",
        color = "Type"
      ) +
      theme_minimal(base_size = 15)
  })
  
  # Rendering the data table with the function of sorting for each columns (variables)
  output$dataTable <- renderDataTable({
    datatable(filtered_data(), 
              options = list(order = list(list(0, 'asc')))) 
  })
}

# Run the application
shinyApp(ui = ui, server = server) 