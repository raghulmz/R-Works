
source("../my_functions/linear_regression/gradient_decent.r")

#df<-read.csv(file = "../my_functions/linear_regression/data//mlr04.csv")
names(df)

head(df)
plot(df[[1]],df[[2]])
theta<-gradient_descent(df,"X1",alpha=0.000000001,it=400,scaling=F)
class(theta)
conv<-read.csv("./J.dat",header=F)
#head(conv)
#dim(conv)
plot(conv$V1,type = "l")


df1<-df[,c(6,10)]
head(df1)

df1[is.na(df$Age),"Age"]<-mean(df$Age,na.rm=T)
summary(df1)

gradient_descent(df1,"Age")

df<-df1
target<-"Age"