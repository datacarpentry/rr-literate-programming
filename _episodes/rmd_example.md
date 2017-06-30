This is an R Markdown document.


```r
x <- rnorm(1000)
head(x)
```

```
## [1] -0.03515028  1.28489303 -0.10394216 -0.03024353 -0.17735876  0.07880816
```

`knitr` offers a lot of control over representing different
types of output. We can also have inline `R` expressions
computed on the fly.

The mean $\bar{x} = \frac{1}{n} \sum_{i=1}^{n} x_{i}$ of the
1000 random variates we generated is
0.03.

This figure is computed on-the-fly as well. No more
copy-paste, including for figures:


```r
plot(density(x))
```

![plot of chunk sec_4](figure/sec_4-1.png)
