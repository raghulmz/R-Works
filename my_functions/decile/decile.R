# Deciles function

decile_new <- function(x) {
  deciles <-vector(length=11)  
  deciles <- quantile(x,seq(0,1,0.1),na.rm=T)
  
  y<-vector(length=length(x))
  
  for (i in seq(1,10)) {
    y[which( x>=deciles[i] )]<-i 
  }
  return(y)
}

