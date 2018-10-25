
str(df)
Plot1<-ggplot(df,aes(x=Age,y=Satisfaction))+geom_point()+ggtitle("Customer Satisfaction vs Age")+xlab("Age")+ylab("Customer Satisfaction")
