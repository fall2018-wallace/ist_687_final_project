
str(raw_data)

CleanSatisfaction<-raw_data[(raw_data$Satisfaction=="1" | 
            raw_data$Satisfaction=="1.5" |
            raw_data$Satisfaction=="2" |
            raw_data$Satisfaction=="2.5" |
            raw_data$Satisfaction=="3" |
            raw_data$Satisfaction=="3.5" |
            raw_data$Satisfaction=="4" |
            raw_data$Satisfaction=="4.5" |
            raw_data$Satisfaction=="5" ),]
#clean_data <- subset(raw_data,trimws(raw_data$Satisfaction)==c(1:5))
#clean_data

nrow(CleanSatisfaction)
omitted<-na.omit(CleanSatisfaction)
nrow(CleanSatisfaction)-nrow(omitted)

#df<-read.table(choose.files(),header = T,sep = ",")
#head(is.na(df),n = 129886)
#CleanSatisfaction<-na.omit(CleanSatisfaction)#Remove rows that contain missing data.
df<-omitted

newCol<-na.omit(colnames(df))
gsub(".", "", newCol)
newCol
