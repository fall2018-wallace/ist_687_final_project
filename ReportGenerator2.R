
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

df2$Age<-AgeGroups
AgeSat<-data.frame(table(df2$Age))

plot2<-ggplot(AgeSat, aes(x=State, y=Flights)) + geom_bar(stat="identity",colour="white",
fill="blue") +theme(axis.text.x = element_text(angle = 90, hjust = 1))+ ggtitle("Age wise average Customer Satisfaction")+theme(plot.title= element_text(hjust=0.5)) 



