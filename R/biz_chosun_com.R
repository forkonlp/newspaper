published_at_biz_chosun_com <- function(x) {
  stringr::str_split(x, stringr::fixed("|")) %>%
    .[[1]] %>% .[1] %>%
    stringr::str_squish() %>%
    lubridate::ymd_hm(tz = "Asia/Seoul", quiet = T)
}

edited_at_biz_chosun_com <- function(x) {
  stringr::str_split(x, stringr::fixed("|")) %>%
    .[[1]] %>% .[2] %>%
    stringr::str_squish() %>%
    lubridate::ymd_hm(tz = "Asia/Seoul", quiet = T)
}

from_biz_chosun_com <- function(x) {
  stringr::str_split(x, ",") %>%
    .[[1]] %>% .[1] %>%
    finish_basic()
}

body_biz_chosun_com <- function(x) {
  tar_rm <- c("div.news_date", "script", "style")
  x %>%
    remove_tag(tar_rm) %>%
    finish_basic()
}

