# LU Decomposition Algorithm

This algorithm decomposes a coefficient matrix **A** from a linear system of equations **Ax** = **b** into upper (**U**) and lower (**L**) triangular matrices, as well as a pivoting or permuation matrix (**P**), such that **PA** = **LU**. It makes use of pivoting to avoid the pitfalls of naive Gaussian elimination. Note that **A** must be square and non-zero. 

As an example, suppose we have the following system of equations and wish to find **L**, **U**, and **P**.

$-0.1x + y + 3z = 1$

$2x + 10y - z = -2$

$-x + 4y + 12z = 5$

The **A** matrix in this case would be equal to:

$$
\begin{equation}
    \textbf{A} = \begin{bmatrix}-0.1 & 1 & 3\\
    2 & 10 & -1\\
    -1 & 4 & 12\end{bmatrix}
\end{equation}
$$

In MATLAB, this would look like:

```
>> A = [-0.1 1 3; 2 10 -1; -1 4 12];
>> [L, U, P] = luFactor(A)

L =

    1.0000         0         0
   -0.5000    1.0000         0
   -0.0500    0.1667    1.0000


U =

    2.0000   10.0000   -1.0000
         0    9.0000   11.5000
         0         0    1.0333


P =

     0     1     0
     0     0     1
     1     0     0
```

Note that in this particular, all rows were swapped at some point during the algorithm. If no row swapping occurred, **P** would be equal to the identity matrix. The values below the diagonal in **L** were the coefficients used in Gaussian elimination. Applications of a decomposition algorithm like this include solving system of equations and finding the inverse matrix $\boldsymbol{A^{-1}}$.
