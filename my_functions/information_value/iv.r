# Deciles function

decile <- function(x) {
  deciles <-vector(length=11)  
  deciles <- quantile(x,seq(0,1,0.1),na.rm=T)
  
  y<-vector(length=length(x))
  
  for (i in seq(1,10)) {
    y[which( x>=deciles[i] )]<-i 
  }
  return(y)
}

# Information Value

iv <- function(df,target) {
  
  x_list<-names(df)[which(names(df)!=target)] #Getting list of variables
  inf.v<-vector() # Vector to hold I.V of variables
  
  for (x in x_list) { 
    
    # Binning for quantitative data. I assume all numeric and integer fields are quantitative
    
    if(class(df[,x]) %in% c("numeric","integer")) {
      
      x_deciles <- decile(df[,x]) 
      
      #Start counting
      
      len=10
      nG<-vector(length=len)
      nB<-vector(length=len)
      
      for (i in 1:len) {
        
        nG[i]<-length(df[which(x_deciles==i & df[,target]==1),x])
        nB[i]<-length(df[which(x_deciles==i & df[,target]==0),x])
        
      }
    } 
    
    # Categorical Data. No binning
    
    if(class(df[,x]) %in% c("character","factor")){
      
      classes<-unique(df[,x])
      len=length(classes)
      nG<-vector()
      nB<-vector()
      for (i in classes) {
        
        
        nG[i]<-length(df[which(df[,x]==i & df[,target]==1),x])
        nB[i]<-length(df[which(df[,x]==i & df[,target]==0),x])
      }
    } 
    
    sumG<-sum(nG)
    sumB<-sum(nB)
    
    T_list<-vector(length=len)
    
    for (i in 1:len) {
      
      perG<-nG[i]/sumG
      perB<-nB[i]/sumB
      
      distance<-perG-perB
      force<-log(perG/perB)
      
      # If a bin has zero count, it will lead to Infs or NaNs
      # Setting force (WOE) to zero to avoid NaNs
      if(any(c(sumG,sumB,perB,perG)==0)) {
        force=0
        
      }
      
      torque<-distance*force
      T_list[i]<-torque
    }
    
    inf.v[x]<-sum(T_list)
    print(inf.v[[x]])
  }
  return(inf.v)
}
