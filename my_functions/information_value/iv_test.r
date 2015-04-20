library("woe")
library("rpart")
setwd("~/Data_Science/R_stuff/Workspace/default/")
source("../my_functions/information_value/iv.r")
file = "~/Data_Science/Kaggle/titanic//data//train.csv"
df<-read.csv(file)

df<-df[,c(-1,-4,-9,-11)]
names(df)

iv_mult_out<-iv.mult(df,"Survived")
iv(df = df, target = "Survived")
