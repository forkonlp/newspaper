from_ablenews_co_kr <- function(x) {
  stringr::str_split(x, " ") %>%
    .[[1]] %>% .[1] %>%
    stringr::str_squish()
}

published_at_ablenews_co_kr <- function(x) {
  as.character(x) %>%
    .[stringr::str_detect(., intToUtf8(c(44592,49324,51089,49457,51068)))] %>%
    stringr::str_split(stringr::fixed(" : ")) %>%
    .[[1]] %>% .[2] %>% finish_at_basic()
}

by_ablenews_co_kr <- function(x) {
  stringr::str_split(x[1], intToUtf8(51032)) %>%
    .[[1]] %>% .[1] %>% stringr::str_squish()
}

