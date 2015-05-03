#Information Value

The `iv()` function calculates the information value of features in a data frame. 

I would like to thank **Mr. Rajesh Jakhotia, B.E., PMP** whose article is the basis for this code.

It is based on the article [Information Value Concept in Scorecard Development](https://www.linkedin.com/pulse/20140627161956-96945870-information-value) by **Rajesh Jakhotia, B.E., PMP**

The following assumptions and adjustments were made apart from those specified by the author

1. All numeric and integer fields contain **quantitative data** and are binned  by deciles.
<br> Quantitative data can be either `numeric` or `integer` datatype<br>
2. All character fields are **categorical data** and are thus not binned.
<br> Qualitative data can be either `character` or `vector` datatype<br>
3. If in any bin, count becomes zero. There will be `Inf` and `NaNs` produced. Hence in such cases the **weight of evidence (woe)** will be made zero.

###Usage

* Source the file `iv.r` <br>

 `> source("iv.r")`

* Run `iv()` function with a data frame and a target

 `>iv(dataFrame,Target)`

### Example

The data used in this example is the training data set from the **Kaggle** challenge [Titanic: Machine Learning from Disaster](https://www.kaggle.com/c/titanic)

```
raghulmz@thecomp <R> source("./iv.r")
raghulmz@thecomp <R> file = "~/Data_Science/Kaggle/titanic//data//train.csv"
raghulmz@thecomp <R> df<-read.csv(file)
raghulmz@thecomp <R> df<-df[,c(-1,-4,-9,-11)]
raghulmz@thecomp <R> names(df)
[1] "Survived" "Pclass"   "Sex"      "Age"      "SibSp"   
[6] "Parch"    "Fare"     "Embarked"
raghulmz@thecomp <R> iv(df = df, target = "Survived")
[1] 0.5009
[1] 1.342
[1] 0.1112
[1] 0.056
[1] 0.09746
[1] 0.6644
[1] 0.1224
  Pclass      Sex      Age    SibSp    Parch     Fare 
 0.50095  1.34168  0.11117  0.05600  0.09746  0.66438 
Embarked 
 0.12237
```
