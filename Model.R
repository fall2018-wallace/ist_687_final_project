
str(df)
options(scipen=999999) # To obtain a distribution of values on the axes in readable form
df$Satisfaction<-as.numeric(df$Satisfaction)
a<-sub("Yes","1",df$Flightcancelled)
b<-sub("No","0",a)
df$Flightcancelled<-b
LM1<-lm(Satisfaction~Age+AirlineStatus+PriceSensitivity+YearofFirstFlight+NoofFlightspa+XofFlightwithotherAirlines+TypeofTravel+NoofotherLoyaltyCards+ShoppingAmountatAirport+EatingandDrinkingatAirport+Class+DayofMonth+Flightdate+AirlineCode+ScheduledDepartureHour+DepartureDelayinMinutes+ArrivalDelayinMinutes+Flightcancelled+Flighttimeinminutes+FlightDistance+ArrivalDelaygreater5Mins,data=df)
summary(LM1)
#remove the variables with P-value > 0.05.

LM2<-lm(Satisfaction~Age+AirlineStatus+PriceSensitivity+YearofFirstFlight+NoofFlightspa+TypeofTravel+ShoppingAmountatAirport+EatingandDrinkingatAirport+Class+ScheduledDepartureHour+ArrivalDelayinMinutes,data=df)

