---
title: "ACLU Child Separations"
output: html_notebook
---

## Key Concepts
- How to import and use helpful R libraries
- How to use pipe %>% as a powerful tool for chaining function calls
- How to add, drop, rename, and filter columns along with other methods to manipulate data

## Load and Inspect the Data

```{r message=FALSE, warning=FALSE, error=TRUE}
# load libraries

library(readr)
library(dplyr)

```

```{r error=TRUE}
# load data
# The data from the ACLU is stored in a csv file aclu_separations.csv. Load the file into a data frame aclu to get started.

aclu <- read_csv('aclu_separations.csv')


```

```{r error=TRUE}
# inspect data
# Inspect aclu with head() and summary().

head(aclu)
summary(aclu)

```

## Clean the Data

```{r error=TRUE}
# select columns
# After inspecting the data frame, the addr column contains the same information that is contained in the program_city and program_state columns. Select all columns from aclu but addr and save your new data frame to aclu.


aclu <- aclu %>%
  select(-addr)


```

```{r error=TRUE}
# view columns
# Print the column names of aclu. Are they clear and descriptive?

print(colnames(aclu))

```

```{r error=TRUE}
# rename columns
# Update the column names of aclu & print column names to confirm
# syntax ------>    rename(new name = old name)

aclu <- aclu %>%
  rename(city = program_city, state = program_state,  number_children = n, longitude = lon, latitude = lat)

print(colnames(aclu))

```

## Add a Column

You are interested in getting an understanding of how far some of the children have been moved from the United States-Mexico border. Since latitude represents how far north or south a location is, you decide to measure how far each detention center is from the border in terms of latitude change. 

```{r error=TRUE}
# add column
# You find out the southernmost point of the border lies at a latitude of 25.83. Create a variable border_latitude with the value 25.83.

border_latitude <- 25.83

```

```{r error=TRUE}
# latitude change
# Add a new column to aclu called lat_change_border which measures the change in latitude from the border to the location of each detention center. View the updated aclu data frame.


aclu <- aclu %>%
  mutate(lat_change_border = latitude - border_latitude)

head(aclu)

```

## Filter and Arrange Rows

Now that you have a column representing a detention centers’ distance from the border, you want to see which detention centers are far away from point of entry. Filter the rows of aclu to find all the detention centers where lat_change_border is greater than 15. Save this new data frame to further_away and view it.


```{r error=TRUE}
# number of children
# 1. Filter the rows of aclu to find all the detention centers where lat_change_border is greater than 15.
# 2. Arrange the rows of further_away by lat_change_border descending. Save this new data frame to further_away.

further_away <- aclu %>%
  filter(lat_change_border > 15) %>%
  arrange(desc(lat_change_border))

head(further_away)

# 3. Next you will identify the detention centers that held the largest number of children. Order the rows of aclu by number_children descending and save the new data frame to ordered_by_children. View ordered_by_children.

ordered_by_children <- aclu %>%
  arrange(desc(number_children))

head(ordered_by_children)

```

## What's Happening in a Specific State?
According to the data, children were sent to detention centers across the United States. What state(s) are you most interested in? Create a variable chosen_state that contains the capitalized two letter abbreviation for a state you want to check. Abbreviations for all the US States are provided in the hint below.


```{r error=TRUE}
# state analysis

chosen_state <- 'NY' 

chosen_state_separations <- aclu %>%
  filter(state == chosen_state) %>%
  arrange(desc(number_children))

head(chosen_state_separations)

```