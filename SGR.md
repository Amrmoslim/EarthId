---
title: "SGR"
author: "AmrMoslim"
date: "April 15, 2019"
output:
  
  html_document:
    fig_caption: yes
    keep_md: yes
    number_sections: yes
    toc: yes
---



## R Shale Gouge Ratio _"SGR"_

## Data Input


```r
library(mc2d)
library(ggplot2)
### Inputs
  seed = 999
  Ftp90 <- 120
  Ftp10 <- 1000
  
  Ltp90 <- 140
  Ltp10 <- 500
  
  Ngp90 <- 20
  Ngp10 <- 60
  
  n = 10000
```

## Data Processing (Creating Monte Carlo Model)

```r
  ###################### Calculate the SD ###########################################
  Ftsd <- sd(Ftp90:Ftp10)
  Ltsd <- sd(Ltp90:Ltp10)
  ngsd <- sd(Ngp90:Ngp10)
  
  ###################### Calculate the Mean ##########################################
  
  Ftmean <- mean(Ftp90:Ftp10)
  Ltmean <- mean(Ltp90:Ltp10)
  ngmean <- mean(Ngp90:Ngp10)

  #Fault throw thaickness Distribution
  Ft = mcstoc(rnorm, mean=Ftmean, sd=Ftsd, rtrunc=TRUE, linf=Ftp90, lsup=Ftp10, seed = seed, nsv= n )

  #Layer thaickness Distribution
  Lt = mcstoc(rnorm, mean=Ltmean, sd=Ltsd, rtrunc=TRUE, linf=Ltp90, lsup=Ltp10, seed = seed, nsv= n )
  #NG Distribution
  
  NG = mcstoc(rnorm, mean=ngmean, sd=ngsd, rtrunc=TRUE, linf=Ngp90, lsup=Ngp10, seed = seed, nsv= n)
  par(mfrow=c(1,3))
  #layout(matrix(c(1,1,2,3), 2, 2, byrow = TRUE))
  hist(Ft, xlab="Fault throw (m)", breaks=100, col="cyan")
```

![](SGR_files/figure-html/Processing-1.png)<!-- -->

```r
  hist(Lt, xlab="Layer Thickness (m)", breaks=100, col="red")
```

![](SGR_files/figure-html/Processing-2.png)<!-- -->

```r
  hist(NG, xlab="NG (%)", breaks=100, col="yellow")
```

![](SGR_files/figure-html/Processing-3.png)<!-- -->

## Results and Outputs


```r
 SGR = (((100-NG)*Lt/Ft))
   
   hist(SGR, xlab="SGR (%)", breaks=100, col="seagreen1")
```

![](SGR_files/figure-html/Outputs-1.png)<!-- -->

```r
   P<-summary(SGR, probs = c(0.01,0.1,0.50,0.9,0.99))
   
   Pdata<- data.frame(unmc(P))
   colnames(Pdata)<- c("Mean","SD","1%","10%","50%","90%","99%")
   rownames(Pdata)[1] <- "SGR"
    y5 = list(Pdata[3:7])
    x5 = list(1,10,50,90,99)
  #dat<- data.frame(x5,y5)
   knitr::kable(Pdata[,1:7], digits = 0)
```

       Mean   SD   1%   10%   50%   90%   99%
----  -----  ---  ---  ----  ----  ----  ----
SGR      37   13   21    24    34    54    82

```r
  P<- plot(x=c(1,10,50,90,99), y=Pdata[3:7], type = "l")
```

![](SGR_files/figure-html/Outputs-2.png)<!-- -->

```r
   ggplot(P)+geom_smooth()
```

![](SGR_files/figure-html/Outputs-3.png)<!-- -->

```r
   #ggplot(dat, ylab= "SGR Distribution", xlab = "Percentage %")+geom_smooth(aes(x=dat$x5, y=dat$y5))
```


