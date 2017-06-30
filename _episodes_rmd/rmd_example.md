This is an R Markdown document.


```r
x <- rnorm(1000)
head(x)
```

```
## [1] -3.2538882  0.6478847 -2.3089858 -1.8085141  0.5498946  1.4029523
```

`knitr` offers a lot of control over representing different
types of output. We can also have inline `R` expressions
computed on the fly.

The mean $\bar{x} = \frac{1}{n} \sum_{i=1}^{n} x_{i}$ of the
1000 random variates we generated is
0.036.

This figure is computed on-the-fly as well. No more
copy-paste, including for figures:


```r
plot(density(x))
```

<img src="../figure/sec_4-1.png" title="plot of chunk sec_4" alt="plot of chunk sec_4" style="display: block; margin: auto;" />
