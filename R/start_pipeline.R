#' Start pipeline
#'
#' @param .from Optional. Start date
#' @param .to Optional. End date
#' @param .batch_size Optional. Number of tickers per batch
#'
#' @returns Undefined
#' @export
#'
#' @examples
#' \dontrun{
#' start_pipeline()
#' }
start_pipeline <- function(.from = Sys.Date() - 7, .to = Sys.Date(), .batch_size = 31) {
  con <- connect_db()
  symbols_vec <- fetch_symbols(con = con)
  symbols_string <- paste(symbols_vec, collapse = ", ")
  # summary_table <- build_summary_table()

  collected_data <- yahoo_query_data(.vec = symbols_vec,
                                     .n_stocks_per_batch = .batch_size,
                                     .start = .from,
                                     .end = .to)
  tidy_data <- format_data(collected_data)
  message <- insert_new_data(tidy_data, con = con)
  summary_table <- log_summary(.start = .from,
                               .end = .to,
                               .n_stocks_per_batch = .batch_size,
                               .symbols = symbols_string,
                               .message = message)

  push_summary_table(.summary_table = summary_table, con = con)
  DBI::dbDisconnect(con)
}
