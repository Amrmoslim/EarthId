# library(shiny)
# library(ggplot2)
# inputPanel(
#   numericInput("Duration", label = "Years to Predict", 
#                value = 10, min = 1, step = 1),
#   numericInput("Pi", label = "Initial Rate", 
#                value = 1000, min = 1, step = 1)
# )

Pi <- 2000
Duration = c(0:10)
DR <- 0.2
#df <- data.frame(Duration,Pi)
df <- NULL

for (i in Duration) {
  
  Pi = Pi- (Pi*DR)
  # print(paste(round(Pi,0),i+1))
  
  df <- rbind(df,data.frame(i, round(Pi,0)))
  #df <- rbind(df,i, round(Pi,0))
  
}

#df
names(df)[1] <- "Time"
names(df)[2] <- "Production"

df

# ggplot(df, ylab= "Production(STB)", xlab = "Time in years")+geom_smooth(aes(x=df$i, y=df$Pi))
p<- ggplot(df, aes(Time,Production))+geom_point()+geom_line(colour = "blue")
plotly::ggplotly(p)

print(paste('the total production is' , sum(df$Production)*365))
