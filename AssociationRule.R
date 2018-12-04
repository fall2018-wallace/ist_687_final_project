
summary(df)
createBuckets<- function(vec){
  q <- quantile(vec, c(0.4, 0.6))
  vBuckets <- replicate(length(vec), "Average")
  vBuckets[vec <= q[1]] <- "Low"
  vBuckets[vec > q[2]] <- "High"
  return(vBuckets)
}

vBuckets<-replicate(length(df$Satisfaction),"Median")
vBuckets[df$Satisfaction>3]<-"High"
vBuckets[df$Satisfaction<3]<-"Low"

Satisfaction<-as.factor(vBuckets)

age<-createBuckets(df$Age)
pricesensitive<-createBuckets(df$PriceSensitivity)
yearoffirstflight<-createBuckets(df$YearofFirstFlight)
noofflightspa<-createBuckets(df$NoofFlightspa)
shoppingamount<-createBuckets(df$ShoppingAmountatAirport)
scheduleddeparturehour<-createBuckets(df$ScheduledDepartureHour)

library(arules)
library(arulesViz)

ruleDF<- data.frame(Satisfaction,df$AirlineStatus,age,df$Gender,pricesensitive,yearoffirstflight,noofflightspa,df$TypeofTravel,shoppingamount,df$Class,scheduleddeparturehour,df$ArrivalDelaygreater5Mins)
#ruleDF<- data.frame(Satisfaction,df$AirlineStatus,age,df$Gender,pricesensitive,yearoffirstflight,noofflightspa,df$TypeofTravel,shoppingamount,df$Class,scheduleddeparturehour,df$ArrivalDelaygreater5Mins)
hotelSurveyrule<- ruleDF#as(ruleDF,"transactions")
ruleH<- apriori(hotelSurveyrule, parameter=list(support=0.05, confidence=0.5),appearance = list(default="lhs", rhs=("Satisfaction=High")))
inspect(ruleH)
plot(ruleH)

ruleL<- apriori(hotelSurveyruleDFSE, parameter=list(support=0.01, confidence=0.9),appearance = list(default="lhs", rhs=("Satisfaction=Low")))
inspect(ruleL)
plot(ruleL)

goodrules1<-sort(ruleH,by="lift")[1:10]
inspect(goodrules1)

goodrules2<-sort(ruleL,by="lift")[1:10]
inspect(goodrules2)
