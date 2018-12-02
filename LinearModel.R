
summary(df)

#Business Approach: --> For Anant
# For the first model (LM1) we included all the variables for the entire data set and based on the p value that are statistically significant
# The second model (LM2) represents a linear regression model with only the variables that we observed to be statistically significant from model 1
# In model 2 (lm2), there are 11 variables that are stastifically signifcant and have an impact on the overall customer Satisfaction
# Because the 11 variables is still a lot and we do not know which of the variables actually has the greatest impact on the customers satsifaction, we decided to run single linear regression models and compare the s-quares of these  models

#Linear regression model will all the variables included in the entire dataset
#Used the p value to cut out variables that are of no statistical value to further analysis

LM1<-lm(Satisfaction~AirlineStatus+Age+Gender+PriceSensitivity+YearofFirstFlight+NoofFlightspa+XofFlightwithotherAirlines+TypeofTravel+NoofotherLoyaltyCards+ShoppingAmountatAirport+EatingandDrinkingatAirport+Class+DayofMonth+Flightdate+AirlineCode+ScheduledDepartureHour++Flightcancelled+DepartureDelayinMinutes+ArrivalDelayinMinutes+Flighttimeinminutes+FlightDistance+ArrivalDelaygreater5Mins,data=df)
summary(LM1)

#Linear regression model with only the variables that happen to be statistically significant
LM2<-lm(Satisfaction~AirlineStatus+Age+Gender+PriceSensitivity+YearofFirstFlight+NoofFlightspa+TypeofTravel+ShoppingAmountatAirport+Class+ScheduledDepartureHour+ArrivalDelaygreater5Mins,data=df)
summary(LM2)

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
LMPriceSensitivity<-lm(Satisfaction~PriceSensitivitys,data=df)
summary(LMPriceSensitivity)

#Linear Model with Airline Status Year of first flight as predictor
LMFirstFlight<-lm(Satisfaction~YearofFirstFlight,data=df)
summary(LMFirstFlight)

