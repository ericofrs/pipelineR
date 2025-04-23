#' Fetch tickers
#'
#' Fetches the tickers from the main SP500 table.
#'
#' @param con A connection
#'
#' @returns A `data.frame` of one column with all symbols
#' @export
#'
#' @examples
#' \dontrun{
#' fetch_symbols()
#' }
fetch_symbols <- function(con){
  con <- con
  query_symbols <- glue::glue_sql("SELECT DISTINCT symbol
                                    FROM sp500.info
                                    ORDER BY symbol ASC;",
                                    .con = con
                                  )
  symbols <- DBI::dbGetQuery(con, query_symbols)
  if (is.null(symbols)) {
    stop("No symbols fetched")
  }
  # DBI::dbDisconnect(con)
  return(symbols$symbol)
}
