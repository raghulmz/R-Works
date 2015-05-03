# Gradient Descent for linear regression
# Requires feature_scaling function

#setwd("~/Data_Science//R_stuff//my_functions//linear_regression")
source("../my_functions/linear_regression/feature_scaling.r")

gradient_descent <- function(df,target,alpha=0.0001,it,scaling=T) {
  J_out<-file(paste("J.dat",Sys.time()),"w")
  #Feature Scaling
  if(scaling == T){
    df<-feature_scaling(df,mean.normal = T)
  }
  
  #Seperate prdictors and target and add a column of ones (x0) to create X vector
  X<-df[,!names(df) %in% target]
  X<-cbind(rep(1,nrow(df)),X)
  Y<-df[,target]
  #Count number of features
  n<-ncol(df)-1
  m<-nrow(df)
  #Initialize Theta(s) vector
  THETA<-vector(mode="numeric",length=n+1)
  names(THETA)[1]<-"Intercept"
  names(THETA)[-1]<-names(df)[!names(df) %in% target]
  THETA_new<-vector(mode="numeric",length=n+1)
  
  
  stOp=T
  J=0
  iter=0
  while(stOp) {
    H<-0
    iter=iter+1
    for (j in 1:(n+1)) {
      H <- H + (THETA[[j]]*X[,j])
    }
    SQE<-(H-Y)^2
    open
    J_new<-sum(SQE/(2*m))
    
    print(paste(J_new,"   ",iter))
    cat(J_new,file=J_out)
    cat("\n",file=J_out)
    if((J_new-J)<0.0000000001) {stOp=F}
    #if(iter>it){stOp=F}
    #if(iter%50000==0){}
    for (j in 1:(n+1)) {
      
      THETA_new[j]<-THETA[j]- ( (alpha * sum(SQE * X[,j])) /m )
    }
    J<-J_new
    THETA<-THETA_new
  }
  
  close(J_out)
  return(THETA)
}