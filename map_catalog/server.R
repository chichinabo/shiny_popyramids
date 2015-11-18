server <- function(input, output, session) {
  
  #Generate base leaflet maps
  output$main_map <- renderLeaflet({    
    main_map<-leaflet()%>%
      # Base groups
      addProviderTiles("CartoDB.Positron", group = "Positron", options = providerTileOptions(noWrap = TRUE))%>%
      
      fitBounds(-5,28,0,44)#Spain
    
    main_map
  })
  
  #Get all reactive pyramids from leaflet map
  reactive_pyramids<-eventReactive(c(input$whose_provider, input$what_project, input$main_map_bounds, input$when_range), {
    pids <- get_pids(input$whose_provider,input$what_project, input$main_map_bounds$north, input$main_map_bounds$east, input$main_map_bounds$south, input$main_map_bounds$west, input$when_range[1], input$when_range[2], 1000)
    pyramids <- get_pyramids(pids, input$yscale, input$xscale)
    
    geojson<-RJSONIO::fromJSON(pyramids$pyramids)
    
    geojson
  })
  
  ##This updates the main map
  observeEvent(c(input$whose_provider, input$what_project, input$main_map_bounds, input$when_range),{
    
    if (is.null(input$main_map_bounds)){return()}#When the app is started, no map bounds are still available
    geojson <- reactive_pyramids()
    if (is.null(geojson$features)){return()}#CHECK: When there are no features back, don't do anything
    
    df<-geojson_properties(geojson)
    

leafletProxy('main_map')%>%
  clearMarkerClusters%>%
  addMarkers(
    data=df,
    icon = pyramidIcons[df$what_shape],
    clusterOptions = markerClusterOptions(), clusterId = 'cluster1',
    popup=df$how_popup_html_long
  )



  })


}