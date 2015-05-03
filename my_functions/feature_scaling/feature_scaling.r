# Feature Scaling and mean normalization
#
# Divides all values in a feature by the maximum value.
# Output will be in the range [-1,1]
#
# If mean normalization is True, features will be scaled such 
# that the mean is zero.

#setwd("~/Data_Science/R_stuff/my_functions/linear_regression/")

feature_scaling <- function(df, mean.normal=T) {
  for (i in names(df)) {
    max_v<-max(abs(df[,i]))
    if (mean.normal) {
      mean_v<-mean(df[,i])
      df[,i]<-df[,i]-mean_v
    }
    df[,i]<-df[,i]/max_v
  }
  return(df)
}