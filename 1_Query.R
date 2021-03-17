# if(!requireNamespace("devtools")) install.packages("devtools")
# devtools::install_github("dkahle/ggmap", ref = "tidyup", force=TRUE)
# load packages
library(pacman)
p_load(ggplot2)
p_load(ggmap, dplyr, RPostgres)
p_load(maps, tidyr)
p_load(treemap)

#--------------------------------------
# Connect to the DB and query
#--------------------------------------

# set up the connection to the database
db = '**DB NAME**'
host_db = '**ENTER HOST**'
db_port = '****'
db_user = '**USER NAME**'
db_password = '**PASSWORD**'

con = dbConnect(Postgres()
                , dbname = db
                , host = host_db
                , port = db_port
                , user = db_user
                , password = db_password)

# now query the data 
query = dbSendQuery(con, 
                    'select reports_report.id
, reports_report.created
, reports_report.updated
, reports_report.sent
, bots_bot.name
, reports_addressreportfield.address_id
, geo_address.latitude
, geo_address.longitude
from reports_report
JOIN bots_bot 
ON bots_bot.id = reports_report.bot_id
JOIN reports_addressreportfield 
ON reports_addressreportfield.reportfield_ptr_id = reports_report.id 
JOIN geo_address
ON geo_address.id = reports_addressreportfield.address_id;')

# store the results in a variable 
geo = dbFetch(query) %>% data.frame()

# now query the data for a treemap
query2 = dbSendQuery(con,
                     "select rr.id
, bb.name as BotName 
, rr.created
, rr.updated
, rr.sent

from reports_report rr

join bots_bot bb 

on bb.id = rr.bot_id;")

reports = dbFetch(query2)
reports = data.frame(reports)
#View(reports)   

# disconnect from the server
dbDisconnect(con)
