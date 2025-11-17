install.packages("pkgdown")
library(pkgdown)
usethis::use_pkgdown()
# Run once to configure your package to use and deploy pkgdown
#usethis::use_pkgdown_github_pages()
# Preview your site locally before publishing
pkgdown::build_site()



## Hex sticker
library(hexSticker)
pic <- here::here("logo", "veg.png")
sticker(
  subplot = pic,                 # your image file
  package = "vegscraper",       # package name text
  p_size = 20,                         # text size
  p_color = "white",                   # text color
  p_family = "bold",
  p_fontface = "bold",
  p_y = 1.0,                           # vertical position of text
  s_x = 1, s_y = 1,                 # position of image inside hex
  s_width = 0.6, s_height = 0.6,       # size of image within hex
  h_fill = "#2E8B57",                  # hex background fill (green tone)
  h_color = "#ffffff",                 # border color
  filename = here::here("logo", "hex.png"),
  dpi = 300
)


## Package build path
devtools::build(path = "C:/Users/DELL/Documents")
devtools::build(path = ".")

