# Literate Programming

**Estimated Total Time**: 1 hour 25 min

[Literate programming intro slides](slides/lit-prog-slides/)

**Outline notes for slides**

* Motivating example: a small report written with Word, possibly based on last exercise from morning
    - E.g., one page report about one country from Gapminder
    - What if you want to change to a different country? Rewrite some text, remake a figure, re-insert new figure.
    - This is a drag and error prone. This is the problem R Markdown can solve.
* Preview a diagram that will appear repeatedly (in various forms). Here's the most detailed form in words:
    - foo.rmd --> foo.md --> foo.docx or foo.html
    - RMarkdown --> Markdown --> Word or HTML or ...
    - whole process = "Knit HTML" button in RStudio or, in code, `rmarkdown::render()`
    - under the hood, rmd to md is "knitting" via the `knitr` package and md to ??? is done by pandoc
    - conceptually, "knitting" is running chunks of code and dropping the result into the Markdown file -- this is automating what used to be manual drudgery
    - conceptually, the pandoc step allows us to re-use the same analytical code to produce output in different target formats, for different uses and audiences
* show how rmd, md, docx or html look
    - juxtapose same content in two forms to emphasize what's same and different
    - juxtapose same form (e.g. Markdown) in two settings (e.g. text editor vs on GitHub) to emphasize how current eco-system of tools smile on this workflow
* approaches for running all or parts of this magical workflow
    - buttons in RStudio
    - commands: `rmarkdown::render()` or the Rscript version
    - how to control output format via RStudio vs YAML frontmatter vs args to `render()`
* glossary at end, e.g. knitr is an R package, knitting or rendering means to convert from Rmd or md to an eyeball-ready format

### Introduction / Motivation

Brief Introduction touching on main motivation points.

1. Making your code understandable to your future self and others
2. Reduction of tedium and manual processes when making changes to
   experiments
3. Functions as a scientific notebook
4. The data, figures and rationale for each project are all in one
   place and can be copied and edited when writing your papers. This
   saves time!!

### Activity

**Part 1 - Open Document and Run Code**

The purpose of part 1 is just to get learners to refresh what they
learned in intro-02 exercises: opening a file, running code,
understanding the r-code tags, re-oriented to the Rstudio environment,
ect.

Ideally they can download the entire
[literate programming folder](files/lit-prog/) and work within this
directory as the working directory. Have learners open up the
[countryPick4.Rmd](files/lit-prog/countryPick4.Rmd) file. Advise
them to read through the `.Rmd` file and run each code chunk.

Those that are already familiar with RStudio can start manipulating
the code right away. Guide learners to the line where they can change
the countries and let learners play with running different choices:

```r
    countryName1 <- "India"
    countryName2 <- "United States"
    countryName3 <- "Nigeria"
    countryName4 <- "Germany"
```

Show learners how to look at the data to choose the countries

```r
    levels(gapMinder$country)
```

This is where they can start alone exploring the script.  Running the
code. Give learners a around 10 to 20 minutes to just run the code and
make graphs.

**Step 2: Save new report and knit**

Purpose: Explore input and output files

* What is the input file? *.Rmd*
* What is the output file? *.html*
* Which file can you delete while still being able to fully reproduce
  the result? *You can always delete which ever file was created after
  knitting, in this case the `.html` file*
* What are all the files that were needed to re-create the HTML file?
  *In this case the `gapminderDataFiveYear.tsv` and the `.Rmd` file.*
