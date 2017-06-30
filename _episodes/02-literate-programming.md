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

<img src="{{ base.site }}/media/smiley-face-clipart.png"/>

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
 <img src="{{base.site}}/media/frowny-face-clipart.png"/>
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

<img src="{{ base.site }}/media/smiley-face-clipart.png"/>

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
<img src="{{ base.site }}/media/smiley-face-clipart.png"/>
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

<pre><code>## [1] -0.2569155  0.9110832  0.6181185  0.4479316 -0.2443289  0.4163217
</code></pre>

<p><code>knitr</code> offers a lot of control over representing different
types of output. We can also have inline <code>R</code> expressions
computed on the fly.</p>

<p>The mean \(\bar{x} = \frac{1}{n} \sum_{i=1}^{n} x_{i}\) of the
1000 random variates we generated is
-0.012.</p>

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
