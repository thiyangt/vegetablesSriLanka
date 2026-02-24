rm(list=ls())
## Packages
library(readr)
library(tidyr)
library(dplyr)
library(here)

## Read data
vegetables.srilanka <- read_csv(here("data-raw", "data.csv"))
head(vegetables.srilanka)
tail(vegetables.srilanka)


vegetables.srilanka$Date <- as.Date(vegetables.srilanka$Date, format ="%d/%m/%Y")
vegetables.srilanka$Price <- as.numeric(vegetables.srilanka$Price)

library(tsibble)
vegetables.srilanka <- vegetables.srilanka |>
  as_tsibble(key=c(Item, Type, Market), ind=Date)
vegetables.srilanka
## Save
usethis::use_data(vegetables.srilanka, overwrite = TRUE)
