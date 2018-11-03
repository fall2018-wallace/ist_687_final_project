

str(df)
options(scipen=999999) # To obtain a distribution of values on the axes in readable form
a<-sub("yes","1",df$ArrivalDelaygreater5Mins)
b<-sub("no","0",a)
df$ArrivalDelaygreater5Mins<-b
df$ArrivalDelaygreater5Mins<-as.numeric(df$ArrivalDelaygreater5Mins)
df$ArrivalDelaygreater5Mins
LM1<-lm(Satisfaction~Age+AirlineStatus+PriceSensitivity+YearofFirstFlight+NoofFlightspa+XofFlightwithotherAirlines+TypeofTravel+NoofotherLoyaltyCards+ShoppingAmountatAirport+EatingandDrinkingatAirport+Class+DayofMonth+Flightdate+AirlineCode+ScheduledDepartureHour+DepartureDelayinMinutes+ArrivalDelayinMinutes+Flightcancelled+Flighttimeinminutes+FlightDistance+ArrivalDelaygreater5Mins,data=df)
summary(LM1)
#remove the variables with P-value > 0.05.
LM2<-lm(Satisfaction~Age+AirlineStatus+PriceSensitivity+YearofFirstFlight+NoofFlightspa+TypeofTravel+ShoppingAmountatAirport+EatingandDrinkingatAirport+Class+ScheduledDepartureHour+ArrivalDelayinMinutes,data=df)

