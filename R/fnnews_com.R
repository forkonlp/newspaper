body_fnnews_com <- function(x){
  remove_tag(x, c("div.security","table.news_cont_img_wrap")) %>%
    finish_basic()
}

from_fnnews_com <- function(x){
  stringr::str_split(x, " ") %>%
    .[[1]] %>% .[length(.)] %>%
    stringr::str_squish()
}

published_at_fnnews_com <- function(x){
  x[2] %>%
    finish_at_basic()
}

edited_at_fnnews_com <- function(x){
  x[3] %>%
    finish_at_basic()
}
