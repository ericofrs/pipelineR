#' Push summary table to the DB
#'
#' @param .summary_table A tibble that will be uploaded to the database
#' @param con A connection
#'
#' @returns A message
#' @export
#'
#' @examples
#' \dontrun{
#' push_summary_table(.summary_table = pipelog_table)
#' }
push_summary_table <- function(.summary_table, con) {
  con <- con
  if (nrow(.summary_table) > 0) {
    DBI::dbAppendTable(
      conn = con,
      name = DBI::Id(schema = "student_erico", table = "pipeline_logs"),
      value = .summary_table
    )
    message <- paste0("Inserted ", nrow(.summary_table), " log(s)")
    cat(message, "\n")
    return(message)
  } else {
    message <- "No logs to be recorded."
    cat(message, "\n")
    return(message)
  }
  # DBI::dbDisconnect(con)
}
