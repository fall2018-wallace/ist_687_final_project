
#summary(df)

fulldf<-df
str(fulldf)
#Custdf<-subset(df,AirlineName=="Southeast")
Custdf<-df[df$AirlineName == 'Southeast Airlines Co. ',]

#summary(Custdf)

#summary(df)

#positive = posWords[which(posWords >=2)]
#df$AirlineName

df<-Custdf

str(fulldf)



