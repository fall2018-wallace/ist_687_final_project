
#summary(fulldf)
fdf<-fulldf


CompOverallSat<-aggregate(fdf[, 1], list(fdf$AirlineName), mean)
CompOverallSat<-data.frame(CompOverallSat)
CompOverallSat
colnames(CompOverallSat) <- c("Airline", "AverageCustRating")

library(ggplot2)



plot1<-ggplot(CompOverallSat)
