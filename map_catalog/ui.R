ui <- bootstrapPage(
  tags$style(type = "text/css", "html, body {width:100%;height:100%}"),
  leafletOutput("main_map", width = "100%", height = "100%"),
  absolutePanel(id = "controls", class = "panel panel-default", fixed = TRUE, 
                top = 20, left = "auto", right = 20, bottom = "auto",
                h2("Map-catalog"),
                p("This app shows only the first 500 pyramids"),
                style='padding: 5px;  background-color: rgba(255,255,255,0.75);',
                selectInput(inputId="whose_provider", label="whose_provider:", choices = global_ui_choices$whose_provider_short),
                selectInput(inputId="what_project", label="what_project:", choices = global_ui_choices$what_project_short,selected = global_ui_choices$what_project_short[1]),
                sliderInput("when_range", "when_range:", min = 1981, max = 2016, value = c(2000,2014)),
                selectInput(inputId="yscale",label='Y-Scale:',
                            choices = list("Raw data" = "Raw data", "5 years" = "5 years", "10 years" = "10 years", "Big groups" = "Big groups"), 
                            selected = "10 years"),
                selectInput(inputId="xscale",label='X-Scale:',
                            choices = list("Habs." = "false", "Perc. (%)" = "true"), 
                            selected = 1),
                plotOutput("pyramid")
                )
  )