## Packages
library(readr)
library(tidyr)
library(dplyr)
library(here)

## Read data
rm(list=ls())
vegetables.srilanka <- read_csv(here("data-raw", "data.csv"))


vegetables.srilanka$Date <- as.Date(vegetables.srilanka$Date, format ="%d/%m/%Y")
vegetables.srilanka$Price <- as.numeric(vegetables.srilanka$Price)


## Save
usethis::use_data(vegetables.srilanka, overwrite = TRUE)

