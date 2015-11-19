# Define UI
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Face to face"),
  
  fluidRow(
    column(6, 
           
           fluidRow(
             column(4,wellPanel(
               selectInput(inputId="whose_provider_a", label="whose_provider:", choices = global_ui_choices$whose_provider_short),
               selectInput(inputId="what_project_a", label="what_project:", choices = global_ui_choices$what_project_short, selected = global_ui_choices$what_project_short[1]),
               sliderInput("when_range_a", "when_range:", min = 1981, max = 2016, value = c(2000,2014)),
               selectInput(inputId="yscale_a",label='Y-Scale:',
                           choices = list("Raw data" = "Raw data", "5 years" = "5 years", "10 years" = "10 years", "Big groups" = "Big groups"), 
                           selected = "10 years"),
               
               selectInput(inputId="xscale_a",label='X-Scale:',
                           choices = list("Habs." = "false", "Perc. (%)" = "true"), 
                           selected = "true")
             )),
             column(8,wellPanel(
               h5(strong("where:")),
               leafletOutput("main_map_a")
             )
             )
           ),
           fluidRow(
             column(12,
                    wellPanel(
                      
                      plotOutput("pyramid_a") 
                    )
             )
           )
    ),
    column(6,
           fluidRow(
             column(8,wellPanel(
               h5(strong("where:")),
               leafletOutput("main_map_b")
             )),
             column(4,wellPanel(
               selectInput(inputId="whose_provider_b", label="whose_provider:", choices = global_ui_choices$whose_provider_short),
               selectInput(inputId="what_project_b", label="what_project:", choices = global_ui_choices$what_project_short, selected = global_ui_choices$what_project_short[1]),
               sliderInput("when_range_b", "when_range:", min = 1981, max = 2016, value = c(2000,2014)),
               selectInput(inputId="yscale_b",label='Y-Scale:',
                           choices = list("Raw data" = "Raw data", "5 years" = "5 years", "10 years" = "10 years", "Big groups" = "Big groups"), 
                           selected = "10 years"),
               
               selectInput(inputId="xscale_b",label='X-Scale:',
                           choices = list("Habs." = "false", "Perc. (%)" = "true"), 
                           selected = "true")
             ))
           ),
           fluidRow(
             column(12,
                    wellPanel(
                      plotOutput("pyramid_b")
                    ) 
             )
             
           )
           
    )
    
  )
  
)
)