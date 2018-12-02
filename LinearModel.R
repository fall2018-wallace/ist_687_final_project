
summary(df)

#Linear regression model will all the variables included in the entire dataset
#Used the p value to cut out variables that are of no statistical value to further analysis

LM1<-lm(Satisfaction~AirlineStatus+Age+Gender+PriceSensitivity+YearofFirstFlight+NoofFlightspa+XofFlightwithotherAirlines+TypeofTravel+NoofotherLoyaltyCards+ShoppingAmountatAirport+EatingandDrinkingatAirport+Class+DayofMonth+Flightdate+AirlineCode+ScheduledDepartureHour++Flightcancelled+DepartureDelayinMinutes+ArrivalDelayinMinutes+Flighttimeinminutes+FlightDistance+ArrivalDelaygreater5Mins,data=df)
summary(LM1)

#Linear regression model with only the variables that happen to be statistically significant
LM2<-lm(Satisfaction~AirlineStatus+Age+Gender+PriceSensitivity+YearofFirstFlight+NoofFlightspa+TypeofTravel+ShoppingAmountatAirport+Class+ScheduledDepartureHour+ArrivalDelaygreater5Mins,data=df)
summary(LM2)

#Below are Single linear regression models with only one variable with statistical significance
LMAirlineStatus<-lm(Satisfaction~AirlineStatus,data=df)
summary(LMAirlineStatus)


LMAge<-lm(Satisfaction~Age,data=df)
summary(LMAge)

LMGender<-lm(Satisfaction~Gender,data=df)
summary(LMGender)

LMPriceSensitivity<-lm(Satisfaction~PriceSensitivitys,data=df)
summary(LMPriceSensitivity)

LMFirstFlight<-lm(Satisfaction~YearofFirstFlight,data=df)
summary(LMFirstFlight)

