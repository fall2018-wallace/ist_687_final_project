
#summary(fulldf)
fdf<-fulldf


CompOverallSat<-aggregate(fdf[, 1], list(fdf$AirlineName), mean)
CompOverallSat

plot1<-barplot(CompOverallSat)
