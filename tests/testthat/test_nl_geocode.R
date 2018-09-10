context("nl_suggest")

test_that("type = adres is default", {
  res <- nl_geocode("Martinikerkhof 3 Groningen")
  expect_true(sum(res$type == 'adres') == 10)
})
