context("nl_lookup")

test_that("id = weg-998023d41c562b2b433378161ea5670", {
  res <- nl_suggest("weg-998023d41c562b2b433378161ea56704")
  expect_true(res$response$numFound > 0)
})

weg-998023d41c562b2b433378161ea56704 6.740476
2  adres   's Gravenhof 1, 7201DN Zutphen adr-1dc7a72e5caf9ee2b1f8ae2315eda36b
