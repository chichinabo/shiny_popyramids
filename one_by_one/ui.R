############################ ui ############################
ui<-dashboardPage(
  dashboardHeader(
    title = "One by one"
  ),
  dashboardSidebar(
    
    sidebarMenu(
      menuItem("App", icon=icon("dashboard"), tabName = "dashboard"),
      menuItem("Filters", icon=icon("filter"), tabName = "filters",
               selectInput(inputId="whose_provider", label="whose_provider:", choices = global_ui_choices$whose_provider_short),
               selectInput(inputId="what_project", label="what_project:", choices = global_ui_choices$what_project_short, selected = global_ui_choices$what_project_short[1]),
               sliderInput("when_range", "when_range:", min = 1981, max = 2016, value = c(2000,2014)),
               selectInput(inputId="yscale",label='Y-Scale:',
                           choices = list("Raw data" = "Raw data", "5 years" = "5 years", "10 years" = "10 years", "Big groups" = "Big groups"), 
                           selected = "10 years"),
               
               selectInput(inputId="xscale",label='X-Scale:',
                           choices = list("Habs." = "false", "Perc. (%)" = "true"), 
                           selected = 1)
      )
    )
  ),
  dashboardBody(
    tabItems(
      tabItem("dashboard",
              fluidRow(
                column(width = 6,
                       box(width=12,
                           leafletOutput("main_map")
                       )
                ),
                column(width = 6,
                       tabsetPanel(type = "tabs", 
                                   tabPanel("Plot", plotOutput("pyramid")), 
                                   tabPanel("Table", br(), tableOutput("values"))
                                   
                       )
                )
              )
      )
    )
  )
)
