#Chi Square Test

The `chi_sqaure_test` function can be used to test for independence of two categorical values.

It is partly based on the article [Chi-Square Test for Independence](http://stattrek.com/chi-square-test/independence.aspx) by **StatTrek**

This function also makes the Yates' Correction for Continuity

http://en.wikipedia.org/wiki/Yates%27s_correction_for_continuity


###Usage

* Source the file `chi_sqaure_test` <br>

```R
 > source("chi_sqaure_test")
```

* Run `chi_sqaure_test()` function with a data frame and a target

```R
 `>chi_sqaure_test(dataFrame,Target)`
```
**Data Frame should contain only categorical values and will be coerced into a factor**

### Example

The data used in this example is the training data set from the **Kaggle** challenge [Titanic: Machine Learning from Disaster](https://www.kaggle.com/c/titanic)

```R
raghulmz@thecomp <R> setwd("~/Data_Science/R_stuff/Workspace/default/")
raghulmz@thecomp <R>source("../my_functions/chi_square_test/chi_square_test.R")
raghulmz@thecomp <R> file = "~/Data_Science/Kaggle/titanic//data//train.csv"
raghulmz@thecomp <R> df<-read.csv(file)

raghulmz@thecomp <R> df<-df[,c("Sex","Pclass","Survived")]
raghulmz@thecomp <R> names(df)
[1] "Sex"      "Pclass"   "Survived"

raghulmz@thecomp <R> target="Survived"
raghulmz@thecomp <R> chi_sqaure_test(df,target)

Chi-squared test for independence 
 with Yates' continuity correction 
 
Sex 	 DOF =  1 , 	 Chi Square =  261 	 p-value =  0 
Pclass 	 DOF =  2 , 	 Chi Square =  101 	 p-value =  0 

```
