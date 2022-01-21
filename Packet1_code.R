# This command installs the 'openintro' package, which contains the data sets
# used in OpenIntro textbooks. The package only needs to be installed once.
install.packages("openintro")

# 

# The library command loads the package, it will need to be run each time
# you start a new R session.
library(openintro)


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
