
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

nrow(CleanSatisfaction)
omitted<-na.omit(CleanSatisfaction)
nrow(CleanSatisfaction)-nrow(omitted)

#df<-read.table(choose.files(),header = T,sep = ",")
#head(is.na(df),n = 129886)
CleanSatisfaction<-na.omit(CleanSatisfaction)#Remove rows that contain missing data.
colnames(CleanSatisfaction)<-gsub(" ", "", colnames(CleanSatisfaction))
df<-CleanSatisfaction
str(df)
LM1<-lm(Satisfaction~AirlineStatus+Age+Gender+PriceSensitivity+YearofFirstFlight+NoofFlightsp.a.+ofFlightwithotherAirlines+TypeofTravel+NumofotherLoyaltyCards+ShoppingAmountatAirport+EatingandDrinkingatAirport+Class+DayofMonth+Flightdate+AirlineCode+ScheduledDepartureHour+DepartureDelayinMinutes+ArrivalDelayinMinutes+Flightcancelled1+Flighttimeinminutes+FlightDistance+ArrivalDelaygreater5Mins,data=df)
summary(LM1)
#remove the variables with P-value > 0.05. 
LM2<-lm(Satisfaction~AirlineStatus+Age+Gender+PriceSensitivity+YearofFirstFlight+NoofFlightsp.a.+TypeofTravel+ShoppingAmountatAirport+EatingandDrinkingatAirport+Class+ScheduledDepartureHour+ArrivalDelaygreater5Mins,data=df)
summary(LM2)
#At every step, remove one predictor and see what happens to R-squared adjusted. Remove the predictor completely if R-squared adjusted goes up,keep the predictor if R-squared adjusted goes down.
LM3<-lm(Satisfaction~AirlineStatus+Age+Gender+PriceSensitivity+YearofFirstFlight+NoofFlightsp.a.+TypeofTravel+ShoppingAmountatAirport+EatingandDrinkingatAirport+Class+ScheduledDepartureHour,data=df)
summary(LM3)
LM4<-lm(Satisfaction~AirlineStatus+Age+Gender+PriceSensitivity+YearofFirstFlight+NoofFlightsp.a.+TypeofTravel+ShoppingAmountatAirport+EatingandDrinkingatAirport+Class+                       ArrivalDelaygreater5Mins,data=df)
summary(LM4)
LM5<-lm(Satisfaction~AirlineStatus+Age+Gender+PriceSensitivity+YearofFirstFlight+NoofFlightsp.a.+TypeofTravel+ShoppingAmountatAirport+EatingandDrinkingatAirport+      ScheduledDepartureHour+ArrivalDelaygreater5Mins,data=df)
summary(LM5)
LM6<-lm(Satisfaction~AirlineStatus+Age+Gender+PriceSensitivity+YearofFirstFlight+NoofFlightsp.a.+TypeofTravel+ShoppingAmountatAirport+                           Class+ScheduledDepartureHour+ArrivalDelaygreater5Mins,data=df)
summary(LM6)
LM7<-lm(Satisfaction~AirlineStatus+Age+Gender+PriceSensitivity+YearofFirstFlight+NoofFlightsp.a.+TypeofTravel+                        EatingandDrinkingatAirport+Class+ScheduledDepartureHour+ArrivalDelaygreater5Mins,data=df)
summary(LM7)
LM8<-lm(Satisfaction~AirlineStatus+Age+Gender+PriceSensitivity+YearofFirstFlight+NoofFlightsp.a.+             ShoppingAmountatAirport+EatingandDrinkingatAirport+Class+ScheduledDepartureHour+ArrivalDelaygreater5Mins,data=df)
summary(LM8)
LM9<-lm(Satisfaction~AirlineStatus+Age+Gender+PriceSensitivity+YearofFirstFlight                +TypeofTravel+ShoppingAmountatAirport+EatingandDrinkingatAirport+Class+ScheduledDepartureHour+ArrivalDelaygreater5Mins,data=df)
summary(LM9)
LM10<-lm(Satisfaction~AirlineStatus+Age+Gender+PriceSensitivity                 +NoofFlightsp.a.+TypeofTravel+ShoppingAmountatAirport+EatingandDrinkingatAirport+Class+ScheduledDepartureHour+ArrivalDelaygreater5Mins,data=df)
summary(LM10)
LM11<-lm(Satisfaction~AirlineStatus+Age+Gender                +YearofFirstFlight+NoofFlightsp.a.+TypeofTravel+ShoppingAmountatAirport+EatingandDrinkingatAirport+Class+ScheduledDepartureHour+ArrivalDelaygreater5Mins,data=df)
summary(LM11)
LM12<-lm(Satisfaction~AirlineStatus+Age       +PriceSensitivity+YearofFirstFlight+NoofFlightsp.a.+TypeofTravel+ShoppingAmountatAirport+EatingandDrinkingatAirport+Class+ScheduledDepartureHour+ArrivalDelaygreater5Mins,data=df)
summary(LM12)
LM13<-lm(Satisfaction~AirlineStatus    +Gender+PriceSensitivity+YearofFirstFlight+NoofFlightsp.a.+TypeofTravel+ShoppingAmountatAirport+EatingandDrinkingatAirport+Class+ScheduledDepartureHour+ArrivalDelaygreater5Mins,data=df)
summary(LM13)
LM14<-lm(Satisfaction~AirlineStatus+Age+Gender+PriceSensitivity+YearofFirstFlight+NoofFlightsp.a.+TypeofTravel+ShoppingAmountatAirport+EatingandDrinkingatAirport+Class+ScheduledDepartureHour+ArrivalDelaygreater5Mins,data=df)
summary(LM14)
LM15<-lm(Satisfaction~               Age+Gender+PriceSensitivity+YearofFirstFlight+NoofFlightsp.a.+TypeofTravel+ShoppingAmountatAirport+EatingandDrinkingatAirport+Class+ScheduledDepartureHour+ArrivalDelaygreater5Mins,data=df)
summary(LM15)  
#We keep AirlineStatus+Age+Gender+PriceSensitivity+YearofFirstFlight+NoofFlightsp.a.+TypeofTravel+ShoppingAmountatAirport+EatingandDrinkingatAirport+Class+ScheduledDepartureHour+ArrivalDelaygreater5Mins in the end.
#Here is a problem. When we summary(LM1), we can see the coefficient of Flightcancelled1 is NA, which indicates that this variable is linearly related to the other variables. For instance, the effect of flight cancelled on customer satisfaction is differ for differen type of travel. I cannot fix it now and maybe we can discuss about it when we meet up.





