context("nl_geocode")

test <- data.frame(address = c("Martinikerkhof 3, Groningen", "9712 JN 4", "Henri Faasdreef 312 Den Haag", "Hoofdstraat 1A Een"))



test_that("type = adres is default", {
  res <- nl_geocode("Martinikerkhof 3 Groningen")
  expect_true(sum(res$response$docs$type == 'adres') == 10)
})
