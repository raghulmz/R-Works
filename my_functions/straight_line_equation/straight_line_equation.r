# Straight line equation
#
# This funtion takes two points in a catesian plane and fits a 
# third co-ordinate.
# Input can be either x or y co-ordinate. (abssisa or ordinate) 
# and a 2x2 matrix (two points).

straight_line <- function(df,x=NA,y=NA) {
  
  if(is.na(x) & is.na(x)) {
    print("Either x or y value is required")
  }
  
  m<-((df[2,2]-df[1,2])/(df[2,1]-df[1,1]))
  c<-df[1,2]-m*df[1,1]
  
  print(paste("Intercept=",c))
  print(paste("Slope=",m))
  
  if (is.na(y)) {
    A<-(m*x)+c
    names(A)<-"y"
  }
  
  if (is.na(x)) {
    A<-(y-c)/m
    names(A)<-"x"
  }
  
  return(A)
}