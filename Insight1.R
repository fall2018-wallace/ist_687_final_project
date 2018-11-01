
str(df)
library("ggplot2")
Plot1<-ggplot(df,aes(x=Age ,y=Satisfaction))+geom_point()+ggtitle("Customer Satisfaction vs Age")+xlab("Age")+ylab("Customer Satisfaction")


df$SatisfactionJ<-jitter(df$Satisfaction)
df$AgeJ<-jitter(df$Age)

ggplot(df,aes(x=AgeJ,y=overallCustSatJ))+geom_point()+stat_smooth(method="lm",col="red")
