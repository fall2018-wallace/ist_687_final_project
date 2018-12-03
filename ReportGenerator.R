
summary(fulldf)


CompOverallSat<-aggregate(fulldf[, 1], list(fulldf$AirlineName), mean)
