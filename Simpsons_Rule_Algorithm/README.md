# Simpson's 1/3 Rule Algorithm

This algorithm accepts uniformally spaced *x* data and the corresponding *y* data, then uses Simpson's 1/3 Rule to numerically integrate the data, returning the approximate integral value as *I*. If only 2 points are given, the algorithm will throw a warning and perform a single application of the trapezoidal rule. If 3 points are given, the algorithm uses the single application Simpson's 1/3 Rule, wherein

$$
\begin{equation}
I \approx \frac{x_3-x_1}{6}(y_1 + 4y_2 + y_3)
\end{equation}
$$

Lastly, if the number of points is greater than 3, the algorithm will perform the composite version of Simpson's 1/3 Rule, with a caveat that if the number of points is even, a single application of the trapezoidal rule will be applied on the last segment. This was implemented as the composite Simpon's 1/3 Rule only works for an odd number of points. The algorithm will not run if *x* and *y* are of different sizes, or *x* is not equally spaced.

As an example, suppose we have the following time and velocity data and wish to find the distance traveled by the moving object after 10 seconds.

| t (s) | v (m/s) |
| :---: | :---: |
| 0 | 0 | 
| 2 | 5 | 
| 4 | 23 | 
| 6 | 25 | 
| 8 | 18 | 
| 10 | 16 |

In MATLAB, this will look like:
```
>> t = linspace(0, 10, 6);
>> v = [0 5 23 25 18 16];
>> I = Simpson(t, v) % t is the x data, v is the y data

Warning: Warning: even number of segments, trapezoidal rule used on last segment 
> In Simpson (line 27) 

I =

  156.6667

```
As expected, the number of input points was even, thus the algorithm gave a warning that a single application trapezoidal rule was used on the last segment.
