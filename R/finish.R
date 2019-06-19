finish <- function(func, tbl) {
  tryCatch(match.fun(func)(tbl),
           error = tbl)
}

#' @importFrom stringr str_split
title_1gan_co_kr <- function(x) {
  str_split(x, pattern = " ") %>%
    .[length(.)]
}

body_1gan_co_kr <- function(x) {
  x[2]
}
