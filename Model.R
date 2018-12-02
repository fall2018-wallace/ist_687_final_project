
str(df)
df$happy<-df$Satisfaction
df$happy[df$happy>=4]<-"happy"
df$happy[df$happy<4]<-"unhappy"
df1<-data.frame(df$happy,df$AirlineStatus,df$Age,df$Gender,df$PriceSensitivity,df$YearofFirstFlight,df$NoofFlightspa,df$TypeofTravel,df$ShoppingAmountatAirport,df$Class,df$ScheduledDepartureHour,df$ArrivalDelaygreater5Mins)
cutPoint2_3 <- floor(2 * dim(df1)[1]/3)
randIndex <- sample(1:dim(df1)[1])
trainData <- df1[randIndex[1:cutPoint2_3],]
testData <- df1[randIndex[(cutPoint2_3+1):dim(df1)[1]],]
dim(testData)
dim(trainData)
library(kernlab)
svmOutput <- ksvm(df.happy ~ df.Gender, data=trainData, kernel = "rbfdot",kpar="automatic",C=5,cross=3, prob.model=TRUE)

svmPred <- predict(svmOutput, testData, type = "votes")

compTable <- data.frame(testData$df.happy,svmPred[2,])
table(compTable)


