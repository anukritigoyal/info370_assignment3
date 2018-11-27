library(dplyr)

# load in data and split into data frames for male and female athletes
data <- read.csv('strava_activity.csv')

new_data <- data %>% filter(type == "Run")
new_data <- new_data %>% filter(distance > 400 & distance <= 45000) %>% 
  filter(average_speed <= 15 & average_speed > 0.1) 

data_males <- new_data %>% filter(athlete.sex == "M")

data_females <- new_data %>% filter(athlete.sex == "F")


