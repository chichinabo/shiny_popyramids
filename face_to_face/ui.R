############################ ui ############################
ui<-dashboardPage(
  dashboardHeader(
    title = "Face to face"
  ),
  dashboardSidebar(
    
    sidebarMenu(
      menuItem("Dashboard", icon=icon("dashboard"), tabName = "dashboard"),
      menuItem("Filters A", icon=icon("filter"), tabName = "filters_a",
               selectInput(inputId="whose_provider_a", label="whose_provider:", choices = global_ui_choices$whose_provider_short),
               selectInput(inputId="what_project_a", label="what_project:", choices = global_ui_choices$what_project_short, selected = global_ui_choices$what_project_short[1]),
               sliderInput("when_range_a", "when_range:", min = 1981, max = 2016, value = c(2000,2014)),
               selectInput(inputId="yscale_a",label='Y-Scale:',
                           choices = list("Raw data" = "Raw data", "5 years" = "5 years", "10 years" = "10 years", "Big groups" = "Big groups"), 
                           selected = "10 years"),
               
               selectInput(inputId="xscale_a",label='X-Scale:',
                           choices = list("Habs." = "false", "Perc. (%)" = "true"), 
                           selected = "true")
      ),
      menuItem("Filters B", icon=icon("filter"), tabName = "filters_b",
               selectInput(inputId="whose_provider_b", label="whose_provider:", choices = global_ui_choices$whose_provider_short),
               selectInput(inputId="what_project_b", label="what_project:", choices = global_ui_choices$what_project_short, selected = global_ui_choices$what_project_short[1]),
               sliderInput("when_range_b", "when_range:", min = 1981, max = 2016, value = c(2000,2014)),
               selectInput(inputId="yscale_b",label='Y-Scale:',
                           choices = list("Raw data" = "Raw data", "5 years" = "5 years", "10 years" = "10 years", "Big groups" = "Big groups"), 
                           selected = "10 years"),
               
               selectInput(inputId="xscale_b",label='X-Scale:',
                           choices = list("Habs." = "false", "Perc. (%)" = "true"), 
                           selected = "true")
      )
    )
  ),
  dashboardBody(
    tabItems(
      tabItem("dashboard",
              fluidRow(
                column(width = 6,
                       box(width=12,
                           leafletOutput("main_map_a")
                       )
                ),
                column(width = 6,
                       box(width=12,
                           leafletOutput("main_map_b")
                       )
                )
              )
              ,
              fluidRow(
                column(width = 6,
                       box(width=12,
                           tabsetPanel(type = "tabs", 
                                       tabPanel("Plot A", plotOutput("pyramid_a")), 
                                       tabPanel("Table A", br(), tableOutput("values_a"))
                           )
                       )
                ),
                column(width = 6,
                       box(width=12,
                           tabsetPanel(type = "tabs", 
                                       tabPanel("Plot B", plotOutput("pyramid_b")), 
                                       tabPanel("Table B", br(), tableOutput("values_b"))
                           )
                       )
                )
              )
      )
    )
  )
)