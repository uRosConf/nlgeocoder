context("nl_suggest")

test_that("q = s - no additional parameter values - number of search results > 0", {
  res <- nl_suggest("s")
  expect_true(res$response$numFound > 0)
})

test_that("q = s - number of search results in response equals 10", {
  res <- nl_suggest("s")
  expect_true(nrow(res$response$docs) == 10)
})

test_that("q = s and rows = 3", {
  res <- nl_suggest("s", rows = 3)
  expect_true(nrow(res$response$docs) == 3)
})

test_that("q = !-=>#", {
  res <- nl_suggest('!-=>#')
  expect_true(res$response$numFound == 0)
})

test_that("q = s and fq = type:weg", {
  res <- nl_suggest("s", fq = "type:weg")
  expect_true(sum(res$response$docs$type == 'weg') == 10)
})

test_that("q = Den Haag and fq = type:woonplaats", {
  res <- nl_suggest("Den Haag", fq = "type:woonplaats")
  expect_true(res$response$numFound == 1)
})

test_that("Filter attributes - only weergavenaam", {
  res <- nl_suggest("s", fl = "weergavenaam")
  expect_true(ncol(res$response$docs) == 1 & names(res$response$docs)[1] == "weergavenaam")
})

test_that("Filter attributes - weergavenaam and type", {
  res <- nl_suggest("s", fl = "weergavenaam, type")
  expect_true(ncol(res$response$docs) == 2)
})

test_that("Sort response ascending by weergavenaam", {
  res <- nl_suggest("s", sort = "weergavenaam asc")
  expect_true(substr(res$response$docs[[2]][1], 1, 1) == "'")
})
