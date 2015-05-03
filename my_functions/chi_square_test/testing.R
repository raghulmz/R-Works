
setwd("~/Data_Science/R_stuff/Workspace/default/")
source("../my_functions/chi_square_test/chi_square_test.R")
file = "~/Data_Science/Kaggle/titanic//data//train.csv"
df<-read.csv(file)

df<-df[,c("Sex","Pclass","Survived")]#,"Embarked")]
names(df)

target="Survived"

chi_sqaure_test(df,target)

X <- df[,which(names(df)!=target)]
Y <- df[,target]

for (i in 1:length(X)) {
  print(chisq.test(X[[i]],Y))
}

