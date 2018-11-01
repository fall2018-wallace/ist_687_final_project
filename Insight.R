
dfinsight <- df
str(dfinsight)

agevssatis <- function()
{   
    library(ggplot)
    
    plot_comparison <- ggplot(dfinsight,aes=(x=Age, y= Satisfaction)) + geom_histogram(bins = 50, color = "red", fill ="blue")
    
}

agevssatis()
