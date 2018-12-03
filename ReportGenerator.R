
summary(fulldf)


CompOverallSat<-aggregate(fulldf[, 1], list(fulldf$AirlineName), mean)


plot1<-barplot(CompOverallSat, main="Customer Satisfaction based on Airlines", 
  	xlab="Airline", col="Blue")
