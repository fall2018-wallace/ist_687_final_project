
#summary(df)


#Custdf<-subset(df,AirlineName=="Southeast")
Custdf<-df[df$AirlineName == 'Southeast',]

summary(Custdf)

#positive = posWords[which(posWords >=2)]


