
a <- sub("No","0",df$Flightcancelled)
b <- sub("Yes","1",a)
df$Flightcancelled <- b
df$Flightcancelled<-as.numeric(df$FlightDistance)
options(scipen=999999) # To obtain a distribution of values on the axes in readable form
str(df)
LM1<-lm(Satisfaction~Age+AirlineStatus+PriceSensitivity+YearofFirstFlight+NoofFlightspa+XofFlightwithotherAirlines+TypeofTravel+NoofotherLoyaltyCards+ShoppingAmountatAirport+EatingandDrinkingatAirport+Class+DayofMonth+Flightdate+AirlineCode+ScheduledDepartureHour+DepartureDelayinMinutes+ArrivalDelayinMinutes+Flighttimeinminutes+FlightDistance+ArrivalDelaygreater5Mins,data=df)
summary(LM1)
#remove the variables with P-value > 0.05.
LM2<-lm(Satisfaction~Age+AirlineStatus+PriceSensitivity+YearofFirstFlight+NoofFlightspa+TypeofTravel+ShoppingAmountatAirport+EatingandDrinkingatAirport+Class+ScheduledDepartureHour+ArrivalDelayinMinutes,data=df)
summary(LM2)
