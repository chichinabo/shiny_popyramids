
require("epade")
# Plot logos on the pyramid
require("png")
require("grid")

chibo_path<-file.path("./ui/images/chibo.png")

chibo_icon <- readPNG(chibo_path)

plot_pyramid_empty<- function(){
  
  tornado.ade(cbind(c(1,0.9,0.8,0.7,0.6,0.5,0.4,0.3,0.2,0.1,0), c(1,0.9,0.8,0.7,0.6,0.5,0.4,0.3,0.2,0.1,0)),
              vnames=c("[0-10)","[10-20)","[20-30)","[30-40)","[40-50)","[50-60)","[60-70)","[70-80)","[80-90)","[90-100)","[100,)"),
              gnames=c('',''),
              xlab='',
              main='No data, no pyramid!!',
              col="gray",
              legendon="bottom",
              wall = 2)
  
  ##Chibo credits
  mtext("popyramids.chichinabo.org", 1, line=4, adj=0.5, cex=1.5)
  grid.raster(chibo_icon,height = 0.4,interpolate = TRUE, x = 0.30, y = 0.50,just = "center")
}
  
