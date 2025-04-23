push_summary_table <- function(.summary_table) {
  # con <- connect_db()
  if (nrow(.summary_table) > 0) {
    DBI::dbAppendTable(
      conn = con,
      name = DBI::Id(schema = "student_erico", table = "pipeline_logs"),
      value = .summary_table
    )
    message <- paste0("Inserted ", nrow(new_data), " log(s)")
    cat(message, "\n")
    return(message)
  } else {
    message <- "No logs to be recorded."
    cat(message, "\n")
    return(message)
  }
  # DBI::dbDisconnect(con)
}
