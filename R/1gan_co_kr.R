read_1gan_co_kr <- function(x) xml2::read_html(x)

by_1gan_co_kr <- function(x) {
  stringr::str_split(x, " ") %>%
    .[[1]] %>% .[1] %>%
    return()
}

from_1gan_co_kr <- function(x) {
  tem <- stringr::str_split(trimws(x), " ")[[1]]
  return(tem[length(tem)])
}

published_at_1gan_co_kr <- function(x) {
  trimws(x) %>%
    stringr::str_split(" ") %>%
    .[[1]] %>% .[-1] %>%
    stringr::str_c(collapse = " ") %>%
    lubridate::ymd_hm(tz = "Asia/Seoul") %>%
    return()
}
