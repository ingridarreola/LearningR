---
title: "Introduction to R Syntax"
output: html_notebook
---
```{r error=TRUE}
calculate_annual_growth <- function(year_one,year_two,pop_y1, pop_y2,city) {
  annual_growth <- (((pop_y2 - pop_y1) / pop_y1) * 100) / (year_two-year_one)
  message <- paste("From", year_one, "to", year_two, "the population of", city, "grew by approximately", annual_growth, "% each year.")
  print(message)
  return(annual_growth)
}
# Write your code starting here:

# Creating Variables
city_name = "Istanbul, Turkey"

year_one = 1927

year_two = 2017

pop_year_one = 691000

pop_year_two = 15029231

# Using Variables to Perform Calculations

pop_change = pop_year_two - pop_year_one

percentage_gr <- ((pop_change/pop_year_one) * 100)

annual_gr <- percentage_gr/90

print(annual_gr)

# Call the function with correct arguments

calculate_annual_growth(year_one, year_two, pop_year_one, pop_year_two, city_name)

# this prints back
# "From 1927 to 2017 the population of Istanbul, Turkey grew by approximately 23.0555250040199 % each year."

```