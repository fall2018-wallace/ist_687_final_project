
# Association Rule Mining #


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
hotelSurveyX<-as(ruleDF,"transactions")

ruleset<- apriori(hotelSurveyX, parameter=list(support=0.1, confidence=0.5),appearance = list(default="lhs", rhs=("Satisfaction=High")))
inspect(ruleset)
