library(dplyr)

# load in data and split into data frames for male and female athletes
data <- read.csv('strava_activity.csv')
data_males <- filter(data, athlete.sex == 'M')
data_females <- filter(data, athlete.sex == 'F')

write.csv(data_males, file = 'male_activity.csv')
write.csv(data_females, file = 'female_activity.csv')