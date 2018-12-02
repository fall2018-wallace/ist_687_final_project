

str(df)
options(scipen=999999) # To obtain a distribution of values on the axes in readable form

#linear modeling
a <- sub("No","0",df$Flightcancelled)
b <- sub("Yes","1",a)
df$Flightcancelled <- b
df$Flightcancelled<-as.numeric(df$Flightcancelled)

df$Satisfaction<- as.numeric(as.character(df$Satisfaction))
LM1<-lm(Satisfaction~AirlineStatus+Age+Gender+PriceSensitivity+YearofFirstFlight+NoofFlightspa+XofFlightwithotherAirlines+TypeofTravel+NoofotherLoyaltyCards+ShoppingAmountatAirport+EatingandDrinkingatAirport+Class+DayofMonth+Flightdate+AirlineCode+ScheduledDepartureHour++Flightcancelled+DepartureDelayinMinutes+ArrivalDelayinMinutes+Flighttimeinminutes+FlightDistance+ArrivalDelaygreater5Mins,data=df)
summary(LM1)
LM2<-lm(Satisfaction~AirlineStatus+Age+Gender+PriceSensitivity+YearofFirstFlight+NoofFlightspa+TypeofTravel+ShoppingAmountatAirport+Class+ScheduledDepartureHour+ArrivalDelaygreater5Mins,data=df)
summary(LM2)

#association rule mining 
createBuckets<- function(vec){
  q <- quantile(vec, c(0.4, 0.6))
  vBuckets <- replicate(length(vec), "Average")
  vBuckets[vec <= q[1]] <- "Low"
  vBuckets[vec > q[2]] <- "High"
  return(vBuckets)
}

satisfaction<-createBuckets(df$Satisfaction)
age<-createBuckets(df$Age)
pricesensitive<-createBuckets(df$PriceSensitivity)
yearoffirstflight<-createBuckets(df$YearofFirstFlight)
noofflightspa<-createBuckets(df$NoofFlightspa)
shoppingamount<-createBuckets(df$ShoppingAmountatAirport)
scheduleddeparturehour<-createBuckets(df$ScheduledDepartureHour)

library(arules)
library(arulesViz)
ruleDF<- data.frame(satisfaction,df$AirlineStatus,age,df$Gender,pricesensitive,yearoffirstflight,noofflightspa,df$TypeofTravel,shoppingamount,df$Class,scheduleddeparturehour,df$ArrivalDelaygreater5Mins)
hotelSurveyX <- as(ruleDF,"transactions")

itemFrequencyPlot(hotelSurveyX,support=0.1)

ruleset<- apriori(hotelSurveyX, parameter=list(support=0.1, confidence=0.5))
ruleset

goodruleset<-sort(ruleset,decreasing=TRUE,by="lift")[1,10]
inspect(goodruleset)

#svm
df$happy<-df$Satisfaction
df$happy[df$happy>=4]<-"happy"
df$happy[df$happy<4]<-"unhappy"
df1<-data.frame(df$happy,df$AirlineStatus,df$Age,df$Gender,df$PriceSensitivity,df$YearofFirstFlight,df$NoofFlightspa,df$TypeofTravel,df$ShoppingAmountatAirport,df$Class,df$ScheduledDepartureHour,df$ArrivalDelaygreater5Mins)
cutPoint2_3 <- floor(2 * dim(df1)[1]/3)
randIndex <- sample(1:dim(df1)[1])
trainData <- df1[randIndex[1:cutPoint2_3],]
testData <- df1[randIndex[(cutPoint2_3+1):dim(df1)[1]],]
dim(testData)
dim(trainData)
library(kernlab)



