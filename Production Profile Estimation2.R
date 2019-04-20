library(ggplot2)
Pi <- 1000
Duration = 10
DR <- 0.2
df <- NULL

for (i in 0:Duration) {
  
  Pi = Pi- (Pi*DR)
  print(paste(round(Pi,0),i+1))
  
  df <- rbind(df,data.frame(i+1, round(Pi,digits = 0)))
}

names(df)[1] <- "Time"
names(df)[2] <- "Production"

df

plot(df, ylab= "Production(STB)", xlab = "Time in years")

print(paste('the total production is' , sum(df$Production)*365))
#####function--------------------------------------------------------
prod.fun <- function(Pi,t,Dr) {
  df <- NULL
  for (i in 0:t) {
    
    Pi = Pi- (Pi*Dr)
    #print(paste(round(Pi,0),i+1))
    
    df <- rbind(df,data.frame(i, round(Pi,digits = 0)))
  }
  
   names(df)[1] <- "Time"
   names(df)[2] <- "Production"
  
  return(as.data.frame(df))
  
}

prod.fun(1000,10,0.2)
print(df)

######------------------------------------
prod.fun(1000,10,0.2
         )

