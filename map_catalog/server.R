server <- function(input, output, session) {
  
  #Generate base leaflet maps
  output$main_map <- renderLeaflet({    
    main_map<-leaflet()%>%
      # Base groups
      addProviderTiles("CartoDB.Positron", group = "Positron", options = providerTileOptions(noWrap = TRUE))%>%
      
      fitBounds(initial_lng1,initial_lat1,initial_lng2,initial_lat2)#Spain
    
    main_map
  })
  
#   #Get all reactive pyramids from leaflet map
  reactive_pyramids<-eventReactive(c(input$whose_provider, input$what_project, input$main_map_bounds, input$when_range, input$yscale, input$xscale), {
    pids <- get_pids(input$whose_provider,input$what_project, input$main_map_bounds$north, input$main_map_bounds$east, input$main_map_bounds$south, input$main_map_bounds$west, input$when_range[1], input$when_range[2], 500)
    pyramids <- get_pyramids(pids, input$yscale, input$xscale)
    
    geojson<-RJSONIO::fromJSON(pyramids$pyramids)
    
    geojson
    
  })
  
  #Get the selected reactive pyramid from leaflet map
  reactive_pyramid<-eventReactive(c(input$whose_provider, input$what_project, input$main_map_marker_click, input$when_range, input$yscale, input$xscale), {

    click<-input$main_map_marker_click
    pids<-click$id
    pid<-as.data.frame(pids)

    pyramids <- get_pyramids(pid, input$yscale, input$xscale)
    
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
        layerId = df$pid,
        icon = pyramidIcons[df$what_shape],
        clusterOptions = markerClusterOptions(), clusterId = 'cluster1',
        popup=df$how_popup_html_long
      )
    
  })
  
  
  ##Plot pyramids
  output$pyramid <- renderPlot({
    
    if (is.null(input$main_map_marker_click)){return()}#CHECK: When the app is started, no map bounds are still available
    geojson <- reactive_pyramid()
    if (is.null(geojson$features)){return()}#CHECK: When there are no features back, don't do anything
    
    
    if(length(geojson$features)>0){
      plot_pyramid(geojson$features[[1]])
    }else{
      #show empty pyramid
      plot_pyramid_empty()
    }
  })
  
  
  
}