progressr::handlers("cli")

#' Query data from Yahoo finance
#'
#' @param .vec A vector with the tickers
#' @param n_stocks_per_batch An integer that sets the maximum number of tickers per batch
#' @param .start A date "YYYY-MM-DD" for the beginning of the data extraction
#' @param .end A date "YYYY-MM-DD" for the end of the data extraction
#'
#' @returns
#' @export
#'
#' @examples
#' \dontrun{
#' tickers <- c("A", "AAPL", "ABBV")
#' yahoo_query_data(tickers, n_stocks_per_batch = 1, .start = "2025-01-15")
#' }
yahoo_query_data <- function(.vec,
                             n_stocks_per_batch = 31,
                             .start,
                             .end = lubridate::today()-1) {
  symbol_list <- split_batch_maxn(.vec, n_stocks_per_batch)

  result <- progressr::with_progress({
    p <- progressr::progressor(along = symbol_list)

    purrr::imap_dfr(symbol_list, ~ {
      p(message = paste("Batch", .y))
      tidyquant::tq_get(.x, from = .start, to = .end) |>
        dplyr::mutate(batch_id = .y)
    })
  })

  if (nrow(result) == 0) {
    warning("Query returned no data. Check your dates or ticker list.")
  }

  return(result)
}
