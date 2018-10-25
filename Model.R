

str(df)
options(scipen=999999) # To obtain a distribution of values on the axes in readable form

LM_MK<-lm(Satisfaction~Age+Airline.Status+Price.Sensitivity+Year.of.First.Flight+No.of.Flights.p.a.+X..of.Flight.with.other.Airlines+Type.of.Travel+No..of.other.Loyalty.Cards+Shopping.Amount.at.Airport+Eating.and.Drinking.at.Airport+Class+Day.of.Month ,data=df)
summary(LM_MK)
