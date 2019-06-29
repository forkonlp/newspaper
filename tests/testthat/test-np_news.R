test_that("np info test", {
  expect_equal(2 * 2, 4)
})

test_that("tibbler test",{
  system.file("test", "tibbler_test.rds",package = "newspaper") %>%
    readRDS() -> tdat
  system.file("test", "tibbler_exp_test.rds",package = "newspaper") %>%
    readRDS() -> exdat

  expect_equal(tibber(tdat), exdat)
})
