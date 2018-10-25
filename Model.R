
colnames(CleanSatisfaction)<-gsub(" ", "", colnames(CleanSatisfaction))
colnames(CleanSatisfaction)<-gsub("\\.", "", colnames(CleanSatisfaction))
df<-CleanSatisfaction
str(df)
LM1<-lm(Satisfaction~AirlineStatus+Age+Gender+PriceSensitivity+YearofFirstFlight+NoofFlightspa+NoofFlightwithotherAirlines+TypeofTravel+NumofotherLoyaltyCards+ShoppingAmountatAirport+EatingandDrinkingatAirport+Class+DayofMonth+Flightdate+AirlineCode+ScheduledDepartureHour+DepartureDelayinMinutes+ArrivalDelayinMinutes+Flightcancelled1+Flighttimeinminutes+FlightDistance+ArrivalDelaygreater5Mins,data=df)
summary(LM1)
#remove the variables with P-value > 0.05. 
LM2<-lm(Satisfaction~AirlineStatus+Age+Gender+PriceSensitivity+YearofFirstFlight+NoofFlightspa+TypeofTravel+ShoppingAmountatAirport+EatingandDrinkingatAirport+Class+ScheduledDepartureHour+ArrivalDelaygreater5Mins,data=df)
summary(LM2)
#At every step, remove one predictor and see what happens to R-squared adjusted. Remove the predictor completely if R-squared adjusted goes up,keep the predictor if R-squared adjusted goes down.
LM3<-lm(Satisfaction~AirlineStatus+Age+Gender+PriceSensitivity+YearofFirstFlight+NoofFlightspa+TypeofTravel+ShoppingAmountatAirport+EatingandDrinkingatAirport+Class+ScheduledDepartureHour,data=df)
summary(LM3)
LM4<-lm(Satisfaction~AirlineStatus+Age+Gender+PriceSensitivity+YearofFirstFlight+NoofFlightspa+TypeofTravel+ShoppingAmountatAirport+EatingandDrinkingatAirport+Class+                       ArrivalDelaygreater5Mins,data=df)
summary(LM4)
LM5<-lm(Satisfaction~AirlineStatus+Age+Gender+PriceSensitivity+YearofFirstFlight+NoofFlightspa+TypeofTravel+ShoppingAmountatAirport+EatingandDrinkingatAirport+      ScheduledDepartureHour+ArrivalDelaygreater5Mins,data=df)
summary(LM5)
LM6<-lm(Satisfaction~AirlineStatus+Age+Gender+PriceSensitivity+YearofFirstFlight+NoofFlightspa+TypeofTravel+ShoppingAmountatAirport+                           Class+ScheduledDepartureHour+ArrivalDelaygreater5Mins,data=df)
summary(LM6)
LM7<-lm(Satisfaction~AirlineStatus+Age+Gender+PriceSensitivity+YearofFirstFlight+NoofFlightspa+TypeofTravel+                        EatingandDrinkingatAirport+Class+ScheduledDepartureHour+ArrivalDelaygreater5Mins,data=df)
summary(LM7)
LM8<-lm(Satisfaction~AirlineStatus+Age+Gender+PriceSensitivity+YearofFirstFlight+NoofFlightspa+             ShoppingAmountatAirport+EatingandDrinkingatAirport+Class+ScheduledDepartureHour+ArrivalDelaygreater5Mins,data=df)
summary(LM8)
LM9<-lm(Satisfaction~AirlineStatus+Age+Gender+PriceSensitivity+YearofFirstFlight                +TypeofTravel+ShoppingAmountatAirport+EatingandDrinkingatAirport+Class+ScheduledDepartureHour+ArrivalDelaygreater5Mins,data=df)
summary(LM9)
LM10<-lm(Satisfaction~AirlineStatus+Age+Gender+PriceSensitivity                 +NoofFlightspa+TypeofTravel+ShoppingAmountatAirport+EatingandDrinkingatAirport+Class+ScheduledDepartureHour+ArrivalDelaygreater5Mins,data=df)
summary(LM10)
LM11<-lm(Satisfaction~AirlineStatus+Age+Gender                +YearofFirstFlight+NoofFlightspa+TypeofTravel+ShoppingAmountatAirport+EatingandDrinkingatAirport+Class+ScheduledDepartureHour+ArrivalDelaygreater5Mins,data=df)
summary(LM11)
LM12<-lm(Satisfaction~AirlineStatus+Age       +PriceSensitivity+YearofFirstFlight+NoofFlightspa+TypeofTravel+ShoppingAmountatAirport+EatingandDrinkingatAirport+Class+ScheduledDepartureHour+ArrivalDelaygreater5Mins,data=df)
summary(LM12)
LM13<-lm(Satisfaction~AirlineStatus    +Gender+PriceSensitivity+YearofFirstFlight+NoofFlightspa+TypeofTravel+ShoppingAmountatAirport+EatingandDrinkingatAirport+Class+ScheduledDepartureHour+ArrivalDelaygreater5Mins,data=df)
summary(LM13)
LM14<-lm(Satisfaction~AirlineStatus+Age+Gender+PriceSensitivity+YearofFirstFlight+NoofFlightspa+TypeofTravel+ShoppingAmountatAirport+EatingandDrinkingatAirport+Class+ScheduledDepartureHour+ArrivalDelaygreater5Mins,data=df)
summary(LM14)
LM15<-lm(Satisfaction~               Age+Gender+PriceSensitivity+YearofFirstFlight+NoofFlightspa+TypeofTravel+ShoppingAmountatAirport+EatingandDrinkingatAirport+Class+ScheduledDepartureHour+ArrivalDelaygreater5Mins,data=df)
summary(LM15)  
#We keep AirlineStatus+Age+Gender+PriceSensitivity+YearofFirstFlight+NoofFlightsp.a.+TypeofTravel+ShoppingAmountatAirport+EatingandDrinkingatAirport+Class+ScheduledDepartureHour+ArrivalDelaygreater5Mins in the end.
#Here is a problem. When we summary(LM1), we can see the coefficient of Flightcancelled1 is NA, which indicates that this variable is linearly related to the other variables. For instance, the effect of flight cancelled on customer satisfaction is differ for differen type of travel. I cannot fix it now and maybe we can discuss about it when we meet up.






