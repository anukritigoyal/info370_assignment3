library(dplyr)

data <- read.csv('strava_activity.csv')

# get all column names in the dataframe
names(data)

# data of interest will include athlete.sex, average_speed, distance
# for the second question we could examine exercise stats by location

# get proportion of users male or female in data
summary(data$athlete.sex)

# split dataframe by sex
data_males <- filter(data, athlete.sex == 'M')
data_females <- filter(data, athlete.sex == 'F')

# summary statistics for average speed for all observations and grouped by sex
summary(data$average_speed)
summary(data_males$average_speed)
summary(data_females$average_speed)
# median and mean average speed is higher for males than females

# summary statistics for distance for all observations and grouped by sex
summary(data$distance)
summary(data_males$distance)
summary(data_females$distance)
# median and mean distance is higher for males than females
