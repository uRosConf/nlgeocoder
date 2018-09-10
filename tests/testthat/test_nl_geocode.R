context("nl_geocode")

test <- data.frame(address = c("Martinikerkhof 3, Groningen", "9712 JN 4", "Henri Faasdreef 312 Den Haag"))

# Iets met huisnummer toevoeging

test_that("type = adres is default", {
  res <- nl_geocode(test$address)
  expect_true(sum(res$type == 'adres') == 3)
})
