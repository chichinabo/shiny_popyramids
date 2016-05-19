require("RPostgreSQL")

############################ Retrieve app ui data ############################
get_ui<- function(){
  
  ## loads the PostgreSQL driver
  drv <- dbDriver("PostgreSQL")
  
  ## Open a connection
  con<-dbConnect(drv,user=global_user,password=global_password,host=global_host,port=global_port,dbname=global_dbname)
  
  sql<-"SELECT row_to_json FROM dms.ui_general_options"
  
  ## Submit and execute the query
  dbui<-dbGetQuery(con, sql)
  
  ## Closes the connection
  dbDisconnect(con)
  
  ## Frees all the resources on the driver
  dbUnloadDriver(drv)
  
  dbui
}

############################ Retrieve pids from a Leaflet BB ############################
####The postgresql function will change the coordinate order to get a PostGIS envelope###
get_pids<- function(provider, project, north, east, south, west, from_date, to_date, maxpids){
  
  ## loads the PostgreSQL driver
  drv <- dbDriver("PostgreSQL")
  
  ## Open a connection
  con<-dbConnect(drv,user=global_user,password=global_password,host=global_host,port=global_port,dbname=global_dbname)
  
  
  sql<-paste("SELECT pids FROM unnest(dms.chibo_give_me_pids('", provider, "','", project, "',", north, ",", east, ",", south, ",", west, ", DATE (", from_date,"||'-01-01'), DATE(", to_date,"||'-01-01')," , maxpids,")) AS pids", sep = "")
  
  
  ## Submit and execute the query
  dbpids<-dbGetQuery(con, sql)
  
  ## Closes the connection
  dbDisconnect(con)
  
  ## Frees all the resources on the driver
  dbUnloadDriver(drv)
  
  dbpids
}

############################ Retrieve Geojson from pids ############################
#### Not necessarily 5, but an Array of pyramids , , 
get_pyramids<- function(pids, age_groups, percentages){
  
  ## loads the PostgreSQL driver
  drv <- dbDriver("PostgreSQL")
  
  ## Open a connection
  con<-dbConnect(drv,user=global_user,password=global_password,host=global_host,port=global_port,dbname=global_dbname)
  
  sql<-paste("SELECT pyramids FROM dms.chibo_give_me_pyramids(ARRAY[",
             paste(pids$pids,collapse=","),
             "]::integer[],'", 
             age_groups,"','",
             percentages,"') AS pyramids", 
             sep = "")
  
  ## Submit and execute the query
  dbpyramids<-dbGetQuery(con, sql)
  
  ## Closes the connection
  dbDisconnect(con)
  
  ## Frees all the resources on the driver
  dbUnloadDriver(drv)
  
  dbpyramids
}