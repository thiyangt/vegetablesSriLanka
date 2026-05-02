#' Visualize missingness in vegetable price data
#'
#' Generates a set of visual summaries to inspect data structure
#' and missing values in the dataset. The function returns:
#' (1) data type visualization,
#' (2) missingness map, and
#' (3) missing percentage by grouping variable.
#'
#' @param data A data frame.
#' @param group_var Character string specifying the grouping variable
#'   for missing percentage visualization (e.g., "Item").
#' @param target_var Character string specifying the variable
#'   to assess missingness (e.g., "Price").
#'
#' @return A named list containing:
#' \itemize{
#'   \item \code{data_structure}: Data type visualization.
#'   \item \code{missing_map}: Missingness heatmap.
#'   \item \code{missing_by_group}: Bar plot of missing percentages.
#' }
#'
#' @importFrom visdat vis_dat
#' @importFrom naniar vis_miss
#' @importFrom dplyr filter
#' @importFrom dplyr group_by
#' @importFrom dplyr summarise
#' @importFrom stats reorder
#' @importFrom ggplot2 ggplot
#' @importFrom ggplot2 geom_col
#'
#' @examples
#' visualize_missingness(
#'   data = vegetables.srilanka,
#'   group_var = "Item",
#'   target_var = "Price"
#' )
#'
#' @export
visualize_missingness <- function(data, group_var = "Item", target_var = "Price") {

  # Data structure visualization
  p1 <- visdat::vis_dat(data)

  # Missingness map
  p2 <- naniar::vis_miss(data)

  # Missing percentage by group
  missing_summary <- data |>
    dplyr::filter(!is.na(.data[[group_var]])) |>
    dplyr::group_by(.data[[group_var]]) |>
    dplyr::summarise(
      missing_pct = mean(is.na(.data[[target_var]])) * 100,
      .groups = "drop"
    )

  p3 <- ggplot2::ggplot(
    missing_summary,
    ggplot2::aes(
      x = stats::reorder(.data[[group_var]], -missing_pct),
      y = missing_pct
    )
  ) +
    ggplot2::geom_col() +
    ggplot2::labs(
      title = paste(group_var, "-wise Missing Data Percentage"),
      x = group_var,
      y = "Missing Percentage (%)"
    ) +
    ggplot2::theme_minimal() +
    ggplot2::theme(
      axis.text.x = ggplot2::element_text(
        angle = 45,
        hjust = 1
      )
    )

  return(list(
    data_structure = p1,
    missing_map = p2,
    missing_by_group = p3
  ))
}
