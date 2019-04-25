# library(Quandl)
# oil.ts <- Quandl("DOE/RBRTE", trim_start="1987-11-10", trim_end="2015-01-01", type="zoo")
# oil.tsw <-Quandl("DOE/RBRTE", trim_start="1987-11-10", trim_end="2015-01-01", type="zoo", collapse="weekly")
# oil.tsm <-Quandl("DOE/RBRTE", trim_start="1987-11-10", trim_end="2015-01-01", type="ts", collapse="monthly")
# plot(oil.tsm, xlab="Year", ylab="Price, $", type="l")
# lines(lowess(oil.tsm), col="red", lty="dashed")

WTI_Daily <- read.csv("https://s3.amazonaws.com/rawstore.datahub.io/718ae3b724d94479a54b3a23bfe8e1fa.csv")
WTI_Weekly <- read.csv("https://s3.amazonaws.com/rawstore.datahub.io/c63e90f9f9c24a214b6633a1727bb866.csv")
WTI_Monthly<- read.csv("https://s3.amazonaws.com/rawstore.datahub.io/591144e96162fbca6773c1df30fcd6e1.csv")
WTI_Yearly<- read.csv("https://s3.amazonaws.com/rawstore.datahub.io/07453663141c1232e3552fd58f1d8a8d.csv")

Brent_Daily <- read.csv("https://s3.amazonaws.com/rawstore.datahub.io/e241a389aa9c167b56a496d05e6153d7.csv" )
Brent_Weekly <- read.csv( "https://s3.amazonaws.com/rawstore.datahub.io/84a73eef16080a604013e9cd29137dc3.csv")
Brent_Monthly<- read.csv("https://s3.amazonaws.com/rawstore.datahub.io/7cc48e632633716dc847bb1716854cd3.csv" )
Brent_Yearly<- read.csv( "https://s3.amazonaws.com/rawstore.datahub.io/4b11fe7099f1e3ee6f9a2567f719e092.csv")

X1 <- c()
X1 <-c(as.Date(Brent_Yearly[,1]),Brent_Yearly[2])
X1

  
  library(ggplot2)

Plt<- ggplot(Brent_Daily)+geom_point(aes(Brent_Monthly$Date ,Brent_Monthly$Price))
Plt

par(mfrow= c(2,2))
plot(Brent_Daily, type= "p")
plot(Brent_Weekly, type= "p")
plot(Brent_Monthly, type= "p")
plot(Brent_Yearly, type= "p")

# Library
library(dygraphs)

# --- Format 1: time is represented by a simple number. (must be numeric and ordered)
data=data.frame( time=c( seq(0,20,0.5), 40), value=runif(42))
str(data)
dygraph(X1)

dygraph(ldeaths, main = "Deaths from Lung Disease (UK)") %>%
  dySeries("V1", strokeWidth = 2, strokePattern = "dashed")