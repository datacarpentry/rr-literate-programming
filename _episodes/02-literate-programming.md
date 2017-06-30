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

<pre><code>## [1] -0.5418609  0.3332679 -0.4541914 -0.1069715  0.9231318 -0.3871725
</code></pre>

<p><code>knitr</code> offers a lot of control over representing different
types of output. We can also have inline <code>R</code> expressions
computed on the fly.</p>

<p>The mean \(\bar{x} = \frac{1}{n} \sum_{i=1}^{n} x_{i}\) of the
1000 random variates we generated is
0.006.</p>

<p>This figure is computed on-the-fly as well. No more
copy-paste, including for figures:</p>

<pre><code class="r">plot(density(x))
</code></pre>

<p><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAfgAAAH4CAMAAACR9g9NAAADAFBMVEUAAAABAQECAgIDAwMEBAQFBQUGBgYHBwcICAgJCQkKCgoLCwsMDAwNDQ0ODg4PDw8QEBARERESEhITExMUFBQVFRUWFhYXFxcYGBgZGRkaGhobGxscHBwdHR0eHh4fHx8gICAhISEiIiIjIyMkJCQlJSUmJiYnJycoKCgpKSkqKiorKyssLCwtLS0uLi4vLy8wMDAxMTEyMjIzMzM0NDQ1NTU2NjY3Nzc4ODg5OTk6Ojo7Ozs8PDw9PT0+Pj4/Pz9AQEBBQUFCQkJDQ0NERERFRUVGRkZHR0dISEhJSUlKSkpLS0tMTExNTU1OTk5PT09QUFBRUVFSUlJTU1NUVFRVVVVWVlZXV1dYWFhZWVlaWlpbW1tcXFxdXV1eXl5fX19gYGBhYWFiYmJjY2NkZGRlZWVmZmZnZ2doaGhpaWlqampra2tsbGxtbW1ubm5vb29wcHBxcXFycnJzc3N0dHR1dXV2dnZ3d3d4eHh5eXl6enp7e3t8fHx9fX1+fn5/f3+AgICBgYGCgoKDg4OEhISFhYWGhoaHh4eIiIiJiYmKioqLi4uMjIyNjY2Ojo6Pj4+QkJCRkZGSkpKTk5OUlJSVlZWWlpaXl5eYmJiZmZmampqbm5ucnJydnZ2enp6fn5+goKChoaGioqKjo6OkpKSlpaWmpqanp6eoqKipqamqqqqrq6usrKytra2urq6vr6+wsLCxsbGysrKzs7O0tLS1tbW2tra3t7e4uLi5ubm6urq7u7u8vLy9vb2+vr6/v7/AwMDBwcHCwsLDw8PExMTFxcXGxsbHx8fIyMjJycnKysrLy8vMzMzNzc3Ozs7Pz8/Q0NDR0dHS0tLT09PU1NTV1dXW1tbX19fY2NjZ2dna2trb29vc3Nzd3d3e3t7f39/g4ODh4eHi4uLj4+Pk5OTl5eXm5ubn5+fo6Ojp6enq6urr6+vs7Ozt7e3u7u7v7+/w8PDx8fHy8vLz8/P09PT19fX29vb39/f4+Pj5+fn6+vr7+/v8/Pz9/f3+/v7////isF19AAAACXBIWXMAAAsSAAALEgHS3X78AAAgAElEQVR4nO2deUBU1f7Ar2KhkfGSemk9n7201yv8Ka9fJYuAC+ICgmmBlpZF0qKmpelzweVpCllqVhotrqlpiqaZRiko5pZpRoKSVpqKGyAiO8x5szAzzJ3LcGfuWe85nz+c8S7f75n5cO/ce+5ZJCDgEol0AQRkEOI5RYjnFCGeU4R4ThHiOUWI5xQhnlOEeE4R4jlFiOcUIZ5ThHhOEeI5RYjnFCGeU4R4ThHiOUWI5xQhnlOEeE4R4jlFiOcUvYjPlh5oeGW11MDHdNjrYAevJU5blEje1rfrpdzGSjHLt6ixTWiBH/GdpR9c7zVYCsty2sIs3rxrbccejZYiv9kMVaWlAC7EG8rLVYjvLaU572oX/4W0ofFixP3lmorC0oAexOcP+Evnj00K86Ja/e35InC5/SNp/i1jLgHwfeitd/Q/brbXWZKkL6KkmQDMkcYo7WXaYDpI73Lr7T2PWv4isqQu9l3Bv1tXgSXSHdcv3iJtlJfAtnyXNBf/5/cIHYivfki699EmRlOFfs1igqUuhnzJ6+bOXtIIcOW2JgPCpHvKTfa2/12afXaN9CgAodJ+pb22d5Jez/6jebMej0n3OYo373pOGmA83XeVZo2VYg3yItiWVzQJJfANeIIOxK+XOpUbXjKaSpFGAkMX6Zt8ScoAK6X/Azul+y+CiU//bjtf3/CRLhR5tTMo7WU81W8CmbEpoLK5VOgg3rxrmjTOuFfOTbd5t/zTnLZogZnd5v/Ylrdt7vRXQSc6ED9Z+i8AmUZTz0pm5uVLvgaQI7UHl32lJoEzL9b7oX5a+uQLaaLiXmbxIGdmbFtJuuIsPlVabNptuiS9b0n7q2W/cZb/WZd3k66T+A7cRwfi/yPNMkl6ADwvvbTWyNF8yQ+AXKN4cHXKA5Lkm2cX/7UU+7x0VHEvs/g9zXyGprY0if8nABn1xX9oET9JkuYrFcK6vLtUjO+Ta0EH4ldLD1eA0UaF86SxAOxclmcT/+XI9eBEoLSozt4BAKruvKX1Pw21+fm1TnuZxY+RpoAjxiP+lHRTkeF1u/gDdaf6o16tfG45bU7rcMTblv/dW5zqcVF5n3R/kGRUWHB7s+FPNW11ySb+G6lF3GAfabfZXpA05CQAI02X7leMap32MotPkW4f2FqSzlXdKd3xryZW8aZd/zRd3FU/LM2fIkWY3RbOM5Nhem9bXtEkhOh3oR4diAdn+t320KJ2PQD4pZdvq9gcYD/Vr37ktls6r7DYW3tnU+N9+veSlGMW77SXWfyNQT4PrHiy3VKwy9+n64p2A+rtGmC8nUuR2pZfayUtlZfAtny3NIfEN+ABehDvDmelzh7uqaoCZzAzdbaciU/9t7TQw13VVNlevElU2dJJeJuhZZ7u+0XjD2lmM3PA8yZeYEWI5xQhnlOEeE4R4jlFiOcUIZ5ThHhOEeI5RYjnFCGeU4R4ThHiOUWI5xQhnlOEeE4R4jlFiOcUteK/R1oKAXbUivdBWgoBdhoX39LbhOTtLV9xZb2AYjZUaRSf/ciQ0/n5LfLz5SvWPZUqoJeQUxrFg+o5/plKp/p1HzS+r4AYCZrFA3A8cKQQzxowxIOat592XijEUw0U8UYKt8uXCPFUA0v8XvtV/THL1cPTYz0vlQA5sMTXI89yvxAV41mJBFiAIb62uFZh6dh4T8ojwIRm8eVJHZpJXu2nVchXCPFUo1n8sNisgqqCffHD5SuEeKrRLN7P0qG8uq18hRBPNZrFd9pkfskIkK8Q4qlGs/iDrTvGJcQHtDkkXyHEU432q/qq9NTk1HTnZz2si98/Y0zqRdKFQAeC+/g62BZfNjRh56HlPd4oJV0QVAjxilT2swxOvzY4m3BJUCHEKzJ6ed2bM2HbiBYEGUK8EruG2t6W9F9BsCDoEOIVqOl6yf6fqsG6fMwoxCuw5r/1/1eTMI9UQRAixCsQ6jhlkOHlmYQKghAh3pmMMbIFhjfGMTLMvHqEeGeGnHBalPys69bI7CHEO3G1l8LCFX0LsRcEKUK8E0s+VlqaGfQz7oIgRYh3IkL52D7bY4mefuiFeDn5sQ2sqJrez/WXxRRCvJwlyxpcdSxiwlV8BUGLEC8nypXbzeGjc7CVBClCvIzSnq7XZw4Lm7qrBE9ZUCLEy9g6u7EtKr6b2ie076h30o5X4ygQIoR4GaOcp5FXouTnLQte7NZ7UQHi4iBDiJcRotQ5pCGurQgff63xzWhEiHfkzyfd3GFTIJvj/wjxjqxa7O4eV3qtR1EQ1AjxjiS4f7dWEbMRQUFQI8Q7EuJBtWx5xEH4BUGNEO/AeXd/4s1cDGTv0Z0Q78C6dz3a7VuFoWAoR4h3YPSPnu2XyFwjbCHegTAPK+MKA53GB6AcIb4+pUqNb1SRylpLXCG+PpmTPd2zOpixGjwhvj7JWzzedS1jTbCF+PoM8rxfdG0QW89qhfj6hGjY95MF0IqBAyG+Hhc8qr6poyKwBlpBMCDE12NLipa9p22GVQ4cCPH1mLZTy94XomCVAwdCfD36a6tyH3QaUjlwIMTXo6u23bdPgVMMLAjxdjRd2xmpZenyToi3s22uxgCT0qGUAwtCvJ3ZOzQGOD4MSjmwIMTbGXSp8W1cE8bOsHhCvJ1QzRHeYqfdpRBvozhac4izGi8PMSLE29jj8TNZO92ZOdcL8TYWQThPv8VMS2sh3sYLJ7XHOPWU9hh4EOJthLvTa64hQiohBMGBEG+lpjuMKEla6wJwIcRbOfECjCg/vAIjCgaEeCvrFsGIYghiZGgsId5K0i4oYUYcgxIGOUK8lRg4A1pt0vqkBxNCvBWND+OtlETAiYMaIb6Okj6QAvVho2eFEF/HgXGQAs1LgxQILUJ8HZ8uhRTo50RIgdAixNfxmtNUmR5iCIIUCC1CfB29b8CKNCwPViSUCPF1QLqoN7KSiVmrhHgLhTHQQuUPghYKIUK8hT2T4MUKZqGVtRBvYcln8GK9Cus6ESVCvIVRP8GLtVlT30tMCPEWIsrgxSpiofekEG8B3kW9kXAGJqkT4s1ceRxmtPH7YEZDgxBvJhNqR9etc2BGQ4MQb2bxapjRrvWDGQ0NQryZkRAv6oHnA2RiRIg3A/Oi3shY+u/khXgzUC/qAUijf4BTSOIV7l9YEn91ANx4VyDHQ4Bm8RcTu04637lpkNPAPyyJh9Ff0gG35rIigmbx/aLWDWuTWvhmX/kKlsR/uApywMRfIAeEjmbxvldB9i2VoOZO+QqWxL/q4fwEDbLiQ8gBoaNZ/N/yQPVGAC61ka9gSXxv2N3af6N+NBzN4pe0MDUkX+7vVPXFknjtg6DIgXybAB/tV/W5K4z/LElz6jLGkPgi7YOgyHnyHPSQcIF1H1+4Xb6EIfHfT4QecuE66CHhAkv8Xm/b2x+SzXRl4am0hU+WQw95aAz0kHBBUHP323ozUbGelYgAr8OfKbIqHHpIuMAQX1usVF3B0Km+73X4MSMoH/9Ks/jypA7NJK/205zmXWNIPPyLegAm7UYQFCKaxQ+LzSqoKtgXP1y+gh3xJU61jhDYkowgKEQ0i/ezPNCsbitfwY74Q68hCHqZ8ksczeI7bTK/ZATIV7AjfvnHKKIGowgKD83iD7buGJcQH9DGqekBO+Info8i6jDX3yxptF/VV6WnJqemOz+QZ0d8/yIUURdD7JuDANECB1W9+pHRSMLCQogHpb2RhK3uhiQsLIR4cORVNHF7lqOJCwchHqxC1GjiDSTXjLAQ4sHkPWjibpiPJi4chHgwAM6Qlk6co/oLEOKR1NSb0TIpOXKE+PJeqCIPzEcVGQJC/E+jUEVO+RJVZAgI8WuQjU6WCbubBkyE+KmZqCKXoKkZgoMQP+AKstChFHekEuIRtoB/IQddbK1wL74c4cQCH8FvvQsN7sUfRXZRb7xhoHhKKu7Ff4awe2NNOLrYWuFe/CRENfVmKH5Ax734/gUIg4/bjzC4NrgXj7Rb6+dQJjFEAu/iS2FNPqUIxd3keRf/A4o29Xbo7SbPu/ilnyINH1WINLwGeBc/7gDS8NO/RRpeA7yL71OCNPy2N5GG1wDv4hH/CMMeOREenIsvgDf5lDLUNr/iXDzcceoVGPwn4gSewrn499cgTvDORsQJPIVz8YnHESfI+g/iBJ7CufhuqKcNKo1EnMBT+BZvQNam3gatza/4Fv/7UOQpRlDa/Ipv8V+in0mC1uZXfIuf9Q3yFLQ2v+JbfNwF5Cmqw5Gn8Ai+xaO/tgOgJ9wJrmDBtfgyHF1dKJ1vlGvxh8ZhSPLFQgxJ3Idr8R+txJDkzBAMSdyHa/Ejj+HIQmfzK67F96zEkQVhr0wN8CzeEIYlzZyvsKRxE57F//ocljQ7k7CkcROexW/Ac719HcVw+JrhWXxSBp48VD6g41l89DU8eah8QMezeBwVtiY+WYopkTtwLP7SE5gS/fIipkTuwLH4HbMxJarFdWpxB47Fz3aaFRUVvYtxZVIPx+IHYRtxNOk7XJnUw7F4fCfgr2dhS6UafsUXou49ZaeIwvmV+RX/7Qx8uYLpq8LhV3zKFny5XkDdYcd9+BUfdx5frqVI5rLUBL/icbaPOInnOaA7cCu+AOeQBQb6uslzK34H1lusAZdxZlMDt+JnYau3MzFvE85sauBWfAyiSceU2TceZzY1cCse769uZXes6VTAq/g/B+PN16sUb75GUSd+bFaN25HpFv/FArz5pu7Cm69R1Imf4n/Xi+lujhpCt/gJmGf8TcdYQawKtaf6vHkhfs9sdqfjJ93icfdhpW4qMrXiSzYn3vHPkFbr1EemWjz+XuvdsPTaUY868fMjbu254FcAfrxbfWSqxR8diTvjeMpmk1cnfsgGU+OhClDlRj0E1eIXr8Kdcesc3Bldo068v+mf8nvciky1+OF5uDNeo6w/jRrxXl6Sl4nH3YpMtfgQA/aUlP3Iqzvio11sYig0fYmGIvlymsVfxdfsysYbe/HndIHmmrvjDzb5x0bj74DTljSLJ/GDS1mLSzXiffb4W1DaIiylcuddWYyJn0ygHq2ErlFt1YjfXpBtQWkL3xoA0v5VyZb4niRqzntQNe6ZylP9CUPlhk8Vr07aG+9PDQNfYUp8VTiJrHR1q1AnfmqL6rkPPjZCaYv1LbtfBQWPPMyS+ENjSWTNpGroenXiW5023LO/8E7FTc6nlQBQuX6CfDnF4t/ZQCJrZTcSWRtCnfjbC35oXXPd18WGhU4tmSgWPxD9ELZK9KNp+Ct14kd0ui/lUhdXHYH2etveHkg205Wyqio7BkIjz81fTyavIurEV69fU3V+rsqRQ/781sxAaqdcO/E8mbzZihdJhIDR9Kq2WKlrGL2n+o+XEUocRCivEurEbw801d+MUtqiPKlDM8mr/bQK+Qp6xT/j+jOj47lcQokVUCf+H8tzcnNzTyhtMSw2q6CqYF/8cPkKesUHkkr8OeaGfq5QJ97FMw0/S31UdVv5CmrFkxtOuqAfqczOqBOf0vDcLZ0sbTMyAuQrqBW/cgmx1ESqipVRJz7s5tYPNfCQ5mDrjnEJ8QFtDslXUCs+gdwv7aytxFLLUSfexUMaUJWempyq0PaaWvEEGmFYOULPlFRqb+dqr7j7ddEq/izBchmCyeWWoU782e4+/rkhp92KTKv4FeR+4gEY8TPB5A6oE//ExAr/mjd7uhWZVvHPniSYfDM1bW3Vif9rFfAHVbe7FZlW8UTPtjd6kMxeH3XiO2YZxf/4oFuRKRWf9wzR9P0vEU1vR5347/wG+w33+9KtyJSKX4JjyrGG+fBTountqLyqv/TJ9MVn3ItMqfgnzhFNf869zgno4G1gBOJDiIdRUnmnSvyPcR18OsQfcS8yneIPjSZcgNnu/WAiQ434XbdN3p27e4pvhluR6RQ/l/T3nk3JWIdqxD/2mfn9GvceZ9IpvhfxOQOCq0mXwIwa8c1LzO9Lb3ErMpXiSyJIlwBMyCBdAjOqesvW/cfbxYbOUCn+K1zz0DTM/jGkS2BGjfimdQ/nbnIrMpXiR/9AugTAEETu6WA91Ij3teJWZCrFh1AwY8BI8n98gLf7+NNPky6BkZ2TSZfABF/i3/+MdAmMVFMxhjlf4vtT0Ynp+V9IlwBwJr6MjoeiX80kXQLAmfit5G/mTFTR0G2WK/EvHSVdAgtPkerKUw+exFNyBw3AhhTSJeBL/JGXSJegjlIKpi3gSfyMbaRLYOWJs6RLwJX40HLSJbCy+l3SJeBJ/JknSJfARjH5Me84Ev8u9hGrGyYa29z1DcGR+D4FpEtg52Pik83yI76ApsGYLrsaFhoL/IhfTrLPnBORKkeSQgY/4mOI/6zWZ+FqwgXgRvw18hfS9fnjScIF4Eb8ykWkS+AI6UoFbsTHnCddAkdmEq5G5EV8US/SJZDxUyLZ/LyIX/YB6RLICSLb7pMX8f1o6Zdu49X9RNNzIv4iTbU3FnZOIpqeE/HvLSddAieqCA2eXgcn4ruTrihTYMivJLPzIf4URWWxsWYhyex8iJ9Oz1CidsjONsuFeEOQ84irFEC0rz4X4vcQmW6sUeYRmQyrDi7EJ1DSnl5GDslRUXgQX0p6pKuGINnOnwfxKymaEcSBUQR7yvMgPvIy6RI0wNcEe09yIP5X0m0eGqSMYI8aDsRP3kG6BA0SRe7Rkf7FVxN+/umK98i1vNO/+M00DEPQAKfJjaGuf/Ex5DsoNgy5Ubh0L/5MLOkSuGLUYVKZdS8+icbnMza2vkkqs97FVwfWkC6CK24QG1tX7+I3UXxpZ6I3qSd0ehffj+xMJI2SsolQYp2LPzWIdAka4acXCSXWufgJDU+DTQeGIEKJ9S2+guJauzqG5ZHJq2/xq98iXYJGWfU+mbz6Ft+LikGLXXKRUAWTrsX/MpR0CVQQSqYhqK7Fj8oiXQIVTNhDJK2exd+gYkaAxvh2KpG0ehb/6XukS6CGcjKDmOtZfDcKO8wp0LeQRFYdi/8pgXABVEKmX4WOxSceJFwAlRwjMiiKfsWXkO1/rh4ytbb6Ff/RYrL51UOk1la/4sOJzxutllUkBmbSLD7XinwFYfFHnyea3h3yBxBIqll8pNT8LjPyFYTFv0J2UCm3IFFrq/1Un9hAUwKy4stYubQzMZ5A1bJ28RnJysvJiqe2h6wS6Un4c+r14i7yKsnsblJOoPMkLPGF2+VLiIrPG0wwuftE4Z81BZb4vd62t7snmnm0j+el0szEdILJ3Wf+euwpEZzqLx82M2SgZyWCQXUg9W3tHMjB/1gBhvjaYqWvmeSpfst0crk9Ihj7aDiaxZcndWgmebWfViFfQVL8oN/I5faIEdm4M2oWPyw2q6CqYF/8cPkKguIv9yaW2kM2zsOdUbN4vzLzS3Vb+QqC4udTNKekOq5hvxLWLL6TpfNXRoB8BUHxXUuJpfaUXiWYE2oWf7B1x7iE+IA2h+QryIk/PIJUZs+ZuxlzQu1X9VXpqcmp6c6PGciJH8nQ8xkr2DtP6rDKtjyYUGItYG+Go0Pxnzfw1IhuEo/hzadD8dGUTS2oji/n4M2nP/Hn+pPJq5EbPfDm05/4ufgfeEChP97hTXUn3hDkVHnMBh8uxZpOd+L3jiaSVjvnH8eaTnfiE44QSQuBbmU4s+lN/A1apyFpnDexVt7pTfzSRSSyQiHnWZzZ9Ca+J0uNLGWE4GxerzPxJ4cQSAqLqTgH5dOZ+AlsNbJ05CjOp4r6El8dzFYjSxldMZ7r9SU+bRb+nBCZ6tQ5AR36Eh9F+VjVjZCDcYoaXYn/DW/lF3xC8bUZ05X4SRhPlUiYtxZbKj2Jr2Ss/4wzF/A9UtaT+M8xt2VAAL5GJHoSH0luwk5YrMPWbExH4n8ehjkhAiqwTSmvI/GsDGjoknE7MSXSj/gCgnNywyPvCUyJ9CN+7hq8+RARhWkqXN2Ir+xCZqYH2Hw9EU8e3YhfSf+8Q6owhFzHkkcv4g2hbAxO3zjL3sGSRi/it4/HmQ0llYHlONLoRXwk28/l6vMBlpnodCJ+L5HB/tFQEYijnbVOxEefxpgMNUvnYkiiD/EHnIZeYpmarhgeOuhDfPSv+HJhYCeG8Q51IX4Pg4PeuGTIXuQpdCE+4gy2VHi4EIy8y68exG99HVcmbCxDXnGrA/E1IQx3m2qIgbsRJ9CB+FSd1NI7cCXoMtoE7IsvZnUIDNfs61ONND774sdtxJMHNx+NRBqeefG5fbGkIcDYhSijMy++r9NMh3qhNu5zhNFZF78WU4MVElT024YuOOPii4JuYMhCihu90HX3Z1z8i19hSEKO6z2RDZLBtvg9T6HPQZTrvVCd7ZkWXxaMuJaDPDd6p6EJzLT48auRpyBOWQyaD8my+P2sj4Ogisq4j1CEZVh8WdAFxBnooOaZ+QiiMiz+NXzDR5Cl9uWZ8IOyKz6DrQmjtWB4Yxz03tPMir8WqMOn8A0y6yXYo7wwK34o6wMducfCoZCf0rIqfu0olNEp5NPH4fasYlT8mRCso/rTwIY+ULvRsim+phfmWdpoID0cZj0lm+JnsDsdgQYOBP8OLxiT4jMH4hobii5yA+FNuMOi+EuBBahCU86F0B2wQjEovjbqe0SR6ed6/yWQIjEofjqKqmtWqBk9Gs4NPXviv4rn8wfeSmrvKzDCMCf+RNcSJHHZYW/gIQhRWBNfFOy6wDyQ3+dd7Sc9xsRX9c1AEJU1aqYP0FyXw5Z4w/Dl8IOySFbgVo0R2BI//k34Mdnk+ohntD2WZkr8DN2MYgiB74KWa/mlZ0l80ljYEZmmLKnnD57vDUN8bbFS8xDY4mtHT4IbkH1+G/y0x/c4msWXJ3VoJnm1n+Y0OgFk8cUDuHwi1wiH+j3v4UhvmsUPi80qqCrYF+80xCBc8UeDWZ4uGCH7BsR5NDaaZvF+lqYw1W3lK2CKr5zV50940XRG7iuh77n/uFKz+E6bzC8ZAfIV8MTXrgv6iO/6+Ua4sTQydmWhe/toFn+wdce4hPiANk71x7DEX10UPE0vkxCg49x7fSLnHnTjwZ32q/qq9NTk1HTnCWHcEl966XTe4cOHT5w+V1j/2D6X/t/IfsvwzbTLNCVbxob3npJ2Wt3JEdZ9fKFTM/fGxJdf+CVz/fvTXxnYLTw8vO+TLyQmjk9MTIyLjQgL69Y9NDSiS8/Q7oNnfY1nhha9UJI5/5mwsMFTP/762AXXkzPBEr/X2/Y2Y6KZRwdUOzB1lImEoUMfj+4VHdm7T+yzr81evD7zl/yqagFczmatnjf+2ag+fXtHRscMHTrc/M2nOm7zEvyau6uHzcySTfF78vCp00YuFxZ5EFPgKSWFl01f++kjstsidDV36z5QWzYBAdDV3AnxVIOu5k6Ipxp0NXdCPNWgq7kT4qkGXc2dEE816GruhHiqQdcCR4inGiGeU4R4ThHiOUWI5xR04nd0joiI6HhrKyzcprM8vvdGIOaB86jEm9m0QGMAlWx5G0+ebSl48uyY0/g2SBHiHRHiVSLEe4YQrxIhHjJCvCNCvEqEeM9gXvwWTB3etmH6A9uB6Q/sW0x/YA2iVXw13CGXG86DaUzjGlx5SPcl0CpewChCPKcI8ZwixHOKEM8pQjynCPGcIsRzCgTx2S21x2icLzr4dstBnuVQwB3P4KiSwvNpXKFdfPUj3o1vpJkLLffWJD+EeqCcqtZppTFJiJMAXJ/GJdrFzxmCQ3xadwAqm7g5/o/bpHcEIOt+xEkArk/jEs3ijz90Cof4kqsA7PwH6mMkNQ6AgmawZ3l1Bs+ncYlW8TWBmfk4xANg2PTXDahzJCcYT/dSMeo0AM+ncYkW8R+3b7/u7ZEAuXhTHlAw6IEsxHmMR3y88Yj3Qn/E4/k0LtF6xD/t49NC8kE/XVjloy9XIk8C0gMA2NcefR48n8YlEG7nsJzq1z9cbgT5VX2bjOrB0xAnAbg+jUtYET9RMoF8PK1Dnf+G4z4e06dxhai54xQhnlOEeE4R4jlFiOcUIZ5ThHhOEeI5RYjnFCGeU4R4ThHiOUWI5xQhnlOEeE4R4jlFiOcUIZ5ThHhOEeI5hVHx+dL7xn839ZQvNzyaC2xdHx1frBRJTb1uCtijELTIz/5+u49tkRfI9lfY2h7W2gPSkvz3Hr5BJwFI63Bb9EVPPx4GWBXf5PbzCuIzX5BybV0fHV9sFElF4I/BbRTaNtcXX7DHtkhZvD2stQekJbnBf1XFlHBwpfnmwkHPaf2YCGFVvM+YJxXEJ7/YPNfW9dHxxYZJPPjtpgqw8G6fx06A7LCUmPY7gGHe3e3m+oHO28BbzStB6Gqj67pF0ZL/4Qcntv37N46p7GGtPSAtyb//t/GP4hQ4cJfxTPAI4m9BC8yKv37PNoVTPbgr19b10fHFtoVJ/MUZw8A572NlIxJB9s07wLJA8O1dx6/39gOvTwIDbz1Y2SLfKL5ukemIl5bUJgU7JrKHtfeANCX/NGrIvdGnQcmdq85Gj0f7JWiCWfFg472lFvEnOps4YVlh+u7ruj46vth2Nf3GN226EZSfB6WvxYPs1gDk+INXpgOwzw9sCzXc+/KC/R1NZ/e6RSbxrWrBT/6OueqHtfaANCf32lQ8+VEA3pO877iM8RtxF3bFG/pPbOiIt3R9dHyxbWE64g2HvY/UzHz4/8OM4h8CINcfDFxm/LH2AyW35nXZ+OQ7Y0zi6xaZxBu3kf/O1wtr6wFpSr4kEoDypgWZD+ZWfNgZ2efXDrviwR++s5TF13V9dHyxYf6NB2EfrOt4FiyPNws1ih81A4CDRsshr465eM/ArabF1kWWizu5eHtYew9IU/KvewFQ4VU8bQwAtc0oPuQZFg/mtTCLz/U3kWtZYfru67o+Or7YMB/xx1vsWxhZcyY8yip+V5uTZf3vAGCaz1pwv2+xabF1kVe5Xbw9lzXs3kJ7D0hT8srW39XOCANftT964937iHaLdA3L4qs6KxbM2rAAAACUSURBVB/x1q6Pji9WiqSbvW++511wNeyvj20I2GgSemIUMLx9T7vFxoN1t/Q7eC7I7Nm6aMDdhxWOeGtY7+32HpDm5Ps6+UX+AcDCdr7hP6P7AjTDqHiBVoR4ThHiOUWI5xQhnlOEeE4R4jlFiOcUIZ5ThHhOEeI5RYjnFCGeU4R4ThHiOUWI5xQhnlOEeE4R4jnlf0qgBQ9Kx+JfAAAAAElFTkSuQmCC" title="plot of chunk sec_4" alt="plot of chunk sec_4" style="display: block; margin: auto;" /></p>



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
