## Packages
library(readr)
library(tidyr)
library(dplyr)
library(here)


## Read data
rm(list=ls())

# install.packages("pak")
pak::pak("thiyangt/vegetablesSriLanka")
library(vegetablesSriLanka)
data("vegetables.srilanka")
head(vegetables.srilanka)
tail(vegetables.srilanka)


vsnew <- read_csv(here("data-raw", "21_6_2026.csv"))
head(vsnew)
vsnew$Date <- as.Date(vsnew$Date, format ="%d/%m/%Y")
vsnew$Price <- as.numeric(vsnew$Price)


vegetables.srilanka <- bind_rows(
  vegetables.srilanka,
  vsnew
)
head(vegetables.srilanka)
tail(vegetables.srilanka)
## Save
usethis::use_data(vegetables.srilanka, overwrite = TRUE)

