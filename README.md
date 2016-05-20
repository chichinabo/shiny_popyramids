shiny_popyramids
================
Shiny apps for exploring a popyramids database.

Dockerfile
------------
Instructions for installation and deployment are detailed in the Dockerfile. A ready to run version is available at Docker Hub. Just run it as:

    docker run -d -p 80:80 --name shiny_popyramids -d chichinabo/shiny_popyramids

Configuration
-------------
Change the dummy values in the pgconnection.R file to your database parameters:

        global_user<-"postgres"
        global_password<-"postgres"
        global_host<-"172.0.0.1"
        global_port<-"5433"
        global_dbname<-"popyramids_db"

Future work
------------
* New functionalities:
  * JSONB document store.
  * Pyramids cache.
  * Multilanguage.
* Improve features:
  * Simplified apps and charts.
  * RESTful integration. This will make the pgconnection.R file unnecessary.
* Data:
  * Compile a detailed list of available sources (URLs with RESTful APIs).
  * ETL, Foreign Data Wrappers (FDW), etc
