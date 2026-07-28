test_that("multiplication works", {
  expect_equal(2 * 2, 4)
})

test_that("get_theatre_stats returns a data frame with expected columns", {
  result <- get_theatre_stats()

  expect_s3_class(result, "data.frame")
  expect_true(
    all(
      c("auspraegung", "jahr", "monat", "wert") %in%
        names(result)
    )
  )
})

test_that("invalid indicators are rejected", {
  expect_error(
    get_theatre_stats(indicator = "invalid_indicator"),
    "^Invalid indicator\\."
  )
})

test_that("years must be numeric", {
  expect_error(
    get_theatre_stats(years = "not_a_number"),
    "Invalid years. Must be a numeric vector of years."
  )
})
