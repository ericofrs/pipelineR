#' Create table with pipeline_logs structure
#'
#' @returns A tibble with columns user_login, batch_id, symbol, status, n_rows, message
#' @export
#'
#' @examples
#' \dontrun{
#' empty_logs <- build_summar_table()
#' }
build_summary_table <- function() {
  pipeline_logs <- tibble::tibble(
    user_login = character(),
    batch_id = integer(),
    symbol = character(),
    status = character(),
    n_rows = integer(),
    message = character())
  )
}
