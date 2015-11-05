# Get a points vector from the RJSONIO list structures
#TODO: This should be for any number of geometries. Now it is 5 because of the "Give me five" Shiny app
geojson_points<-function(geojson){
  
  points<-geojson
  
  subset<-geojson$features[[1]]$geometry$geometries[[2]]
  points$features[[1]]$geometry<-subset
  
  subset<-geojson$features[[2]]$geometry$geometries[[2]]
  points$features[[2]]$geometry<-subset
  
  subset<-geojson$features[[3]]$geometry$geometries[[2]]
  points$features[[3]]$geometry<-subset
  
  subset<-geojson$features[[4]]$geometry$geometries[[2]]
  points$features[[4]]$geometry<-subset
  
  subset<-geojson$features[[5]]$geometry$geometries[[2]]
  points$features[[5]]$geometry<-subset
  
  points
}

# Get a multipolygons vector from the RJSONIO list structures
#TODO: This should be for any number of geometries. Now it is 5 because of the "Give me five" Shiny app
geojson_multipolygons<-function(geojson){
  multipolygons<-geojson
  
  for(i in 1:length(multipolygons$features)){
    geojson$features[[i]]$geometry$geometries[[1]]
    multipolygons$features[[i]]$geometry<-subset
  }
  
  multipolygons
}

# Get a properties dataframe from the RJSONIO list structures
geojson_properties<-function(geojson){
    longitude <- sapply(geojson$features, function(feat) {
      feat$geometry$geometries[[2]]$coordinates[1]
    })
    
    latitude <- sapply(geojson$features, function(feat) {
      feat$geometry$geometries[[2]]$coordinates[2]
    })
    
    pid <- sapply(geojson$features, function(feat) {
      feat$properties$pid
    })
    
    who_uploaded <- sapply(geojson$features, function(feat) {
      feat$properties$who_uploaded
    })
    
    what_project <- sapply(geojson$features, function(feat) {
      feat$properties$what_project
    })
    
    what_variables <- sapply(geojson$features, function(feat) {
      feat$properties$what_variables
    })
    
    what_total_pop <- sapply(geojson$features, function(feat) {
      feat$properties$what_total_pop
    })
    
    what_shape <- sapply(geojson$features, function(feat) {
      feat$properties$what_shape
    })
    
    where_geoname <- sapply(geojson$features, function(feat) {
      feat$properties$where_geoname
    })
    
    when_reference <- sapply(geojson$features, function(feat) {
      feat$properties$when_reference
    })
    
    when_accessed <- sapply(geojson$features, function(feat) {
      feat$properties$when_accessed
    })
    
    whose_provider <- sapply(geojson$features, function(feat) {
      feat$properties$whose_provider
    })
    
    whose_url <- sapply(geojson$features, function(feat) {
      feat$properties$whose_url
    })
    
    how_popup_html_long <- sapply(geojson$features, function(feat) {
      feat$properties$how_popup_html_long
    })
    
    # Compose data frame
    data.frame(
      longitude,latitude,pid,who_uploaded,what_project,what_variables,what_total_pop,what_shape,where_geoname,when_reference,when_accessed,whose_provider,whose_url, how_popup_html_long
      )
}
