# Literate Programming

## Overview and learning objectives

Students will work through activities highlighting the motivation for and value of [literate programming] as a concept, and as its implementation in `RMarkdown`. Through this, students will get introduced to the concepts of executable documentation and automation. Students will also learn about best practices for structuring spreadsheet-type data files, and the importance of documenting all changes one makes to data. Finally, students will be introduced to combining all these ideas to create automated, executable, and self-documenting data quality insurance and control reports.

At the beginning of the session, students should
- be familiar with `Rstudio`: `Rstudio` layout, running `R` commands, and running `knitr`.

At the end of the session students will be able to

- Distinguish between a spreadsheet formatted properly for later analysis and one formatted improperly.
- Recognize and correct common data entry errors.
- Describe the concept of 'raw data', and its implications for reproducible and sound data management.
- Apply the concept of literate programming to produce executable documentation of data management and analysis.

## Overview and recap

- Recap about markdown, `RMarkdown`, `knitr`, and virtues of literate programming from the demonstrations in the Intro lesson:
  [slides](slides/lit-prog-slides)

### Activity - Using R and Rmarkdown to clean and plot data

Objective: through hands-on interaction and modification, develop familiarity with `RMarkdown` and *knitting* the output.

Students `knit` and modify. Using
[countryPick4.Rmd](files/lit-prog/countryPick4.Rmd) as a template, students learn how to import data, filter to one country, make a plot, write it to file, and comment data choices.  Then the activity will illustrate what happens when you `knit`:
- Preview/Knit HTML, note what sorts of outputs are left behind.
- Discuss input and output files.
- Which files can we delete and reproduce? Which files are inputs, outputs, converters of inputs to outputs?

This section is meant for students to explore the power of writing reports in `R`.

## Documenting data modifications

Lesson: [01-programatic-modification](01-documenting-data-modification.md)

### Activity - Cleaning up data in Excel

Students identify poor and good data formatting practices, and will learn the importance of documenting modifications. This will lead to making modifications in a self-documenting and executable way.

### Applying literate programming to produce executable documentation

- Lesson: [02-literate-programming](02-literate-programming.md)

## Resources and useful links

### Relevant scientific papers

- EP White, E Baldridge, ZT Brym, KJ Locey, DJ McGlinn, SR
  Supp (2013) "Nine simple ways to make it easier to (re)use your data." Ideas in Ecology and Evolution 6(2):
  1–10, 2013. doi:[10.4033/iee.2013.6b.6.f] *(in particular the   section "Use standard table formats")*

### Best practices for spreadsheets

- [Good practice guidance on releasing statistics in spreadsheets](UK Government)

## People and credits

This lesson was first created as a part of the [Organization1 lesson] at the [1. Reproducible Science Curriculum Hackathon], and was later split out into its own lesson. The corresponding author is **Hilmar Lapp ([@hlapp])**. See the commit log for other contributors.

Please post feedback and issues with the lesson on the repository's issue tracker. For instructor questions about teaching this lesson, you can also contact the corresponding author directly.

## License and Attribution

- [Gapminder data](http://www.gapminder.org/data/)
- Processed and subset (population size, life expectancy, GDP per capita; only every 5 years only starting 1952, only complete records)
  [Gapminder data as `R`  package](https://github.com/jennybc/gapminder). The [data-raw](https://github.com/jennybc/gapminder/tree/master/data-raw) sub-directory reveals the journey from Gapminder.org's Excel workbooks to increasingly clean and tidy data.
- clean dataset can be located in R in the following way (after installing the package):
~~~
pathToTsv <- system.file("gapminder.tsv", package = "gapminder")
~~~
{: .r}

[@hlapp]: http://github.com/hlapp
[1. Reproducible Science Curriculum Hackathon]: https://github.com/Reproducible-Science-Curriculum/Reproducible-Science-Hackathon-Dec-08-2014
[Organization1 lesson]: https://github.com/Reproducible-Science-Curriculum/rr-organization1
[10.4033/iee.2013.6b.6.f]: http://dx.doi.org/10.4033/iee.2013.6b.6.f
[CC Zero]: https://creativecommons.org/publicdomain/zero/1.0/
[literate programming]: https://en.wikipedia.org/wiki/Literate_programming
[1. Reproducible Science Curriculum Hackathon]: https://github.com/Reproducible-Science-Curriculum/Reproducible-Science-Hackathon-Dec-08-2014
