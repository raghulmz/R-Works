# Feature Scaling and mean normalization

Feature scaling is a method used to standardize the range of independent variables or features of data. In data processing, it is also known as data normalization and is generally performed during the data preprocessing step. (Source: [wikipedia](http://en.wikipedia.org/wiki/Feature_scaling))


The function `feature_scaling()` does the following transformation to the input data.

 * Divides all values in a feature by the maximum value.

 * Output will be in the range [-1,1]

 * If mean normalization is True, features will be scaled such that the mean is zero.

###Example


The data used in this example is the training data set from the **Kaggle** challenge [Titanic: Machine Learning from Disaster](https://www.kaggle.com/c/titanic)


```R
raghulmz@thecomp <R> source("../my_functions/linear_regression/feature_scaling.r")
raghulmz@thecomp <R> 
raghulmz@thecomp <R> df<-read.csv(file = "~/Data_Science/Kaggle/titanic//data//train.csv")
raghulmz@thecomp <R> names(df)
 [1] "PassengerId" "Survived"    "Pclass"     
 [4] "Name"        "Sex"         "Age"        
 [7] "SibSp"       "Parch"       "Ticket"     
[10] "Fare"        "Cabin"       "Embarked"   
raghulmz@thecomp <R> df1<-df[,c(6,10)]
raghulmz@thecomp <R> head(df1)
  Age   Fare
1  22  7.250
2  38 71.283
3  26  7.925
4  35 53.100
5  35  8.050
6  NA  8.458
raghulmz@thecomp <R> 
raghulmz@thecomp <R> df1[is.na(df$Age),"Age"]<-mean(df$Age,na.rm=T)
raghulmz@thecomp <R> summary(df1)
      Age             Fare      
 Min.   : 0.42   Min.   :  0.0  
 1st Qu.:22.00   1st Qu.:  7.9  
 Median :29.70   Median : 14.5  
 Mean   :29.70   Mean   : 32.2  
 3rd Qu.:35.00   3rd Qu.: 31.0  
 Max.   :80.00   Max.   :512.3  
raghulmz@thecomp <R> 
raghulmz@thecomp <R> 
raghulmz@thecomp <R> df_out<-feature_scaling(df = df1,mean.normal = T)
raghulmz@thecomp <R> summary(df_out)
      Age               Fare        
 Min.   :-0.3660   Min.   :-0.0629  
 1st Qu.:-0.0962   1st Qu.:-0.0474  
 Median : 0.0000   Median :-0.0346  
 Mean   : 0.0000   Mean   : 0.0000  
 3rd Qu.: 0.0663   3rd Qu.:-0.0024  
 Max.   : 0.6288   Max.   : 0.9371  
raghulmz@thecomp <R> 
raghulmz@thecomp <R> df_out<-feature_scaling(df = df1,mean.normal = F)
raghulmz@thecomp <R> summary(df_out)
      Age              Fare       
 Min.   :0.0052   Min.   :0.0000  
 1st Qu.:0.2750   1st Qu.:0.0154  
 Median :0.3712   Median :0.0282  
 Mean   :0.3712   Mean   :0.0629  
 3rd Qu.:0.4375   3rd Qu.:0.0605  
 Max.   :1.0000   Max.   :1.0000
```