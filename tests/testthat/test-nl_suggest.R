context("nl_suggest")

test_that("q = 's' - no additional parameter values - number of search results > 0", {
  res <- nl_suggest("s")
  expect_true(res$response$numFound > 0)
})

test_that("q = 's' - number of search results in response equals 10", {
  res <- nl_suggest("s")
  expect_true(nrow(res$response$docs) == 10)
})

test_that("q = 's' and rows = 3", {
  res <- nl_suggest("s", rows = 3)
  expect_true(nrow(res$response$docs) == 3)
})

test_that("q = 's' and fq = 'type:weg'", {
  res <- nl_suggest("s", fq = "type:weg")
  expect_true(sum(res$response$docs$type == 'weg') == 10)
})

