# Fill gaps in vegetable price time series

Fill missing gaps with NA. The function filters the dataset based on the
selected item, market, and type, converts the data into a tsibble, and
generates a regular time series filling the gaps with NA.

## Usage

``` r
fillgaps_vegetable_prices(data, item, market, type)
```

## Arguments

- data:

  A data frame containing vegetable price data. The dataset must contain
  the columns `Date`, `Item`, `Type`, `Market`, and `Price`.

- item:

  Character string specifying the vegetable item.

- market:

  Character string specifying the market.

- type:

  Character string specifying the price type (e.g., `"Retail"` or
  `"Wholesale"`).

## Value

A ggplot object showing the time series of vegetable prices.

## Examples

``` r
fillgaps_vegetable_prices(
  data = vegetables.srilanka,
  item = "Carrot",
  market = "Dambulla",
  type = "Retail"
)
#> # A tsibble: 3,509 x 5 [1D]
#>    Date       Item   Type   Market   Price
#>    <date>     <chr>  <chr>  <chr>    <dbl>
#>  1 2016-08-01 Carrot Retail Dambulla   155
#>  2 2016-08-02 Carrot Retail Dambulla   155
#>  3 2016-08-03 Carrot Retail Dambulla   150
#>  4 2016-08-04 Carrot Retail Dambulla   145
#>  5 2016-08-05 Carrot Retail Dambulla   145
#>  6 2016-08-06 NA     NA     NA          NA
#>  7 2016-08-07 NA     NA     NA          NA
#>  8 2016-08-08 Carrot Retail Dambulla   125
#>  9 2016-08-09 Carrot Retail Dambulla   135
#> 10 2016-08-10 Carrot Retail Dambulla   150
#> # ℹ 3,499 more rows
```
