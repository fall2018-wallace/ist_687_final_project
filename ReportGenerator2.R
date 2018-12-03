
#Plotting number of customers 
summary(df)

CustPerCity<-data.frame(table(df$OrginCity))
# 
# FEB. 2012 JAN. 2012 MAR. 2012 
#         2         2         1
CustPerCity

#gsub("(.*),.*", "\\1", x)




x <- 'Day, Bobby Jean'
gsub("(.*),*.", "\\1", x)

