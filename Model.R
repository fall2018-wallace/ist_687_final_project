

str(df)

LM_MK<-lm(Satisfaction~Age+Price.Sensitivity,data=df)
summary(LM_MK)
