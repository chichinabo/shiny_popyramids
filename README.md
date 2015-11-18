# popyramids_shiny_apps
Popyramids mini-applications built with Shiny to explore the popyramids chichinabo database

## INSTALLATION
Requirements: R, Shiny, PostgreSQL 9.3+, PostGIS, and a ready popyramids_db, containing stage, ods and dms schemas.

Download and unzip this project into your Shiny app folder:

        curl 
        unzip

Install library libpq-dev
        apt-get update
        apt-get install libpq-dev


Add permisions for installing new R packages on the fly:

        chmod...
Change the dummy values in the pgconnection.R file to your database parameters:

        global_user<-"user"
        global_password<-"password"
        global_host<-"localhost"
        global_port<-"5432"
        global_dbname<-"dbname"
