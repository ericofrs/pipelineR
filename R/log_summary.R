log_summary <- function(.user_login = "admin", .start, .end, n_stocks_per_batch = 31) {
  user_login <- .user_login
  batch_id <- n_stocks_per_batch
  symbol <- fetch_symbols()
  status <- "message" #OK/NOK
  n_rows <- 300
  message <- "message"
  pipeline_logs <- tibble::tibble(
    user_login = character(),
    batch_id = integer(),
    symbol = character(),
    status = character(),
    n_rows = integer(),
    message = character())
  )
}
