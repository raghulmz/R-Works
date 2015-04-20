# Straight line equation

 * This function takes two points in a Cartesian plane and fits a third co-ordinate.
 * Input can be a 2x2 matrix (two points) and either x or y co-ordinate. (abscissa or ordinate).

###Example


```
raghulmz@thecomp <R> source("./straight_line_equation.r")
raghulmz@thecomp <R> X<-rnorm(2)
raghulmz@thecomp <R> Y<-0.33*X+2
raghulmz@thecomp <R> mat<-cbind(X,Y)
raghulmz@thecomp <R> mat
           X     Y
[1,]  2.5298 2.835
[2,] -0.2553 1.916
raghulmz@thecomp <R> straight_line(mat, x = 4)
[1] "Intercept= 2"
[1] "Slope= 0.33"
   y 
3.32 
```