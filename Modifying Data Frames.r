---
title: "Modifying Data Frames in R"
output: html_notebook
---

```{r message=FALSE, warning=FALSE}
# load libraries
library(readr)
library(dplyr)
```

```{r message=FALSE}
# load data frame
dogs <- read_csv('dogs.csv')
```

```{r}
# inspect data frame
head(dogs)
```

```{r}
# add new columns, drop existing columns and arrange
# 1. Save the result to dogs, and inspect dogs using head().
# 2. Add breed back into the dogs data frame
# 3. Arrange the rows of dogs by descending popularity change from 2015 to 2016. Save the result to dogs.


dogs <- dogs %>%
  transmute(breed = breed, height_average_feet = ((height_low_inches+height_high_inches)/2)/12, popularity_change_15_to_16 = (rank_2016 - rank_2015)) %>% # To easily arrange dogs, pipe the transmuted data frame into a call to arrange():
  arrange(desc(popularity_change_15_to_16)) 


head(dogs)


```