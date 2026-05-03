## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----example------------------------------------------------------------------
library(vegetablesSriLanka)
data("vegetables.srilanka")
head(vegetables.srilanka)
tail(vegetables.srilanka)

## -----------------------------------------------------------------------------
filled <- fillgaps_vegetable_prices(
   data = vegetables.srilanka,
   item = "Carrot",
   market = "Dambulla",
   type = "Retail"
 )
filled

## ----message=FALSE, warning=FALSE---------------------------------------------
plot_vegetable_prices(
   data = vegetables.srilanka,
   item = "Carrot",
   market = "Dambulla",
   type = "Retail"
 )

## ----warning=FALSE, message=FALSE---------------------------------------------
visualize_missingness(
  data = vegetables.srilanka,
  group_var = "Item",
  target_var = "Price"
 )

