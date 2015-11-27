server <- function(input, output, session) {
  
  #Generate base leaflet maps
  output$mapA <- renderLeaflet({    
    mapA<-leaflet()%>%
      # Base groups
      addProviderTiles("CartoDB.Positron", group = "Positron", options = providerTileOptions(noWrap = TRUE))%>%
      
      fitBounds(initial_lng1,initial_lat1,initial_lng2,initial_lat2)#Spain
    
    mapA
  })
  
  #Get 1 reactive pyramids from leaflet map
  reactive_pyramids<-eventReactive(c(input$whose_provider, input$what_project, input$mapA_bounds, input$when_range, input$yscale, input$xscale), {
    pids <- get_pids(input$whose_provider,input$what_project, input$mapA_bounds$north, input$mapA_bounds$east, input$mapA_bounds$south, input$mapA_bounds$west, input$when_range[1], input$when_range[2], 1)
    pyramids <- get_pyramids(pids, input$yscale, input$xscale)
    
    geojson<-RJSONIO::fromJSON(pyramids$pyramids)
    
    geojson
    
  })
  
##This updates the main map
observeEvent(c(input$whose_provider, input$what_project, input$mapA_bounds, input$when_range, input$yscale, input$xscale),{
  
  if (is.null(input$mapA_bounds)){return()}#CHECK: When the app is started, no map bounds are still available
  geojson<-reactive_pyramids()
  if (is.null(geojson$features)){return()}#CHECK: When there are no features back, don't do anything
  
  df<-geojson_properties(geojson)
  multipolygons<-geojson_multipolygons(geojson)
  
  leafletProxy('mapA')%>%
    # Overlay groups
    clearGeoJSON%>%
    clearMarkers%>%
    addGeoJSON(multipolygons, group = "Boundaries")%>%
    addMarkers(
      data=df,
      icon = pyramidIcons[df$what_shape])
})
  
  ##Plot pyramids
  output$pyramid <- renderPlot({
  
    if (is.null(input$mapA_bounds)){return()}#CHECK: When the app is started, no map bounds are still available
    geojson <- reactive_pyramids()
    if (is.null(geojson$features)){return()}#CHECK: When there are no features back, don't do anything
    
    
    if(length(geojson$features)>0){
      plot_pyramid(geojson$features[[1]])
    }else{
      #show empty pyramid
      plot_pyramid_empty()
    }
  })
  
# Reactive expression to compose a data frame containing all the values
pyramidValues <- reactive({
  
  if (is.null(input$mapA_bounds)){return()}#CHECK: When the app is started, no map bounds are still available
  geojson <- reactive_pyramids()
  if (is.null(geojson$features)){return()}#CHECK: When there are no features back, don't do anything
  
  df<-geojson_properties(geojson)
  
  df<-df[,-ncol(df)]#Remove las n cols that contain ui data
  
})


# Show the values using an HTML table
output$values <- renderTable({
  t(pyramidValues())
})
  
}