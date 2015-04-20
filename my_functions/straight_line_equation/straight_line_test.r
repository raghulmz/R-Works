setwd("~/Data_Science/R_stuff/Workspace/my_functions/straight_line_equation/")
source("./straight_line_equation.r")

X<-rnorm(2)
Y<-0.33*X+2
mat<-cbind(X,Y)
mat
straight_line(mat,x = 4)
