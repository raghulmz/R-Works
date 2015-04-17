
y<-read.csv("J.dat",header=F)
str(y)
y<-y$V1
class(y)
head(y)
x<-1:length(y)
plot(x,y)
