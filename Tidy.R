library(pacman)
p_load(ggplot2)
p_load(ggmap, dplyr, RPostgres)
p_load(maps, tidyr)
p_load(treemap)
# ==================
# TREEMAP TIDY
# ==================
# create the table
# separate the appropriate columns from their date and time
reports = reports %>% separate(col = created, sep = " ", into = c("created_date", "created_time")) %>%
  separate(col = updated, sep = " ", into = c('updated_date', 'updated_time')) %>% 
  separate(col = sent, sep = ' ', into = c('sent_date', 'sent_time'))

# turn the date columns back into a date object
reports = reports %>% mutate(across(.cols = c(created_date, updated_date, sent_date)
                                    , .fns = as.Date))

# tidy the data for a table/geom_col graph
bot_table = reports %>% group_by(botname) %>% summarize(num_of_reports = n()
                                                        , first_report = created_date %>% min()
                                                        , latest_report = created_date %>% max())
# tidy the data for a treemap
bot_treemap = reports %>% group_by(botname) %>% summarize(num_of_reports = n())
#--------------------------------------
# MAPS TIDY
#--------------------------------------
# cleaning and prep to build a map
# filter for only kyiv based on lat/long
kyiv_points = geo %>% filter(29 <= longitude & longitude <= 31,
                             49 <= latitude & latitude <= 51)

kyiv_points2 = geo %>% filter(29 <= longitude & longitude <= 31
                              , 49 <= latitude & latitude <= 51) %>%
  separate(col = created, sep = " ", into = c("created_date", NA)) %>%
  mutate(across(.cols = created_date
                , .fns = as.Date))


