
#Plotting number of customers 
summary(df)

CustPerCity<-data.frame(table(df$OrginCity))
# 
# FEB. 2012 JAN. 2012 MAR. 2012 
#         2         2         1
CustPerCity
colnames(CustPerCity) <- c("City", "Flights")

#gsub("(.*),.*", "\\1", x)

plot1<-ggplot(CompOverallSat, aes(x=Airline, y=AverageCustRating)) + geom_bar(stat="identity") + theme(axis.text.x=element_text(angle=90,hjust=1,vjust=0.5))


x <- 'Day, Bobby Jean'
gsub("(.*),.*", "\\1", x)

