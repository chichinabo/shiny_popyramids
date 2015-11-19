server <- function(input, output, session) {
  
  #Generate base leaflet maps
  output$main_map_a <- renderLeaflet({    
    main_map_a<-leaflet()%>%
      # Base groups
      addProviderTiles("CartoDB.Positron", group = "Positron", options = providerTileOptions(noWrap = TRUE))%>%
      
      fitBounds(initial_lng1,initial_lat1,initial_lng2,initial_lat2)#Spain
    
    main_map_a
  })
  
  #Get 1 reactive pyramids from leaflet map
  reactive_pyramids_a<-eventReactive(c(input$whose_provider_a, input$what_project_a, input$main_map_a_bounds, input$when_range_a, input$yscale_a, input$xscale_a), {
    pids <- get_pids(input$whose_provider_a,input$what_project_a, input$main_map_a_bounds$north, input$main_map_a_bounds$east, input$main_map_a_bounds$south, input$main_map_a_bounds$west, input$when_range_a[1], input$when_range_a[2], 1)
    pyramids <- get_pyramids(pids, input$yscale_a, input$xscale_a)
    
    geojson<-RJSONIO::fromJSON(pyramids$pyramids)
    
    geojson
    
  })
  
##This updates the main map
observeEvent(c(input$whose_provider_a, input$what_project_a, input$main_map_a_bounds, input$when_range_a, input$yscale_a, input$xscale_a),{
  
  if (is.null(input$main_map_a_bounds)){return()}#CHECK: When the app is started, no map bounds are still available
  geojson<-reactive_pyramids_a()
  if (is.null(geojson$features)){return()}#CHECK: When there are no features back, don't do anything
  
  df<-geojson_properties(geojson)
  multipolygons<-geojson_multipolygons(geojson)
  
  leafletProxy('main_map_a')%>%
    # Overlay groups
    clearGeoJSON%>%
    clearMarkers%>%
    addGeoJSON(multipolygons, group = "Boundaries")%>%
    addMarkers(
      data=df,
      icon = pyramidIcons[df$what_shape],
      popup=df$how_popup_html_long)
})
  
  ##Plot pyramids
  output$pyramid_a <- renderPlot({
  
    if (is.null(input$main_map_a_bounds)){return()}#CHECK: When the app is started, no map bounds are still available
    geojson <- reactive_pyramids_a()
    if (is.null(geojson$features)){return()}#CHECK: When there are no features back, don't do anything
    
    
    if(length(geojson$features)>0){
      plot_pyramid(geojson$features[[1]])
    }else{
      #show empty pyramid
      plot_pyramid_empty()
    }
  })
  
  ########### PYRAMID B ##############
  #Generate base leaflet maps
  output$main_map_b <- renderLeaflet({    
    main_map_b<-leaflet()%>%
      # Base groups
      addProviderTiles("CartoDB.Positron", group = "Positron", options = providerTileOptions(noWrap = TRUE))%>%
      
      fitBounds(-5,28,0,44)#Spain
    
    main_map_b
  })
  
  #Get 1 reactive pyramids from leaflet map
  reactive_pyramids_b<-eventReactive(c(input$whose_provider_b, input$what_project_b, input$main_map_b_bounds, input$when_range_b, input$yscale_b, input$xscale_b), {
    pids <- get_pids(input$whose_provider_b,input$what_project_b, input$main_map_b_bounds$north, input$main_map_b_bounds$east, input$main_map_b_bounds$south, input$main_map_b_bounds$west, input$when_range_b[1], input$when_range_b[2], 1)
    pyramids <- get_pyramids(pids, input$yscale_b, input$xscale_b)
    
    geojson<-RJSONIO::fromJSON(pyramids$pyramids)
    
    geojson
    
  })
  
  ##This updates the main map
  observeEvent(c(input$whose_provider_b, input$what_project_b, input$main_map_b_bounds, input$when_range_b, input$yscale_b, input$xscale_b),{
    
    if (is.null(input$main_map_b_bounds)){return()}#CHECK: When the app is started, no map bounds are still available
    geojson<-reactive_pyramids_b()
    if (is.null(geojson$features)){return()}#CHECK: When there are no features back, don't do anything
    
    df<-geojson_properties(geojson)
    multipolygons<-geojson_multipolygons(geojson)
    
    leafletProxy('main_map_b')%>%
      # Overlay groups
      clearGeoJSON%>%
      clearMarkers%>%
      addGeoJSON(multipolygons, group = "Boundaries")%>%
      addMarkers(
        data=df,
        icon = pyramidIcons[df$what_shape],
        popup=df$how_popup_html_long)
  })
  
  ##Plot pyramids
  output$pyramid_b <- renderPlot({
    
    if (is.null(input$main_map_b_bounds)){return()}#CHECK: When the app is started, no map bounds are still available
    geojson <- reactive_pyramids_b()
    if (is.null(geojson$features)){return()}#CHECK: When there are no features back, don't do anything
    
    
    if(length(geojson$features)>0){
      plot_pyramid(geojson$features[[1]])
    }else{
      #show empty pyramid
      plot_pyramid_empty()
    }
  })

  
}