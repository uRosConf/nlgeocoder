context("nl_geocode")

test <- data.frame(address = c("Martinikerkhof 3, Groningen", "9712 JN 4", "Henri Faasdreef 312 Den Haag"))

# Iets met huisnummer toevoeging

test_that("type = adres is default", {
  res <- nl_geocode(test$address)
  expect_true(sum(res$type == 'adres') == 3)
})


test_that("return as wgs84 is working",{
  res <- nl_geocode(test$address, output = "wgs84")
  expect_equal(sf::st_crs(res), sf::st_crs(4326))
})

test_that("return as rd is working",{
  res <- nl_geocode(test$address, output = "rd")
  expect_equal(sf::st_crs(res), sf::st_crs(28992))
  res <- nl_geocode_rd(test$address)
  expect_equal(sf::st_crs(res), sf::st_crs(28992))
})

test_that("return as data.frame is working",{
  res <- nl_geocode(test$address, output = "data.frame")
  expect_true(is.data.frame(res))
})
