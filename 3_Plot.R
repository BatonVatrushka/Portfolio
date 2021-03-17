library(pacman)
p_load(ggplot2)
p_load(ggmap, dplyr, RPostgres)
p_load(maps, tidyr)
p_load(treemap)
p_load(gridExtra, grid)

#------------
# BOT TABLE
#------------
grid.table(bot_table)
# don't run these lines of code one after the other
# reports %>% head() %>% grid.table()
#------------
# TREEMAP
#------------
# create the treemap
treemap(bot_treemap, index = c('botname')
        , vSize = 'num_of_reports'
        , type = 'index'
        , fontsize.labels = 18
        , palette = '-Oranges')
#------------
# COL GRAPH
#------------
ggplot(bot_table) + aes(botname, num_of_reports) + geom_col(fill = '#0057B8') + 
  theme(legend.position = 'false') + ylab("Number of Reports") + xlab("") +
  ggtitle(paste("Number of Reports for Each Bot as of:", min(bot_table$latest_report))) +
  theme_grey()
#--------------------------------------
# MAPS
#--------------------------------------
#---------------------------------
# Point Map
#---------------------------------
get_map(location = c(30.542721, 50.447731), zoom = 11, maptype = "toner") %>% ggmap() +
  geom_point(aes(longitude,latitude, color = name), data = kyiv_points, size = 2) +
  scale_color_brewer(palette = 'Spectral', name = 'Chatbot') + scale_fill_hue(l=0) +
  theme(axis.text.x = element_blank()
        , axis.text.y = element_blank()
        , axis.line = element_blank()) +
  xlab(element_blank()) +
  ylab(element_blank())
#---------------------------------
# Density Map
#---------------------------------
get_map(location = c(30.542721, 50.447731), zoom = 11, maptype = "toner"
        , color = 'bw', darken = .7) %>% ggmap() +
  # set the parameters for the density in the plot
  stat_density2d(
    aes(longitude, latitude, fill = ..level..)
    , data = kyiv_points
    , geom = 'polygon'
    , alpha = .3
    , color = NA) +
  # change the colors
  scale_fill_gradient2("Chatbot Report Density"
                       , low = 'yellow'
                       , mid = 'orange'
                       , high = 'red') +
  # get ride of the lat/long nums
  theme(axis.text.x = element_blank()
        , axis.text.y = element_blank()
        , axis.line = element_blank()
        , legend.position = 'none') +
  # add title
  ggtitle(paste("Chatbot Reporting Density in Kyiv as of:", min(bot_table$latest_report))) +
  xlab(element_blank()) +
  ylab(element_blank())
#---------------------------------
# World Map 
#---------------------------------
map('world', fill = T, col = 'white', bg = 'lightblue', ylim = c(-60, 90),
    mar = c(0,0,0,0))
points(geo$longitude, geo$latitude, col = 'red', pch = 16, cex = .65)
