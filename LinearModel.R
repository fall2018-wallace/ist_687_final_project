
str(df)

#Business Approach: --> For Anant
# For the first model (LM1) we included all the variables for the entire data set and based on the p value identified which variables are statistically significant
# The second model (LM2) represents a linear regression model with only the variables that we observed to be statistically significant from model 1
# In model 2 (lm2), there are 11 variables that are stastifically signifcant and have an impact on the overall customer Satisfaction
# Because 11 variables is still a lot and we do not know which of the variables actually have the greatest impact on customers satsifaction, we decided to run single linear regression models and compare the s-quares of these  models
# Based on the single linear regression models, we noticed that type of travel and airline status have the greatest predicting power/impact on customer Satisfaction
# Conclusion: There are 11 variables that are statistically significant. Those variables are included in linear model 2 (LM2).
# While all of these 11 variables are statistically significant, their impact on customer satisfaction is of different strength. We identified type of travel and airline status as the key drivers for customer satisfaction

#Linear regression model will all the variables included in the entire dataset
#Used the p value to cut out variables that are of no statistical value to further analysis

LM1<-lm(Satisfaction~AirlineStatus+Age+Gender+PriceSensitivity+YearofFirstFlight+NoofFlightspa+XofFlightwithotherAirlines+TypeofTravel+NoofotherLoyaltyCards+ShoppingAmountatAirport+EatingandDrinkingatAirport+Class+DayofMonth+Flightdate+AirlineCode+ScheduledDepartureHour++Flightcancelled+DepartureDelayinMinutes+ArrivalDelayinMinutes+Flighttimeinminutes+FlightDistance+ArrivalDelaygreater5Mins,data=df)
summary(LM1)

#Linear regression model with only the variables that happen to be statistically significant
LM2<-lm(Satisfaction~AirlineStatus+Age+Gender+PriceSensitivity+YearofFirstFlight+NoofFlightspa+TypeofTravel+ShoppingAmountatAirport+Class+ScheduledDepartureHour+ArrivalDelaygreater5Mins,data=df)
summary(LM2)
plotLM2 <- plot(lm2)

#Below are Single linear regression models with only one variable with statistical significance
#Linear Model with Airline Status as predictor
LMAirlineStatus<-lm(Satisfaction~AirlineStatus,data=df)
summary(LMAirlineStatus)

#Linear Model with Age as predictor
LMAge<-lm(Satisfaction~Age,data=df)
summary(LMAge)

#Linear Model with Gender as predictor
LMGender<-lm(Satisfaction~Gender,data=df)
summary(LMGender)

#Linear Model with Price Sensitivity as predictor
LMPriceSensitivity<-lm(Satisfaction~PriceSensitivity,data=df)
summary(LMPriceSensitivity)

#Linear Model with Airline Status Year of first flight as predictor
LMFirstFlight<-lm(Satisfaction~YearofFirstFlight,data=df)
summary(LMFirstFlight)

