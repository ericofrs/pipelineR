start_pipeline <- function() {
  con <- connect_db()
  symbols_vec <- fetch_symbols()
  # summary_table <- build_summary_table()

  collected_data <- yahoo_query_data(symbols_vec)
  tidy_data <- format_data(collected_data)
  message <- insert_new_data(tidy_data)
  summary_table <- log_summary(.symbols = symbols_vec, .message = message)

  push_summary_table(.summary_table = summary_table)


}
