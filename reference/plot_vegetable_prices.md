# Plot vegetable price time series

Visualize retail or wholesale vegetable prices over time for selected
items and markets in Sri Lanka. The function filters the dataset based
on the selected item, market, and type, converts the data into a
tsibble, and generates a time series plot.

## Usage

``` r
plot_vegetable_prices(data, item, market, type)
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
plot_vegetable_prices(
  data = vegetables.srilanka,
  item = "Carrot",
  market = "Dambulla",
  type = "Retail"
)

```
