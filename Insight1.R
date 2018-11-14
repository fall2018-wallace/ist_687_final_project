
str(df)
library("ggplot2")
#Plot1<-ggplot(df,aes(x=Age ,y=Satisfaction))+geom_point()+ggtitle("Customer Satisfaction vs Age")+xlab("Age")+ylab("Customer Satisfaction")


#df$SatisfactionJ<-jitter(df$Satisfaction)
#df$AgeJ<-as.numeric(jitter(df$Age))

#Plot1<-ggplot(df,aes(x=Age,y=overallCustSat))+geom_point()+stat_smooth(method="lm",col="red")
df$Flightdate <- as.Date(df$Flightdate , "%m/%d/%y")
#df$Flightdate 
Plot1<-hist(df$Flightdate)
