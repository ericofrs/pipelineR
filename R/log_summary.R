#' Log summary
#'
#' @param .user_login Optional. A String containing the username
#' @param .start Optional. A Date with the starting date
#' @param .end Optional. A Date for the last day
#' @param n_stocks_per_batch Optional. An Integer with the number of ticker per batch
#' @param .symbols A Vector with all the tickers
#' @param .message A String message that has been prompted by the insert_new_data
#'
#' @returns A tibble with the log
#' @export
#'
#' @examples
#' \dontrun{
#' pipeline_logs <- log_summary(.symbols = symbols_vector, .message = message)
#' }
log_summary <- function(.user_login = "EriF", .start = lubridate::today()-6,
                        .end = lubridate::today()-1, n_stocks_per_batch = 31,
                        .symbols, .message) {
  user_login <- .user_login
  batch_id <- n_stocks_per_batch
  symbol <- .symbols

  message <- .message
  status <- "NOK"
  n_rows <- 0
  if (grepl("^Inserted", message)) {
    status <- "OK"
    n_rows <- as.numeric(gsub("Inserted ([0-9]+).*", "\\1", message))
  }
  else if (message == "No new records to insert.") {
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
