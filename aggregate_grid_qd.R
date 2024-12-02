library(sf)
library(tidyverse)

fpath <- "/Volumes/T9/sf_hackathon2024/GrainOpt/Hackthon_JDOPCenter_Data/Farm1_Jennewein/shp/Klostermuehle_EJ_EJ_0080-0_Un_Application_2021-04-21_00.shp"
gpath <- "/Users/yannikschermer/Documents/sf_hackathon_2024/GrainOpt/Hackthon_JDOPCenter_Data/Farm1_Jennewein/grid10x10m.gpkg"

a <- read_sf(fpath)
b <- read_sf(gpath)
#c <- st_make_grid(a)

plot(b$geom)
plot(st_geometry(a), add = TRUE)

#aggregate(a, by = b, mean, AppliedRate)

#a %>%
#  group_by(b)


#A <- st_intersection(c, b$geom)

pointsID <- st_join(a, b)

pointsID2 <- pointsID %>%
  as.data.frame() %>%
  select(Time, Product, AppliedRate, id) %>%
  group_by(id, Product) %>%
  summarise(Rate = mean(AppliedRate))

pointsID3 <- left_join(b, pointsID2, by = "id") %>%
  filter(!is.na(Rate))

ggplot(pointsID3, aes(fill = Rate))+
  geom_sf() +
  theme_minimal()
