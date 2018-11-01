
str(df)
library("ggplot2")
Plot1<-ggplot(df,aes(x=NoofFlightspa. ,y=Satisfaction))+geom_point()+ggtitle("Customer Satisfaction vs Age")+xlab("Age")+ylab("Customer Satisfaction")
