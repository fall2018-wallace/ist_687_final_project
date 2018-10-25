

str(df)
options(scipen=999999) # To obtain a distribution of values on the axes in readable form

LM_MK<-lm(Satisfaction~Age+Price.Sensitivity,data=df)
summary(LM_MK)
