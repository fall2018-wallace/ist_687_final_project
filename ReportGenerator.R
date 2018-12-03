
#summary(fulldf)
fdf<-fulldf


CompOverallSat<-aggregate(fdf[, 1], list(fdf$AirlineName), mean)
CompOverallSat<-data.frame(CompOverallSat)
CompOverallSat
colnames(CompOverallSat) <- c("Airline", "AverageCustRating")

library(ggplot2)



plot1<-ggplot(CompOverallSat, aes(x=Airline, y=AverageCustRating)) + geom_bar(stat="identity") + theme(axis.text.x=element_text(angle=90,hjust=1,vjust=0.5))
