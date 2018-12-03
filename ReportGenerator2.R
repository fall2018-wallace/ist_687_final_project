
#Plotting number of customers 
#summary(df)

df1<-df
x1<-gsub('.*\\,', '', df1$OrginCity)
df1$OrginCity<-x1
CustPerCity<-data.frame(table(df1$OrginCity))
# 
# FEB. 2012 JAN. 2012 MAR. 2012 
#         2         2         1
CustPerCity
colnames(CustPerCity) <- c("State", "Flights")


#gsub("(.*),.*", "\\1", x)

library(ggplot2)

CustPerCity$State <- factor(CustPerCity$State, levels = CustPerCity$State[order(CustPerCity$Flights)])

plot1<-ggplot(CustPerCity, aes(x=State, y=Flights)) + geom_bar(stat="identity",colour="white",
fill="palevioletred3") +theme(axis.text.x = element_text(angle = 90, hjust = 1))+ ggtitle("State wise distribution
of flights taken")+theme(plot.title= element_text(hjust=0.5))
plot1

#x <- 'Day, Bobby Jean'
#gsub('.*\\,', '', x)

