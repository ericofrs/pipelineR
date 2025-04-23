test_that("Log summary table has the correct column names", {
  result <- build_summary_table()
  expect_named(result, c("user_login", "batch_id",
                        "symbol", "status",
                        "n_rows", "message"))
})

test_that("build_summary_table() returns a tibble", {
  summary_table <- build_summary_table()
  expect_s3_class(summary_table, "tbl_df")
})

test_that("build_summary_table() returns empty tibble", {
  summary_table <- build_summary_table()
  expect_equal(nrow(summary_table), 0)
})

test_that("Log table has the correct column names", {
  result <- log_summary(.start = "2025-01-01",
                        .end = "2025-01-31",
                        .n_stocks_per_batch = 31,
                        .symbols = "AAPL, GOOGL, MSFT, AMZN, META, TSLA", .message = "No new records to insert.")
  expect_named(result, c("user_login", "batch_id",
                         "symbol", "status",
                         "n_rows", "message"))
})

test_that("Log table records at least one row", {
  result <- log_summary(.start = "2025-01-01",
                        .end = "2025-01-31",
                        .n_stocks_per_batch = 31,
                        .symbols = "AAPL, GOOGL, MSFT, AMZN, META, TSLA", .message = "No new records to insert.")
  expect_gt(nrow(result), expected = 0)
})

test_that("Log table stops", {
  expect_error(log_summary(.start = "2025-01-01",
                           .end = "2025-01-31",
                           .n_stocks_per_batch = 31,
                           .symbols = "AAPL, GOOGL, MSFT, AMZN, META, TSLA", .message = ""))
})

