# Define UI
shinyUI(fluidPage(
  
  # Application title
  titlePanel("One by one"),
  
  sidebarLayout(
    
    # Sidebar with a slider input
    sidebarPanel(
      h5(strong("where:")),
      leafletOutput("main_map"),
      selectInput(inputId="whose_provider", label="whose_provider:", choices = global_ui_choices$whose_provider_short),
      selectInput(inputId="what_project", label="what_project:", choices = global_ui_choices$what_project_short, selected = global_ui_choices$what_project_short[1]),
      sliderInput("when_range", "when_range:", min = 1981, max = 2016, value = c(2000,2014)),
      selectInput(inputId="yscale",label='Y-Scale:',
                  choices = list("Raw data" = "Raw data", "5 years" = "5 years", "10 years" = "10 years", "Big groups" = "Big groups"), 
                  selected = "10 years"),
      
      selectInput(inputId="xscale",label='X-Scale:',
                  choices = list("Habs." = "false", "Perc. (%)" = "true"), 
                  selected = 1)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      tabsetPanel(type = "tabs", 
                  tabPanel("Plot", plotOutput("pyramid",width = "100%",height = "650")), 
                  tabPanel("Table", br(), tableOutput("values"))
                  
      )
    )
  )
)
)