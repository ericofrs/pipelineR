test_that("Data fetching from yahoo works", {
  result <- yahoo_query_data(.start = "2025-01-01",
                             .end = "2025-01-07",
                             .n_stocks_per_batch = 31,
                             .vec = c("AAPL", "GOOGL", "MSFT", "AMZN", "META", "TSLA"))
  expect_gt(nrow(result), 0)
})

