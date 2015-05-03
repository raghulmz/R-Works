#Chi Square Test

The `chi_sqaure_test` function can be used to test for independence of two categorical values.

It is partly based on the article [Information Value Concept in Scorecard Development](http://stattrek.com/chi-square-test/independence.aspx) by **StatTrek**

This function also makes the Yates' Correction for Continuity

http://en.wikipedia.org/wiki/Yates%27s_correction_for_continuity


###Usage

* Source the file `chi_sqaure_test` <br>

 `> source("chi_sqaure_test")`

* Run `chi_sqaure_test()` function with a data frame and a target

 `>chi_sqaure_test(dataFrame,Target)`

**Data Frame should contain only categorical values and be coerced into a factor**

### Example

The data used in this example is the training data set from the **Kaggle** challenge [Titanic: Machine Learning from Disaster](https://www.kaggle.com/c/titanic)

```
raghulmz@thecomp <R> setwd("~/Data_Science/R_stuff/Workspace/default/")
raghulmz@thecomp <R>source("../my_functions/chi_square_test/chi_square_test.R")
raghulmz@thecomp <R> file = "~/Data_Science/Kaggle/titanic//data//train.csv"
raghulmz@thecomp <R> df<-read.csv(file)

raghulmz@thecomp <R> df<-df[,c("Sex","Pclass","Survived")]#,"Embarked")]
raghulmz@thecomp <R> names(df)
[1] "Sex"      "Pclass"   "Survived"

raghulmz@thecomp <R> target="Survived"
raghulmz@thecomp <R> chi_sqaure_test(df,target)

Chi-squared test for independence 
 with Yates' continuity correction 
 
Sex 	 DOF =  1 , 	 Chi Square =  261 	 p-value =  0 
Pclass 	 DOF =  2 , 	 Chi Square =  101 	 p-value =  0 

raghulmz@thecomp <R> X <- df[,which(names(df)!=target)]
raghulmz@thecomp <R> Y <- df[,target]

##Testing with inbuilt R functions

raghulmz@thecomp <R> for (i in 1:length(X)) {
+   print(chisq.test(X[[i]],Y))
+ }

	Pearson's Chi-squared test with Yates' continuity correction

data:  X[[i]] and Y
X-squared = 260, df = 1, p-value <2e-16


	Pearson's Chi-squared test

data:  X[[i]] and Y
X-squared = 100, df = 2, p-value <2e-16
```
