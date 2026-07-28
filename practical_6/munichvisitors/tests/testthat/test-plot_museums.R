test_that("multiplication works", {
  expect_equal(2 * 2, 4)
})

test_that("plot_museums returns a ggplot object", {
  result <- plot_museums()

  expect_s3_class(result, "gg")
})

test_that("museum_visitors has expected columns", {
  expect_true(
    all(
      c("auspraegung", "jahr", "monat", "wert") %in%
        names(museum_visitors)
    )
  )
})