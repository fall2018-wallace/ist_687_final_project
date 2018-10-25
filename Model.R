

str(df)
options(scipen=999999) # To obtain a distribution of values on the axes in readable form

LM_MK<-lm(Satisfaction~Age+Airline.Status+Price.Sensitivity+Year.of.First.Flight+No.of.Flights.p.a.,data=df)
summary(LM_MK)
