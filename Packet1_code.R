# This command installs the 'openintro' package, which contains the data sets
# used in OpenIntro textbooks. The package only needs to be installed once.
install.packages("openintro")

# 

# The library command loads the package, it will need to be run each time
# you start a new R session.
library(openintro)
library(tidyverse)


dim(county)
str(county)
summary(county)
colnames(county)
head(county)
tail(county)
glimpse(county)

ggplot(data = county) + 
  geom_point(mapping = aes(x = multi_unit, y = homeownership)) +
  labs(subtitle = "Percentage of units in multi-unit structures vs. Homeownership",
       y = "Homeownership",
       x = "Percentage of units in multi-unit structures",
       title = "My First Scatterplot",
       caption = "Source: county dataset"
  )

arrange(county,desc(multi_unit))
filter(county,multi_unit>95)

county %>% arrange(desc(multi_unit))

county_alt <- county %>% 
  mutate(pop_change_2000 = (pop2017 - pop2000) / pop2000 * 100)


ggplot(data = county_alt) + 
    scale_color_brewer(palette="Dark2") +
  #  scale_color_manual(values=c("red", "blue")) +
  geom_point(mapping = aes(x = median_hh_income, y = pop_change_2000, color=metro)) +
  geom_smooth(mapping = aes(x = median_hh_income, y = pop_change_2000), color="forestgreen") +
  labs(subtitle = "Median Income vs Population Change from 2000 to 2017",
       y = "Population Change from 2000 to 2017",
       x = "Median Income in 2017",
       title = "My second Scatterplot",
       caption = "Source: county dataset"
  )

county_alt %>% na.omit() %>%
  ggplot() +
  geom_boxplot(mapping = aes(x = pop_change_2000, y = metro))

world_coordinates <- map_data("world")
climate70 %>% ggplot(aes(x = longitude, y = latitude)) +
  geom_map(
    data = world_coordinates, map = world_coordinates,
    aes(long, lat, map_id = region)
  ) +
  geom_point(color="red")




county_ca <- county %>% 
  filter(state == "California") %>% 
  arrange(desc(pop2017))

climate70 %>% filter(longitude > 0) %>% 
  ggplot(aes(x = longitude, y = latitude)) +
  geom_map(
    data = world_coordinates, map = world_coordinates,
    aes(long, lat, map_id = region)
  ) +
  geom_point(color="red")

climate70 %>% filter(longitude > 0) %>%
  ggplot(aes(x = dx70_2018)) +
  geom_histogram(color = "black",fill = "forestgreen",binwidth = 100)




county_alt <- county %>% 
  mutate(pop_change_2000 = (pop2017 - pop2000) / pop2000 * 100)


ggplot(data = county_alt) + 
  scale_color_brewer(palette="Set1") +
  geom_point(mapping = aes(x = poverty, y = pop_change_2000, color = metro)) +
  geom_smooth(mapping = aes(x = poverty, y = pop_change_2000), color="forestgreen") +
  labs(subtitle = "Poverty vs Population Change from 2000 to 2017",
       y = "Population Change from 2000 to 2017",
       x = "Poverty in 2017",
       title = "My second Scatterplot",
       caption = "Source: county dataset"
  )

