
<!-- README.md is generated from README.Rmd. Please edit that file -->

# vegetablesSriLanka <img src="logo/vegetableSriLanka_hex.png" align="right" height="200"/>

## Installation

You can install the development version of vegetablesSriLanka from
GitHub with:

``` r
# install.packages("pak")
pak::pak("thiyangt/vegetablesSriLanka")
```

## Load data

``` r
library(vegetablesSriLanka)
data("vegetables.srilanka")
head(vegetables.srilanka)
#>         Date  Item   Type   Market Price
#> 1 2016-08-01 Beans Retail Dambulla   165
#> 2 2016-08-02 Beans Retail Dambulla   190
#> 3 2016-08-03 Beans Retail Dambulla   190
#> 4 2016-08-04 Beans Retail Dambulla   190
#> 5 2016-08-05 Beans Retail Dambulla   190
#> 6 2016-08-08 Beans Retail Dambulla   190
```

## Data Quality Analysis

``` r
library(visdat)
library(naniar)
library(tidyverse)
```

### Information about the class of the data input

``` r
vis_dat(vegetables.srilanka)
```

<img src="man/figures/README-unnamed-chunk-3-1.png" width="100%" />

### Amount of missings in each columns

``` r
vis_miss(vegetables.srilanka)
```

<img src="man/figures/README-unnamed-chunk-4-1.png" width="100%" />

### Visualise item-wise missing percentage

``` r
vs1 <- vegetables.srilanka |>
  filter(!is.na(Item)) 
gg_miss_fct(vs1, Item)
```

<img src="man/figures/README-unnamed-chunk-5-1.png" width="100%" />

``` r
vs <- vegetables.srilanka |>
  filter(!is.na(Item)) |>
  select(Item, Price)
# Calculate item-wise missing percentage
missing_summary <- vs |>
  group_by(Item) |>
  summarise(
    missing_pct = mean(!complete.cases(across())) * 100
  )
#> Warning: There was 1 warning in `summarise()`.
#> ℹ In argument: `missing_pct = mean(!complete.cases(across())) * 100`.
#> ℹ In group 1: `Item = "Beans"`.
#> Caused by warning:
#> ! Using `across()` without supplying `.cols` was deprecated in dplyr 1.1.0.
#> ℹ Please supply `.cols` instead.

ggplot(missing_summary, aes(x = reorder(Item, -missing_pct), y = missing_pct)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  labs(
    title = "Item-wise Missing Data Percentage",
    x = "Item",
    y = "Missing Percentage (%)"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
```

<img src="man/figures/README-unnamed-chunk-6-1.png" width="100%" />

## Example

``` r
vegetables.srilanka |>
  filter(Item == "Pumpkin") |>
  filter(Type == "Retail") |>
  filter(Market == "Dambulla") |>
  ggplot(aes(x=Date, y=Price)) + 
  geom_line()
```

<img src="man/figures/README-unnamed-chunk-7-1.png" width="100%" />
