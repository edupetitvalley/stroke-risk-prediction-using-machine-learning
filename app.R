library(shiny)
library(splines)
library(dplyr)

# Load your GLM model 
model_spline <- readRDS("model_spline.rds")

ui <- fluidPage(
  titlePanel("Stroke Risk Prediction"),
  sidebarLayout(
    sidebarPanel(
      numericInput("age", "Age:", value = 50, min = 1, max = 120),
      numericInput("avg_glucose_level", "Average Glucose Level:", value = 100, min = 0, max = 300),
      numericInput("bmi", "BMI:", value = 25, min = 10, max = 60),
      selectInput("hypertension", "Hypertension:", choices = c("No" = 0, "Yes" = 1)),
      selectInput("heart_disease", "Heart Disease:", choices = c("No" = 0, "Yes" = 1)),
      actionButton("predict_btn", "Predict Stroke Risk", class = "btn-primary")
    ),
    mainPanel(
      h3("Predicted Probability"),
      textOutput("prediction"),
      hr(),
      helpText("Model: Logistic Regression with Natural Splines")
    )
  )
)

server <- function(input, output) {
  
  observeEvent(input$predict_btn, {
    
    # 1. Match training types
    new_data_df <- data.frame(
      age = as.numeric(input$age),
      bmi = as.character(input$bmi),
      hypertension = as.numeric(input$hypertension),
      heart_disease = as.numeric(input$heart_disease),
      avg_glucose_level = as.numeric(input$avg_glucose_level)
    )
    
    # 2. Build spline basis
    spline_cols <- as.data.frame(ns(new_data_df$avg_glucose_level, df = 3))
    
    # 3. Build final dataframe WITH avg_glucose_level included
    final_df <- cbind(
      age = new_data_df$age,
      bmi = new_data_df$bmi,
      hypertension = new_data_df$hypertension,
      heart_disease = new_data_df$heart_disease,
      avg_glucose_level = new_data_df$avg_glucose_level,  # ← REQUIRED
      spline_cols
    )
    
    # 4. Predict
    prob <- predict(model_spline, newdata = final_df, type = "response")
    
    output$prediction <- renderText({
      paste0(round(prob * 100, 2), "%")
    })
  })
}
shinyApp(ui = ui, server = server)

# str(model_spline$model)
