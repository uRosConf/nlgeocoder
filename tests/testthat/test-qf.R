context("test-qf")

test_that("qf works with NULL", {
  qf <- as_qf()
  expect_true(is.null(qf))

  # as_qf("")
  # as_qf("woonplaats")
  # as_qf(c("woonplaats" = 1.5, "huisnummer" = 1))

  expect_equal(2 * 2, 4)
})

test_that("qf works with empty string", {
  qf <- as_qf("")
  expect_true(is.null(qf))
})

test_that("qf works with simple string", {
  qf <- as_qf("woonplaats")
  expect_equal(qf, "woonplaats")

  qf <- as_qf(c("woonplaats","huisnummer"))
  expect_equal(qf, "woonplaats huisnummer")
})

test_that("qf works with named weights", {
  qf <- as_qf(c("woonplaats" = 1.5))
  expect_equal(qf, "woonplaats^1.5")

  qf <- as_qf(c("woonplaats"=1.5,"huisnummer"=2))
  expect_equal(qf, "woonplaats^1.5 huisnummer^2")
})
