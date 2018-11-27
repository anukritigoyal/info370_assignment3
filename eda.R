library(dplyr)
library(ggplot2)

data <- read.csv('strava_activity.csv')

# get all column names in the dataframe
names(data)

# data of interest will include athlete.sex, average_speed, distance
# for the second question we will examine elapsed_time and athlete.country

#### EDA for the first Question

# get proportion of users male or female in data
summary(data$athlete.sex)

# split dataframe by sex
data_males <- filter(data, athlete.sex == 'M')
data_females <- filter(data, athlete.sex == 'F')

length(data_males$average_speed) # amount of males
length(data_females$average_speed) # amount of females

# summary statistics for average speed for all observations and grouped by sex
summary(data$average_speed)
summary(data_males$average_speed)
summary(data_females$average_speed)
# median and mean average speed is higher for males than females

speed_small <- filter(data, average_speed < 20)
speed_males_small <- filter(speed_small, athlete.sex == 'M')
speed_females_small <- filter(speed_small, athlete.sex == 'F')


# histogram for average speed of all observations
ggplot(data = data) +
  stat_bin(mapping = aes(x = average_speed)) +
  labs(
    title = 'Distribution of Average Speed', 
    x = 'Speed (M/S)', 
    y = 'Frequency'
  )

# graph showing the distribution of average speeds for all instances under
# 20 meters per second for all data, men, and women
ggplot() +
  geom_freqpoly(data = speed_small, mapping = aes(x = average_speed, color = 'black')) +
  geom_freqpoly(data = speed_males_small, mapping = aes(x = average_speed, color = 'blue')) +
  geom_freqpoly(data = speed_females_small, mapping = aes(x = average_speed, color = 'red')) +
  scale_colour_manual(name = 'Sex', 
                      values =c('black'='black','blue'='blue', 'red'='red'),
                      labels = c('All','Male','Female')) +
  labs(
    title = 'Distribution of Average Speeds by Sex',
    x = 'Average Speed (M/S)',
    y = 'Frequency'
  )

# summary statistics for distance for all observations and grouped by sex
summary(data$distance)
summary(data_males$distance)
summary(data_females$distance)
# median and mean distance is higher for males than females

# filter data to distance under 100000
dist_small <- filter(data, distance < 100000)
dist_males_small <- filter(dist_small, athlete.sex == 'M')
dist_females_small <- filter(dist_small, athlete.sex == 'F')

# histogram of all distance observations
ggplot(data = data) +
  stat_bin(mapping = aes(x = distance)) +
  labs(
    title = 'Distribution of Exercise Distance', 
    x = 'Distance (Meters)', 
    y = 'Frequency'
  )

# graph showing the distribution of distance for all instances under 100000 meters
# for all, men, and women
ggplot() +
  geom_freqpoly(data = dist_small, mapping = aes(x = distance, color = 'black')) +
  geom_freqpoly(data = dist_males_small, mapping = aes(x = distance, color = 'blue')) +
  geom_freqpoly(data = dist_females_small, mapping = aes(x = distance, color = 'red')) +
  scale_colour_manual(name = 'Sex', 
                      values =c('black'='black','blue'='blue', 'red'='red'),
                      labels = c('All','Male','Female')) +
  labs(
    title = 'Distribution of Distance by Sex',
    x = 'Distance (Meters)',
    y = 'Frequency'
  )

##### EDA for the Second Quesiton

# Examining columns athlete.country and elapsed_time

# all country values in the data and values for each
summary(data$athlete.country)

# number of unique observations for athlete countries
length(unique(data$athlete.country))

# summary of elapsed time observations. Time is measured in seconds
summary(data$elapsed_time)

ggplot(data = data) +
  stat_bin(mapping = aes(x = elapsed_time)) +
  labs(
    title = 'Distribution of Elapsed Time', 
    x = 'Elapsed Time (Seconds)', 
    y = 'Frequency'
  )

# observations with an elapsed_time under 6 hours
# there are 21600 seconds in 6 hours
time_small = filter(data, elapsed_time < 21600)
# plot the distribution of time for under 6 hours
ggplot(data = time_small) +
  stat_bin(mapping = aes(x = elapsed_time)) +
  labs(
    title = 'Distribution of Elapsed Time', 
    x = 'Elapsed Time (Seconds)',
    y = 'Frequency'
  )

# examine summary statistics for elapsed time for the US, the UK, and Brazil
summary(filter(data, athlete.country == 'United States')$elapsed_time)
summary(filter(data, athlete.country == 'United Kingdom')$elapsed_time)
summary(filter(data, athlete.country == 'Brazil')$elapsed_time)
