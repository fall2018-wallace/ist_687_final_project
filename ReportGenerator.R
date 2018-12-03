
#summary(fulldf)
fdf<-fulldf


CompOverallSat<-aggregate(fdf[, 1], list(fdf$AirlineName), mean)


plot1<-barplot(CompOverallSat, main="Customer Satisfaction based on Airlines", 
  	xlab="Airline", col="Blue")
