library(dplyr)

# load in data and split into data frames for male and female athletes
data <- read.csv('strava_activity.csv')

# Data cleaning for question 1
new_data <- data %>% filter(type == "Run")
new_data <- new_data %>% filter(distance > 400 & distance <= 45000) %>% 
  filter(average_speed <= 15 & average_speed > 0.1) 

write.csv(new_data, "cleaned_data.csv")
write.csv(data_males, "data_males.csv")
write.csv(data_females, "data_females.csv")

# Data cleaning for question 2
countries_data <- data

countries_data$athlete.country <- sub("Italia", "Italy", countries_data$athlete.country)
countries_data$athlete.country <- sub("Italie", "Italy", countries_data$athlete.country)
countries_data$athlete.country <- sub("Italyn", "Italy", countries_data$athlete.country)
countries_data$athlete.country <- sub("Nederland", "Netherlands", countries_data$athlete.country)
countries_data$athlete.country <- sub("The Netherlands", "Netherlands", countries_data$athlete.country)
countries_data$athlete.country <- sub("Deutschland", "Germany", countries_data$athlete.country)
countries_data$athlete.country <- sub("Brasil", "Brazil", countries_data$athlete.country)
countries_data$athlete.country <- sub("República Federativa do Brasil", "Brazil", countries_data$athlete.country)
countries_data$athlete.country <- sub("República Federativa do Brazil", "Brazil", countries_data$athlete.country)
countries_data$athlete.country <- sub("Bélgica", "Belgium", countries_data$athlete.country)
countries_data$athlete.country <- sub("België", "Belgium", countries_data$athlete.country)
countries_data$athlete.country <- sub("Belgique", "Belgium", countries_data$athlete.country)
countries_data$athlete.country <- sub("Estados Unidos", "United States", countries_data$athlete.country)
countries_data$athlete.country <- sub("México", "Mexico", countries_data$athlete.country)
countries_data$athlete.country <- sub("Reino Unido", "United Kingdom", countries_data$athlete.country)
countries_data$athlete.country <- sub("España", "Spain", countries_data$athlete.country)
countries_data$athlete.country <- sub("Norge", "Norway", countries_data$athlete.country)
countries_data$athlete.country <- sub("Kingdom of Norway", "Norway", countries_data$athlete.country)

country_count <- countries_data %>% group_by(athlete.country) %>% summarise(count = n())
country_count <- country_count %>% filter(athlete.country != "") %>% filter(count > 100)

relevant_countries <- countries_data %>% filter(athlete.country == "United States" | athlete.country == "United Kingdom" |
                                              athlete.country == "Australia" | athlete.country == "Brazil" | athlete.country == "Netherlands" |
                                              athlete.country == "Canada" | athlete.country == "France" | athlete.country == "Spain" | 
                                              athlete.country == "Italy" | athlete.country == "Germany" | athlete.country == "Norway" |
                                              athlete.country == "South Africa")
# time less than 6 hours 
relevant_countries <- relevant_countries %>% filter(elapsed_time > 0 & elapsed_time < 21600)
relevant_countries$athlete.country <- gsub(" ", "", relevant_countries$athlete.country)

write.csv(relevant_countries, "relevant_countries.csv")
