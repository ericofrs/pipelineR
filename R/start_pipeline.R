#' Start pipeline
#'
#' @returns Undefined
#' @export
#'
#' @examples
#' \dontrun{
#' start_pipeline()
#' }
start_pipeline <- function() {
  con <- connect_db()
  symbols_vec <- fetch_symbols(con = con)
  symbols_string <- paste(symbols_vec, collapse = ", ")
  # summary_table <- build_summary_table()

  collected_data <- yahoo_query_data(symbols_vec)
  tidy_data <- format_data(collected_data)
  message <- insert_new_data(tidy_data, con = con)
  summary_table <- log_summary(.symbols = symbols_string, .message = message)

  push_summary_table(.summary_table = summary_table, con = con)
  DBI::dbDisconnect(con)
}
