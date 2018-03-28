# CV_Dashboard
My Curriculum Vitae as a dashboard, in R and LaTeX.
See **dashboard.pdf** in order to have an idea of how it should be.

![My CV](/img/cv.png)

## How to use

Requires:

* R Studio, or similiar; 
* A LaTeX distribution;
* R interpreter and the following libraries:

```r
install.packages('knitr', dependencies = TRUE)
install.packages("RColorBrewer")
install.packages("wordcloud")
install.packages("fmsb")
```

Personal data are stored in the ***.csv** file (one for each plot).

Open **dashboard.Snw** in R Studio and compile it.
