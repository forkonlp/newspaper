finish <- function(func, tbl) {
  tryCatch(match.fun(func)(tbl),
           error = tbl,
           finally = NULL) %>%
    return()
}

#' @importFrom stringr str_split
#' @export
title_1gan_co_kr <- function(x) {
  stringr::str_split(x, pattern = " ") %>%
    .[length(.)]
}

#' @export
body_1gan_co_kr <- function(x) {
  x[2]
}
