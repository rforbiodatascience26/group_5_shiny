library("shiny")
library("bslib")
library("ggplot2")

# Load needed functions
source(file = "app_functions.R")

# Run the frontend user interface ui.R
source(file = "ui.R")

# Run the backend server server.R
source(file = "server.R")

# Launch the shiny app
shinyApp(ui = ui, server = server)