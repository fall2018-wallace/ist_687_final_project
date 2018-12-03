
#summary(fulldf)
fdf<-fulldf


CompOverallSat<-aggregate(fdf[, 1], list(fdf$AirlineName), mean)
CompOverallSat<-data.frame(CompOverallSat)
colnames(CompOverallSat) <- c("good", "better")

library(ggplot2)



plot1<-ggplot(CompOverallSat)
