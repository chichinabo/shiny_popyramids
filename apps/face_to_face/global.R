######### LOAD PUBLIC SOURCES FROM popyramids_resources-master
source("../resources/auto_check_and_install.R")

source("../initial_bounds.R")

source("../resources/geojson_subsets.R")
source("../resources/leaflet_icon_list.R" )

source("../resources/mtexti.R")
source("../resources/tornado.R")

source("../pgconnection.R" )
source("../resources/pgqueries.R" )


######### GET UI CHOICES
ui_choices<-get_ui()
global_ui_choices<-RJSONIO::fromJSON(ui_choices$row_to_json, simplify = FALSE)