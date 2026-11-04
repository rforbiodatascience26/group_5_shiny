#Trying somehting
# Load needed functions
source(file = "app_functions.R")

# Define the Server (Backend)
server <- function(input, output) {
  output$dna <- renderText({
    base_probs = c(input$Aprob,
                   input$Tprob,
                   input$Cprob,
                   input$Gprob)
    gene_dna(length = input$n_bases, base_probs = base_probs)
  })
}