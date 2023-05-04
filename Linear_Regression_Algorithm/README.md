# Linear Regression Algorithm

This algorithm takes an input of *x* and *y* data to fit a linear regression model to. Before doing so, potential outliers in *y* are removed using the 1.5*IQR rule. The algorithm then returns the modified *x* and *y* data sets as *fX* and *fY*, along with the slope, intercept, and R-squared value of the fitted line. This algorithm employs the normal equations to solve for the slope and intercept.

As an example, suppose we have the following data. In this case, it is clear to see the point (4, 48) is an outlier, hence it would be removed by the algorithm. The remaining x and y points would then be plugged into the normal equations to find the slope and intercept of the best fit line.

| x | y |
| :---: | :---: |
| 1 | 4.6  |
| 2 | 7 |
| 3 | 9.1 |
| 4 | 48 |
| 5 | 13.2 |
| 6 | 15 |
| 7 | 18 |

In MATLAB, this would look like:

```
>> x = linspace(1, 7, 7)
>> y = [4.6 7 9.1 48 13.2 15 18]
>> [fX, fY, slope, intercept, Rsquared] = linearRegression(x,y)

fX =

     1     2     3     5     6     7


fY =

    4.6000    7.0000    9.1000   13.2000   15.0000   18.0000


slope =

    2.1536


intercept =

    2.5357


Rsquared =

    0.9968

```
We can see that the algorithm indeed removed the outlier point at x = 4, and returned the slope, intercept, and R-squared value for the modified data. Applications of this algorithm include any phenonmenon that may be suspected to have linear behavior.
