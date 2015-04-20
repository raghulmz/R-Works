
source("../my_functions/linear_regression/feature_scaling.r")

df<-read.csv(file = "~/Data_Science/Kaggle/titanic//data//train.csv")
names(df)
df1<-df[,c(6,10)]
head(df1)

df1[is.na(df$Age),"Age"]<-mean(df$Age,na.rm=T)
summary(df1)


df_out<-feature_scaling(df = df1,mean.normal = T)
summary(df_out)

df_out<-feature_scaling(df = df1,mean.normal = F)
summary(df_out)
