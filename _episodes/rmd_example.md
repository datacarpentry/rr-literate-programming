This is an R Markdown document.


```r
x <- rnorm(1000)
head(x)
```

```
## [1] -0.2738586  1.5177458 -0.6980539 -0.1076397  0.0525330 -1.7305907
```

`knitr` offers a lot of control over representing different
types of output. We can also have inline `R` expressions
computed on the fly.

The mean $\bar{x} = \frac{1}{n} \sum_{i=1}^{n} x_{i}$ of the
1000 random variates we generated is
-0.009.

This figure is computed on-the-fly as well. No more
copy-paste, including for figures:


```r
plot(density(x))
```

![plot of chunk sec_4](figure/sec_4-1.png)
