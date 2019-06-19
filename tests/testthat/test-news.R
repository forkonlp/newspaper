test_that("np_info works", {
  hobj <- xml2::read_html("https://kr.acrofan.com/detail.php?number=153343")
  node <- "div.viewHeadW h1"
  attr <- NA
  expect_type(np_info(hobj, node, attr), "character")

  node <- "div.articleBody p"
  attr <- NA
  expect_type(np_info(hobj, node, attr), "character")
})
