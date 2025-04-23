log_summary <- function(.user_login = "admin", .start = lubridate::today()-6,
                        .end = lubridate::today()-1, n_stocks_per_batch = 31,
                        .symbols, .message) {
  user_login <- .user_login
  batch_id <- n_stocks_per_batch
  symbol <- .symbols

  message <- .message
  status <- ""
  n_rows <- 0
  if (grepl("^Inserted", message)) {
    status <- "OK"
    n_rows <- as.numeric(gsub("Inserted ([0-9]+) new records.", "\\1", insert_result))
  }
  else if (insert_result == "No new records to insert.") {
    status <- "NOK"
    n_rows <- 0
    }
  else {
    stop("Unexpected error while creating the log summary!")
  }
  pipeline_logs <- tibble::tibble(
    user_login = user_login,
    batch_id = batch_id,
    symbol = symbol,
    status = status,
    n_rows = n_rows,
    message = message)

  return(pipeline_logs)
}
