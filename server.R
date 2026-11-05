# Load needed functions
source(file = "app_functions.R")

# Load needed functions
source(file = "app_functions.R")
library("ggplot2")

# Define the Server (Backend)
server <- function(input, output) {
  
  # Generate DNA only when the button is clicked
  dna_seq <- eventReactive(input$generate, {
    base_probs <- c(input$prob_A,
                    input$prob_T,
                    input$prob_C,
                    input$prob_G)
    gene_dna(length = input$n_bases, base_probs = base_probs)
  })
  
  output$dna <- renderText({
    dna_seq()
  })
  
  # Transcription (from pasted DNA)
  output$rna <- renderText({
    req(input$dna_in)
    transcribe_dna(toupper(trimws(input$dna_in)))
  })
  
  # Translation (from pasted RNA)
  output$protein <- renderText({
    req(input$rna_in)
    translate_rna(toupper(trimws(input$rna_in)))
  })
  
  # Base frequency plot (on the generated DNA)
  output$base_plot <- renderPlot({
    df <- base_freqs(dna_seq())
    ggplot(df, aes(x = Base, y = Freq, fill = Base)) +
      geom_col(show.legend = FALSE) +
      labs(x = "Nucleotide", y = "Count") +
      theme_minimal()
  })
}