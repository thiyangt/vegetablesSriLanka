#' Fill gaps in vegetable price time series
#'
#' Fill missing gaps with NA. The function filters the dataset based
#' on the selected item, market, and type, converts the data into a tsibble,
#' and generates a regular time series filling the gaps with NA.
#'
#' @param data A data frame containing vegetable price data.
#'   The dataset must contain the columns \code{Date}, \code{Item},
#'   \code{Type}, \code{Market}, and \code{Price}.
#' @param item Character string specifying the vegetable item.
#' @param market Character string specifying the market.
#' @param type Character string specifying the price type
#'   (e.g., \code{"Retail"} or \code{"Wholesale"}).
#'
#' @return A ggplot object showing the time series of vegetable prices.
#'
#' @importFrom dplyr filter
#' @importFrom dplyr mutate
#' @importFrom tsibble as_tsibble
#' @importFrom tsibble fill_gaps
#'
#' @examples
#' fillgaps_vegetable_prices(
#'   data = vegetables.srilanka,
#'   item = "Carrot",
#'   market = "Dambulla",
#'   type = "Retail"
#' )
#'
#' @export
fillgaps_vegetable_prices <- function(data, item, market, type) {

  filtered_data <- data |>
    dplyr::filter(
      Item == item,
      Market == market,
      Type == type
    ) |>
    dplyr::mutate(
      Date = as.Date(Date)
    ) |>
    tsibble::as_tsibble(index = Date) |>
    tsibble::fill_gaps()


  return(filtered_data)
}
