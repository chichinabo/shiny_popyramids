#A short script to help installing packages on the go
#Most useful if you are distributing  a set of script files to people who may not be aware that the needed packages are not installed
#Also useful if you use many packages and want to organise their loading at the beginning of a script
need<-c("shiny", "shinydashboard","leaflet","RJSONIO","epade","png","grid","RPostgreSQL") #needed packages
ins<-installed.packages()[,1] #find out which packages are installed
(Get<-need[which(is.na(match(need,ins)))]) # check if the needed packages are installed
if(length(Get)>0){install.packages(Get,repos='https://cran.rstudio.com/')} #install the needed packages if they are not-installed
eval(parse(text=paste("library(",need,")")))#load the needed packages
