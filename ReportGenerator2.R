
#Plotting number of customers 
summary(df)

CompOverallSat<-aggregate(fdf[, 1], list(fdf$AirlineName), count)
