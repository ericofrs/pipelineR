test_that("Data fetching from yahoo works", {
  result <- yahoo_query_data(.start = "2025-01-01",
                             .end = "2025-01-07",
                             .n_stocks_per_batch = 31,
                             .vec = c("AAPL", "GOOGL", "MSFT", "AMZN", "META", "TSLA"))
  expect_gt(nrow(result), 0)
})



test_that("yahoo_query_data() returns NULL when invalid symbol provided", {
  batch_list <- tibble::tibble(symbol = c("INVALIDTICKER123"), index_ts = c("INVALID_Index"))
  result <- suppressWarnings(yahoo_query_data(.start = "2025-01-01",
                             .end = "2025-01-07",
                             .n_stocks_per_batch = 31,
                             .vec = c("INVALIDTICKER123", "INVALIDTICKER456")))
  expect_true(is.null(result) || nrow(result) == 0)
})
