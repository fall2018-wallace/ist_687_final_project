
str(raw_data)


CleanSatisfaction<-raw_data[(raw_data$Satisfaction=="1" | 
            raw_data$Satisfaction=="1.5" |
            raw_data$Satisfaction=="2" |
            raw_data$Satisfaction=="2.5" |
            raw_data$Satisfaction=="3" |
            raw_data$Satisfaction=="3.5" |
            raw_data$Satisfaction=="4" |
            raw_data$Satisfaction=="4.5" |
            raw_data$Satisfaction=="5" ),]
#clean_data <- subset(raw_data,trimws(raw_data$Satisfaction)==c(1:5))
#clean_data
df<-CleanSatisfaction
newCol<-colnames(CleanSatisfaction)
newCol<-gsub("\\.", "", newCol)
newCol
colnames(df)<-newCol


a <- sub("No","0",df$Flightcancelled)
b <- sub("Yes","1",a)
df$Flightcancelled <- b
df$Flightcancelled<-as.numeric(df$Flightcancelled)


m <- mode(df$Age)

df$Satisfaction<- as.numeric(as.character(df$Satisfaction))
LM1<-lm(Satisfaction~AirlineStatus+Age+Gender+PriceSensitivity+YearofFirstFlight+NoofFlightspa+XofFlightwithotherAirlines+TypeofTravel+NoofotherLoyaltyCards+ShoppingAmountatAirport+EatingandDrinkingatAirport+Class+DayofMonth+Flightdate+AirlineCode+ScheduledDepartureHour++Flightcancelled+DepartureDelayinMinutes+ArrivalDelayinMinutes+Flighttimeinminutes+FlightDistance+ArrivalDelaygreater5Mins,data=df)
summary(LM1)

