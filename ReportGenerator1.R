
#summary(fulldf)
fdf<-fulldf
#fulldf$AirlineName

# plotting var charts
CompOverallSat<-aggregate(fdf[, 1], list(fdf$AirlineName), mean)
CompOverallSat<-data.frame(CompOverallSat)
#CompOverallSat
colnames(CompOverallSat) <- c("Airline", "AverageCustRating")

library(ggplot2)

CompOverallSat

plot1<-ggplot(CompOverallSat, aes(x=Airline, y=AverageCustRating)) + geom_bar(stat="identity") + theme(axis.text.x=element_text(angle=90,hjust=1,vjust=0.5))

#CompOverallSat <- CompOverallSat[order(CompOverallSat$AverageCustRating),] 
CompOverallSat
CompOverallSat$Airline <- factor(CompOverallSat$Airline, levels = CompOverallSat$Airline[order(CompOverallSat$AverageCustRating)])

plot2<-ggplot(CompOverallSat, aes(x=Airline, y=AverageCustRating,fill=factor(ifelse(area=="Southeast Airlines Co.","Highlighted","Normal")))) + geom_bar(stat="identity") + theme(axis.text.x=element_text(angle=90,hjust=1,vjust=0.5)) +scale_fill_manual(name = "Airline", values=c("red","grey50")) 





