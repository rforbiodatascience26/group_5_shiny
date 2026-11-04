# Define the User Interface (Frontend)

ui <- page_fluid(
  
  # Application title
  layout_columns(
    col_widths = 12,
    card(
      titlePanel("Virtual Central Dogma"),
      style = "background-color: #f0f0f0; padding: 15px;"
    )
  ),
  
  # About section
  layout_columns(
    col_widths = 12,
    card(
      card_header("About"),
      helpText(
        "This application demonstrates the Central Dogma
         of molecular biology by generating DNA,
         transcribing DNA into RNA, and translating
         RNA into a protein sequence."
      )
    )
  ),
  
  # Virtual Gene Generator
  layout_columns(
    col_widths = 12,
    card(
      card_header("Virtual Gene Generator"),
      
      sliderInput(
        inputId = "n_bases",
        label = "Number of bases:",
        min = 3,
        max = 60,
        value = 30,
        step = 3,
        width = "100%"
      ),
      
      layout_columns(
        col_widths = c(3, 3, 3, 3),
        
        numericInput(
          inputId = "prob_A",
          label = "Probability of A",
          value = 0.25,
          min = 0,
          max = 1,
          step = 0.05
        ),
        
        numericInput(
          inputId = "prob_T",
          label = "Probability of T",
          value = 0.25,
          min = 0,
          max = 1,
          step = 0.05
        ),
        
        numericInput(
          inputId = "prob_C",
          label = "Probability of C",
          value = 0.25,
          min = 0,
          max = 1,
          step = 0.05
        ),
        
        numericInput(
          inputId = "prob_G",
          label = "Probability of G",
          value = 0.25,
          min = 0,
          max = 1,
          step = 0.05
        )
      )
    )
  ),
  
  # Central Dogma Results
  layout_columns(
    col_widths = 12,
    card(
      card_header("Central Dogma Results"),
      
      h4("DNA sequence"),
      verbatimTextOutput("dna"),
      
      h4("RNA sequence"),
      verbatimTextOutput("rna"),
      
      h4("Protein sequence"),
      verbatimTextOutput("protein")
    )
  )
  
)