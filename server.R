# Define the Server (Backend)
server <- function(input, output) {
  
  # Generate DNA
  dna_sequence <- reactive({
    
    base_probs <- c(
      input$prob_A,
      input$prob_T,
      input$prob_C,
      input$prob_G
    )
    
    validate(
      need(
        all(is.finite(base_probs)) &&
          all(base_probs >= 0) &&
          all(base_probs <= 1) &&
          abs(sum(base_probs) - 1) < 1e-8,
        "The four probabilities must add up to 1."
      ),
      
      need(
        input$n_bases %% 3 == 0,
        "DNA length must be divisible by 3."
      )
    )
    
    gene_dna(
      n_bases = input$n_bases,
      base_probs = base_probs
    )
  })
  
  # Display DNA
  output$dna <- renderText({
    dna_sequence()
  })
  
  # Transcribe DNA into RNA
  output$rna <- renderText({
    transcribe_dna(dna_sequence())
  })
  
  # Translate RNA into protein
  output$protein <- renderText({
    rna <- transcribe_dna(dna_sequence())
    translate_rna(rna)
  })
  
}