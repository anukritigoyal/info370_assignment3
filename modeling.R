#fit_multiple <- lm(PlcmtScore ~ SATM + ACTM + Size + GPAadj, data = plcmt_data)
#summary(fit_multiple)

library(dummies)

## Modeling for question 1

sex_data <- read.csv('cleaned_data.csv')
sex_data <- cbind(sex_data, dummy(sex_data$athlete.sex))

fit_speed <- lm(average_speed ~ sex_dataF + sex_dataM, data = sex_data)
summary(fit_speed)

fit_distance <- lm(distance ~ sex_dataF + sex_dataM, data = sex_data)
summary(fit_distance)


#plot(predict(fit_distance, sex_data), sex_data$distance, main = 'Predicted vs Distance',
#     ylab = 'Actual', xlab = 'Prediction')

## Modeling for question 2

country_data <- read.csv('relevant_countries.csv')
country_data <- cbind(country_data, dummy(country_data$athlete.country))

names(country_data)
fit_country <- lm(elapsed_time ~ country_dataUnitedStates+ country_dataUnitedKingdom + country_dataAustralia + country_dataBrazil + country_dataCanada + country_dataFrance + country_dataGermany + country_dataItaly + country_dataNetherlands + country_dataNorway + country_dataSpain, data = country_data)
summary(fit_country)
