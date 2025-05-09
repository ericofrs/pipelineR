#' Insert new data into the PostgreSQL table
#'
#' @param .tidy_data A tidy tibble containing stock market data
#' @param con A connection
#'
#' @returns A message confirming the insertion or not of the records
#' @export
#'
#' @examples
#' \dontrun{
#' message <- insert_new_data()
#' }
insert_new_data <- function(.tidy_data, con) {
  con <- con

  existing_data <- DBI::dbGetQuery(
    conn = con,
    statement = "SELECT symbol, date, metric FROM student_erico.sp500_data"
  )

  new_data <- dplyr::anti_join(
    .tidy_data,
    existing_data,
    by = c("symbol", "date", "metric")
  )

  if (nrow(new_data) > 0) {
    DBI::dbAppendTable(
      conn = con,
      name = DBI::Id(schema = "student_erico", table = "sp500_data"),
      value = new_data
    )
    message <- paste0("Inserted ", nrow(new_data), " new records.")
    cat(message, "\n")
    return(message)
  } else {
    message <- "No new records to insert."
    cat(message, "\n")
    return(message)
  }

  # DBI::dbDisconnect(con)

}
