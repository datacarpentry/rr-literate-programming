---
title: "Literate programming"
teaching: 30
exercises: 10
questions:
- "What tools are available to easily disseminate our work?"
- "How can we make our work more reproducible?"
objectives:
- "Learn the basics of `RMarkdown` and `knitr`"
- "Learn to integrate `R` code with text and images."
keypoints:
- "`RMarkdown` and `knitr` are powerful tools."
- "Output can be rendered in many formats."
- "You don't need to know HTML!"
output:
      html_document
---



> ## 2. Literate programming
>
> - Organize your work
> - make work more pleasant for yourself? (less tedium, less manual, less ...)
> - reduce friction for collaboration?
> - reduce friction for communication?
> - make your work navigable, interpretable, and repeatable by others?
{: .objectives}

#### Getting the analysis right is only one link

Process, packaging, and presentation are often the weak links in the chain.
![](../media/brokenChain.jpg)


## Markdown

### What is Markdown?

- `Markdown` is a particular type of markup language. Markup languages are designed to produce documents from plain text.
- You may be familiar with `LaTeX`, another (though less human friendly) text markup language.
- Tools render markdown to different formats (for example, HTML/pdf/Word).
  - The main tool for rendering Markdown is [pandoc](http://pandoc.org/).

Adapted from [Carson Sievert's markdown slides](http://cpsievert.github.io/slides/markdown/#/1)


### Markdown enables fast publication to the web

- **Markdown** Easy to write and read in an editor.
- **HTML** Easy to publish and read on web.

### Markdown versus HTML code

<div class="row">

<div class="col-md-6">

<pre>
This is a Markdown document.

## Medium header <!-- header 2, actually -->

It's easy to do *italics* or __make things bold__.

> All models are wrong, but some are useful. An approximate answer to the right problem is worth a good deal more than an exact answer to an approximate problem.

Code block below. Just affects formatting here.

```
x <- 3 * 4
```

I can haz equations. Inline equations, such as the average is computed as $\frac{1}{n} \sum_{i=1}^{n} x_{i}$. Or display equations like this:


$$
\begin{equation*}
|x|=
\begin{cases} x & \text{if $x\ge 0$,} \\\\
-x &\text{if $x\lt 0$.}
\end{cases}
\end{equation*}
$$
</pre>

<img src="../media/smiley-face-clipart.png"/>

</div> <!-- end column left -->


<div class="col-md-6">

<pre>

&lt;!DOCTYPE html&gt;
&lt;html&gt;
&lt;head&gt;
&lt;meta http-equiv="Content-Type" content="text/html; charset=utf-8"/&gt;
&lt;title&gt;Title&lt;/title&gt;
&lt;!-- MathJax scripts --&gt;
&lt;script type="text/javascript" src="..."&gt;&lt;/script&gt;
&lt;style type="text/css"&gt;
body {
   font-family: Helvetica, arial, sans-serif;
   font-size: 14px;
...
&lt;/style&gt;
&lt;/head&gt;
&lt;body&gt;
&lt;p&gt;This is a Markdown document.&lt;/p&gt;

&lt;h2&gt;Medium header&lt;/h2&gt;

&lt;p&gt;It's easy to do &lt;em&gt;italics&lt;/em&gt; or &lt;strong&gt;make things bold&lt;/strong&gt;.&lt;/p&gt;

&lt;blockquote&gt;&lt;p&gt;All models are wrong, but some are...&lt;/p&gt;&lt;/blockquote&gt;

&lt;p&gt;Code block below. Just affects formatting here.&lt;/p&gt;

&lt;pre&gt;&lt;code&gt;x &lt;- 3 * 4&lt;/code&gt;&lt;/pre&gt;

</pre>
 <img src="../media/frowny-face-clipart.png"/>
</div> <!-- end column right -->
</div> <!-- end 2-column row -->

### Markdown versus rendered HTML

<div class="row">
<div class="col-md-6">
<pre>

This is a Markdown document.

## Medium header <!-- header 2, actually -->

It's easy to do *italics* or __make things bold__.

> All models are wrong, but some are useful. An approximate answer to the right problem is worth a good deal more than an exact answer to an approximate problem.

Code block below. Just affects formatting here.


```r
x <- 3 * 4
```

I can haz equations. Inline equations, such as the average is computed as $\frac{1}{n} \sum_{i=1}^{n} x_{i}$. Or display equations like this:

$$
\begin{equation*}
|x|=
\begin{cases} x & \text{if $x\ge 0$,} \\
-x &\text{if $x\lt 0$.}
\end{cases}
\end{equation*}
$$

</pre>

<img src="../media/smiley-face-clipart.png"/>

</div>

<div class="col-md-6">

<p>This is a Markdown document.</p>

<h2>Medium header</h2>

<p>It&#39;s easy to do <em>italics</em> or <strong>make things bold</strong>.</p>

<blockquote>
<p>All models are wrong, but some are useful. An approximate answer to the right problem is worth a good deal more than an exact answer to an approximate problem.</p>
</blockquote>

<p>Code block below. Just affects formatting here.</p>

<p><code>x &lt;- 3 * 4</code></p>

<p>I can haz equations. Inline equations, such as the average is computed as \(\frac{1}{n} \sum_{i=1}^{n} x_{i}\).</p>

<p>Or display equations like this:</p>

<p>\[
  \begin{equation*}
    |x|=
         \begin{cases}
      x & \text{if $x\ge 0$,} \
      -x & \text{if $x\lt 0$.}
        \end{cases}
   \end{equation*}
   \]</p>
<img src="../media/smiley-face-clipart.png"/>
</div>
</div>


## Markdown can be rendered to multiple formats

- `pandoc` is a Swiss-army knife tool for conversion`

![](../media/pandoc-diagram.jpg)



## RMarkdown

`RMarkdown` is rendered to Markdown. The strength of RMarkdown, is that with an easy syntax, it is possible to mix ideas, code, and generated results seamlessly.


### Input

````
This is an R Markdown document.

```{r sec_3}
x <- rnorm(1000)
head(x)
```

`knitr` offers a lot of control over representing different
types of output. We can also have inline `R` expressions
computed on the fly.

The mean $\bar{x} = \frac{1}{n} \sum_{i=1}^{n} x_{i}$ of the
`r length(x)` random variates we generated is
`r round(mean(x), 3)`.

This figure is computed on-the-fly as well. No more
copy-paste, including for figures:

```{r sec_4}
plot(density(x))
```
````


### Output

<p>This is an R Markdown document.</p>

<pre><code class="r">x &lt;- rnorm(1000)
head(x)
</code></pre>

<pre><code>## [1] -3.2538882  0.6478847 -2.3089858 -1.8085141  0.5498946  1.4029523
</code></pre>

<p><code>knitr</code> offers a lot of control over representing different
types of output. We can also have inline <code>R</code> expressions
computed on the fly.</p>

<p>The mean \(\bar{x} = \frac{1}{n} \sum_{i=1}^{n} x_{i}\) of the
1000 random variates we generated is
0.036.</p>

<p>This figure is computed on-the-fly as well. No more
copy-paste, including for figures:</p>

<pre><code class="r">plot(density(x))
</code></pre>

<p><img src="data:image/png;base64,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" title="plot of chunk sec_4" alt="plot of chunk sec_4" style="display: block; margin: auto;" /></p>



## Rendering can be automated is thus repeatable

![](../media/knitrButton-screenshot.png)


From within `R`:

`rmarkdown::render("filename.Rmd")`

From the command line:

`$ Rscript -e "rmarkdown::render('filename.Rmd')"`


## Summary

- `RMarkdown` enables ideas and questions, the code that implements them, and the results generated by the implementation, to all stay together.
- `RMarkdown` toolchain allows automated, repeatable rendering
  - for publishing to the web and viewing through a browser
  - and (through `LaTeX`) to obtain a submittable manuscript (in PDF or Word).
- `knitr` is not limited to executing `R` code. See the book Dynamic documents with `R` and `knitr` by Yihui Xie, part of the CRC Press / Chapman & Hall R Series (2013). [ISBN](http://www.isbnsearch.org/isbn/9781482203530)
