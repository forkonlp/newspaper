published_at_segye_com <- function(x){
  x %>%
    stringr::str_squish() %>%
    stringr::str_split(" : ") %>%
    .[[1]] %>% .[2] %>%
    finish_at_basic()
}

edited_at_segye_com <- function(x){
  x %>%
    stringr::str_squish() %>%
    stringr::str_split(" : ") %>%
    .[[1]] %>% .[3] %>%
    finish_at_basic()
}
