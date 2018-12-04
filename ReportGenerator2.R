
#Plotting number of customers 
summary(df)

df1<-df
x1<-gsub('.*\\,', '', df1$OrginCity)
df1$OrginCity<-x1
CustPerCity<-data.frame(table(df1$OrginCity))

colnames(CustPerCity) <- c("State", "Flights")


#gsub("(.*),.*", "\\1", x)

library(ggplot2)

CustPerCity$State <- factor(CustPerCity$State, levels = CustPerCity$State[order(CustPerCity$Flights)])

plot1<-ggplot(CustPerCity, aes(x=State, y=Flights)) + geom_bar(stat="identity",colour="white",
fill="palevioletred3") +theme(axis.text.x = element_text(angle = 90, hjust = 1))+ ggtitle("State wise distribution
of flights taken")+theme(plot.title= element_text(hjust=0.5))
#plot1

#Customer Satisfaction based on age 
df2<-df
AgeGroups<-cut(df$Age, breaks=c(18, 24,30,36,42,48,54,60,66,72,78,84,90), right = FALSE)
#AgeGroups
AgeGroups<-gsub(',', ' to ', AgeGroups)
AgeGroups<-gsub('\\[', '', AgeGroups)
AgeGroups<-gsub('\\)', '', AgeGroups)

df2$Age<-AgeGroups

#cts<-aggregate(df2$Age,FUN=length,data=df2)

countvar<-data.frame(table(df2$Age))
#countvar
colnames(countvar) <- c("Age", "CountOfFlights")


AgeSat<-aggregate(df2[, 1], list(df2$Age), mean)

AgeSat<-data.frame(AgeSat)


#CompOverallSat
colnames(AgeSat) <- c("Age", "AverageCustRating")
AgeSat<-merge(x = AgeSat, y = countvar, by = "Age", all = TRUE)
#AgeSat

plot2<-ggplot(AgeSat, aes(x=Age, y=AverageCustRating, label=CountOfFlights)) + geom_text(aes(label=CountOfFlights), vjust=-1.0) + geom_bar(stat="identity",colour="white",fill="blue") +theme(axis.text.x = element_text(angle = 90, hjust = 1))+ ggtitle("Age wise average Customer Satisfaction") + theme(plot.title= element_text(hjust=0.5)) 
#plot2<-ggplot(AgeSat, aes(x=Age, y=AverageCustRating)) + geom_bar(stat="identity") + theme(axis.text.x=element_text(angle=90,hjust=1,vjust=0.5))
#plot2



# Gender plot
countvar<-data.frame(table(df$Gender))
colnames(countvar) <- c("Gender", "NoOfTravelers")
#countvar
plot3<-ggplot(countvar, aes(x=Gender, y=NoOfTravelers)) + geom_text(aes(label=NoOfTravelers), vjust=-1.0) + geom_bar(stat="identity",colour="white",fill="lightseagreen") +theme(axis.text.x = element_text(angle = 90, hjust = 1))+ ggtitle("Gender wise Customers") + theme(plot.title= element_text(hjust=0.5)) 




# Airline Status 

grouped_data <- aggregate(df, by=list(df$AirlineStatus, df$Satisfaction), FUN=length);
grouped_data <-grouped_data[,c(1:3)]
#grouped_data
colnames(grouped_data) <- c("AirlineStatus", "Satisfaction","NoOfTravelers")
grouped_data

plot4<-ggplot(grouped_data, aes(factor(Satisfaction), NoOfTravelers, fill = AirlineStatus)) +        geom_bar(stat = "identity", width = 0.2, position = "dodge") +   labs(list(x = "Satisfaction", y = "Number of Travellers",fill = "group"))



#Type of travel
