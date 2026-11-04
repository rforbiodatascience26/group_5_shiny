# Load needed functions
source(file = "app_functions.R")

# Define the Server (Backend)
server <- function(input, output) {
  dna <- reactive({
    base_probs <- c(input$prob_A,
                    input$prob_T,
                    input$prob_C,
                    input$prob_G)
    gene_dna(length = input$n_bases, base_probs = base_probs)
  })
  output$dna <- renderText({
    dna()
  })
  
  # Transcription
  transcription <- eventReactive(input$button, {
    transcribe_dna(dna())
  })
  
  output$rna <- renderText({
    transcription()
  })
  # Translation 
  #    
  #  translation <- eventReactive(input$button2,{
  #    translate_rna(transcription())
  #  })
  #  output$protein <- renderText({
  #    translation()
  # })
 
}