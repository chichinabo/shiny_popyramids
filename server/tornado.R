library("epade")
# Plot logos on the pyramid
library("png")
library("grid")

mars_path<-file.path("./ui/images/mars.png")
venus_path<-file.path("./ui/images/venus.png")
chibo_path<-file.path("./ui/images/chibo.png")
chibo_percent_path<-file.path("./ui/images/chibo_percent.png")

mars_icon <- readPNG(mars_path)
venus_icon <- readPNG(venus_path)
chibo_icon <- readPNG(chibo_path)
chibo_percent_icon <- readPNG(chibo_percent_path)

############################ Retrieve app statistics ############################
## TODO: We need to modify this function for plotting multivariable pyramids
plot_pyramid<- function(feature){
  
  pid<-unlist(feature$properties$pid)
  pop.xy<-unlist(feature$properties$what_data[[1]]$what_xy)
  pop.xx<-unlist(feature$properties$what_data[[1]]$what_xx)
  pop.age<-unlist(feature$properties$what_data[[1]]$what_age)
  pop.total<-unlist(feature$properties$what_total_pop)
  when<-unlist(feature$properties$when_reference)
  geoname<-unlist(feature$properties$where_geoname)
  project<-unlist(feature$properties$what_project)
  provider<-unlist(feature$properties$whose_provider)
  url<-unlist(feature$properties$whose_url)
  bins<-length(pop.age)
  
  tornado.ade(cbind(pop.xy, pop.xx),
              vnames=pop.age,
              gnames=c('',''),
              xlab='',
              main=geoname,
              col= cbind("#9ECAE1", "#FC9272"),
              legendon="bottom",
              wall = 2)
  
  ##Year
  mtext(substring(when,1,4), cex=1.2, col="black", font=2)
  
  ##Sources
  mtexti(paste(provider, " (", url,")"), 2, cex=.8, col="gray")#2=left-center
  mtexti(project, 4, cex=.8, col="gray")#4=right-center
  
  ##Chibo credits
  mtext("popyramids.chichinabo.org", 1, line=4, adj=0, cex=.8, col="gray")
  mtext(paste("PID:",pid), 1, line=4, adj=1.0, cex=.8, col="gray")
  
   
  ##Summary data
  mtext(text = paste("Total:", format(pop.total, big.mark=",", scientific=FALSE)),side = 3, line=-3, adj=0.9, cex=1, col="black")  
  
  grid.raster(mars_icon,height = 0.05,interpolate = TRUE,x = 0.25, y = 0.85,just = "right")
  grid.raster(venus_icon,height = 0.05,interpolate = TRUE,x = 0.75, y = 0.85,just = "left")
  
  ##Check if it is a percentages pyramid
  if(pop.xy[1]==floor(pop.xy[1])){
    grid.raster(chibo_icon,height = 0.10,interpolate = TRUE, x = 0.50, y = 0.11,just = "center")
  }else{
    grid.raster(chibo_percent_icon,height = 0.08,interpolate = TRUE, x = 0.50, y = 0.11,just = "center")
  }
  
}