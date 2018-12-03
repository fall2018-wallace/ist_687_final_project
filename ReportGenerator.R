
#summary(fulldf)
fdf<-fulldf


CompOverallSat<-aggregate(fdf[, 1], list(fdf$AirlineName), mean)


plot1<-barplot(CompOverallSat)
