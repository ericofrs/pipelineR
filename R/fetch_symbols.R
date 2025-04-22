#' Fetch tickers
#'
#' Fetches the tickers from the main SP500 table.
#'
#' @returns A `data.frame` of one column with all symbols
#' @export
#'
#' @examples
fetch_symbols <- function(){
  con <- connect_db()
  query_symbols <- glue::glue_sql("SELECT DISTINCT symbol
                                    FROM sp500.info
                                    ORDER BY symbol ASC;",
                                    .con = con
                                  )
  symbols <- DBI::dbGetQuery(con, query_symbols)
  DBI::dbDisconnect(con)
  return(symbols$symbol)
}
