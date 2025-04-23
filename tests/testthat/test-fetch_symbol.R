test_that("fetch_symbols() returns non-empty vector if data exists", {
  con <- connect_db()
  symbols <- fetch_symbols(con)
  expect_gt(length(symbols), 0)
  DBI::dbDisconnect(con)
})
