context("utf8")

test_that("Dvorákhof", {
  skip_on_cran()
  res <- nl_suggest("Dvorákhof")
  expect_true(res$response$numFound > 0)
})
