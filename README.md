# Analysis of Financial Time Series by Ruey S. Tsay (3e)
### A compendium of R script files related to the material from the chapters and excercises of the third edition of this classic book on financial time series analysis by Tsay

This README file is to be updated with new material as and when I complete R related programming tasks from the aforementioned book by Tsay.

In order to load the data source the script file **tsay_3e_data.R** and then load data for the specific chapter.

```{r}
source("tsay_3e_data.R")
```
Next, if you wish to load all datasets fromt the book into memory, go ahead with the following commands:

```{r}
for(filename in list.files("data")) source(file.path("data",filename))
```

Alternatively, if you want to load datasets from say, chapter 4 and 12, you can do it like so:

```{r}
source(file.path("data","ch04data.R"))
source(file.path("data","ch12data.R"))
```

