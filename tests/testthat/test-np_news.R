<<<<<<< HEAD
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
=======
test_that("np_functions", {
  expect_true(is.function(match.fun("np_news")))
  expect_true(is.function(match.fun("np_info")))
})

>>>>>>> a57ea49b740282150d7e6f96c284ec14b3e5989e
