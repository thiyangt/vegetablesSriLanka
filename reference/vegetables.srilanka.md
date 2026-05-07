# Daily wholesale and retail vegetable prices in Sri Lanka

Daily wholesale and retail vegetable prices at Dambulla and Petta
markets in Sri Lanka

## Usage

``` r
vegetables.srilanka
```

## Format

A tibble with 62908 rows and 5 variables:

- Date:

  Date

- Item:

  Vegetable name

- Type:

  Wholesale or Retail price

- Market:

  Pettah or Dambulla market

- Price:

  Price in LKR per kg

## Source

Accessed from Daily Reports - Central Bank of Sri Lanka

## Examples

``` r
head(vegetables.srilanka)
#> # A tibble: 6 × 5
#>   Date       Item  Type   Market   Price
#>   <date>     <chr> <chr>  <chr>    <dbl>
#> 1 2016-08-01 Beans Retail Dambulla   165
#> 2 2016-08-02 Beans Retail Dambulla   190
#> 3 2016-08-03 Beans Retail Dambulla   190
#> 4 2016-08-04 Beans Retail Dambulla   190
#> 5 2016-08-05 Beans Retail Dambulla   190
#> 6 2016-08-08 Beans Retail Dambulla   190
```
