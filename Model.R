
a <- sub("No","0",df$Flightcancelled)
b <- sub("Yes","1",a)
df$Flightcancelled <- b
df$Flightcancelled<-as.numeric(df$Flightcancelled)
df$Satisfaction<-as.numeric(df$Satisfaction)
str(df$Satisfaction)
options(scipen=999999) # To obtain a distribution of values on the axes in readable form
summary(df)
LM1<-lm(Satisfaction~AirlineStatus+Age+Gender+PriceSensitivity+YearofFirstFlight+NoofFlightspa+XofFlightwithotherAirlines+TypeofTravel+NoofotherLoyaltyCards+ShoppingAmountatAirport+EatingandDrinkingatAirport+Class+DayofMonth+Flightdate+AirlineCode+ScheduledDepartureHour++Flightcancelled+DepartureDelayinMinutes+ArrivalDelayinMinutes+Flighttimeinminutes+FlightDistance+ArrivalDelaygreater5Mins,data=df)
summary(LM1)
#remove the variables with P-value > 0.05.
LM2<-lm(Satisfaction~AirlineStatus+Age+Gender+PriceSensitivity+YearofFirstFlight+NoofFlightspa+TypeofTravel+NoofotherLoyaltyCards+ShoppingAmountatAirport+Class+ScheduledDepartureHour+ArrivalDelaygreater5Mins,data=df)
summary(LM2)
