# Load needed functions
source(file = "app_functions.R")

# Define the User Interface (Frontend)
ui <- page_fluid(
  layout_columns(
    col_widths = 12,
    card(
      titlePanel("Virtual Central Dogma"),
      style = "background-color: #f0f0f0; padding: 15px;"
    )),
  layout_columns(
    col_widths = 12,
    card(
      titlePanel("About"),
      helpText("Generate a random DNA sequence, then manually copy it into the
                transcription box to get RNA, and copy the RNA into the
                translation box to get the protein.")
    )),
  
  # ---- 1. Gene generator ----
  layout_columns(
    col_widths = 12,
    card(
      card_header("1. Virtual Gene Generator"),
      sliderInput(inputId = "n_bases",
                  label = "Number of bases:",
                  min = 3, max = 60, value = 30, step = 3,
                  width = "100%"),
      layout_columns(
        col_widths = c(3, 3, 3, 3),
        numericInput("prob_A", "Probability of A", value = 0.25, min = 0, max = 1, step = 0.05),
        numericInput("prob_T", "Probability of T", value = 0.25, min = 0, max = 1, step = 0.05),
        numericInput("prob_C", "Probability of C", value = 0.25, min = 0, max = 1, step = 0.05),
        numericInput("prob_G", "Probability of G", value = 0.25, min = 0, max = 1, step = 0.05)
      ),
      actionButton("generate", "Generate gene", class = "btn-primary"),
      verbatimTextOutput(outputId = "dna")
    )),
  
  # ---- 2. Transcription ----
  layout_columns(
    col_widths = 12,
    card(
      card_header("2. Virtual RNA polymerase (transcription)"),
      textAreaInput("dna_in", "Paste DNA here:", width = "100%", rows = 2),
      verbatimTextOutput(outputId = "rna")
    )),
  
  # ---- 3. Translation ----
  layout_columns(
    col_widths = 12,
    card(
      card_header("3. Virtual Ribosome (translation)"),
      textAreaInput("rna_in", "Paste RNA here:", width = "100%", rows = 2),
      verbatimTextOutput(outputId = "protein")
    )),
  
  # ---- 4. Analysis (optional) ----
  layout_columns(
    col_widths = 12,
    card(
      card_header("4. Nucleotide frequencies"),
      plotOutput(outputId = "base_plot", height = "250px")
    ))
)