# False Position Algorithm

This algorithm uses the false position root finding method, which is a closed, convergent root finding method. It works by drawing a line between two points on a curve which bracket a root, then taking the new guess of the root to be where this line intersects the x-axis. A user can specify the function and initial brackets with the *func*, *xl*, and *xu* variables, respectively. More so, a user optionally specify the stopping criterion, *es*, or the maximum number of iterations to perform, *maxit*. The default values for these variables are set to 0.0001% and 200 iterations. The user can additionally use the *vargin* variable input arguments into *func*.

This algorithm will return the estimate of the root, the function evaluated at the root estimate, the approximate error of the root estimate, and the number of iterations to obtain the root estimate.

As as example, suppose you are trying to find a root of the equation $f(x) = 0.4x^{2} + 3x + 5$. Observing the graph, one possible root lies at x = -5. Good initial bracket guesses would be xl = -6 and xu = -4. Suppose we want a stopping criterion of 0.05%, and a maximum of 10 iterations. In MATLAB, this would look like:

 ```
>> [root, fx, ea, iter] = falsePosition(@(x) 0.4*x.^2 + 3*x + 5, -6, -4, 0.0005, 10)

root =

   -5.0000


fx =

  -6.0418e-06


ea =

   3.0209e-06


iter =

    10
```

While this method is absolutely convergent, note that the user may have runtime issues when dealing with the flat portions of exponentials as relatively small changes in the estimation of the root would lead to negligible change in height of the function.
