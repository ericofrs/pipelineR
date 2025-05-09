#' Format the data
#'
#' @param .data The untidy tibble containing the stock data
#'
#' @returns A tidy tibble with columns symbol, date, metric and value
#' @export
#'
#' @examples
#' \dontrun{
#' format_data(untidy_data)
#' }
format_data <- function(.data) {
  tidy_data <- .data |>
    dplyr::select(-adjusted, -batch_id) |>
    tidyr::pivot_longer(
      cols = c(open, high, low, close, volume),
      names_to = "metric",
      values_to = "value"
    ) |>
    dplyr::arrange(date, symbol)

  return(tidy_data)
}
