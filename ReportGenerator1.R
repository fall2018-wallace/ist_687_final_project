
summary(fulldf)
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

plot2<-ggplot(CompOverallSat, aes(x=Airline, y=AverageCustRating)) + geom_bar(stat="identity",colour="black",fill="cyan") + theme(axis.text.x=element_text(angle=90,hjust=1,vjust=0.5)) 


genderData<-data.frame(table(fdf$Gender))
genderData
colnames(genderData) <- c("Gender", "NoOfTravellers")

plot3<-ggplot(genderData, aes(x=Gender, y=NoOfTravellers)) + geom_text(aes(label=NoOfTravellers), vjust=-1.0) + geom_bar(stat="identity",colour="white",fill="blue") +theme(axis.text.x = element_text(angle = 90, hjust = 1))+ ggtitle("Gender wise travellers in overall dataset")# + theme(plot.title= element_text(hjust=0.5)) 

classData<-data.frame(table(fdf$Class))
classData
colnames(genderData) <- c("TravelClass", "NoOfTravellers")


