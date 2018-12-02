
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

#Below are Single linear regression models with only one variable with statistical significance
#Linear Model with No of Flights p.a. as predictor
LMNoofFlightspa<-lm(Satisfaction~NoofFlightspa,data=df)
summary(LMNoofFlightspa)
#Adjusted R-squared:  0.05671105

#Linear Model with Type of Travel as predictor
LMTypeofTravel<-lm(Satisfaction~TypeofTravel,data=df)
summary(LMTypeofTravel)
#Adjusted R-squared:  0.3350338

#Linear Model with Shopping Amount at Airport as predictor
LMShoppingAmountatAirport<-lm(Satisfaction~ShoppingAmountatAirport,data=df)
summary(LMShoppingAmountatAirport)
#0.0002999279 

#Linear Model with Class as predictor
LMClass<-lm(Satisfaction~Class,data=df)
summary(LMClass)
#0.002526544

#Linear Model with ScheduledDepartureHour as predictor
LMScheduledDepartureHour<-lm(Satisfaction~ScheduledDepartureHour,data=df)
summary(LMScheduledDepartureHour)
#-6.981177e-06
LM5<-lm(Satisfaction~ArrivalDelaygreater5Mins,data=df)
summary(LM5)
#0.02528861
#Linear Model with Airline Status as predictor
LMAirlineStatus<-lm(Satisfaction~AirlineStatus,data=df)
summary(LMAirlineStatus)
#0.1184333 
#Linear Model with Age as predictor
LMAge<-lm(Satisfaction~Age,data=df)
summary(LMAge)
#0.0492023
#Linear Model with Gender as predictor
LMGender<-lm(Satisfaction~Gender,data=df)
summary(LMGender)
#0.01760919 
#Linear Model with Price Sensitivity as predictor
LMPriceSensitivity<-lm(Satisfaction~PriceSensitivity,data=df)
summary(LMPriceSensitivity)
#0.007641272 
#Linear Model with Airline Status Year of first flight as predictor
LMFirstFlight<-lm(Satisfaction~YearofFirstFlight,data=df)
summary(LMFirstFlight)
#5.270168e-05 

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

