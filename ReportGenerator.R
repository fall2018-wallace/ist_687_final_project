
#summary(fulldf)
fdf<-fulldf


CompOverallSat<-aggregate(fdf[, 1], list(fdf$AirlineName), mean)
CompOverallSat

library(ggplot2)



plot1<-ggplot(CompOverallSat)
