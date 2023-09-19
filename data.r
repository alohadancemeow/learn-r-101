# data transformation / data viz 101

install.packages(c('ggplot2', 'dplyr'))
library(ggplot2)
library(dplyr)

# dplyr
select(mtcars, 1:3, 5, 11)
select(mtcars, mpg, am, hp, wt)

# rename
select(mtcars, 
       mile_per_gallon = mpg,
       auto_manual = am,
       horse_power = hp,
       weight = wt
       )


# pipe operator -> %>%
df <- mtcars %>%
  # step 1 : select columns
  select(mile_per_gallon = mpg,
         auto_manual = am,
         horse_power = hp,
         weight = wt) %>%
  # step 2: filter row
  filter(mile_per_gallon <= 15) %>%
  # step 3: sort hp
  arrange(desc(horse_power))
  

# data visualization
hist(mtcars$hp) # --> histogram
plot(mtcars$hp, mtcars$mpg, pch=16, col='red')

# modern graphics
ggplot(mtcars, aes(hp, mpg)) + 
  geom_point() + 
  geom_smooth() +
  geom_rug() +
  theme_minimal() +
  labs(title = 'mtcars')


# k-means clustering
iris
dim(iris) # --> 150   5

Species <- iris$Species
iris_data <- iris %>% select(-Species)
dim(iris_data) # --> 150   4 :delete Species

km_result <- kmeans(iris_data, 3)
cluster_membership <- km_result$cluster
table(cluster_membership)

# cross check
table(Species, cluster_membership)



