from_sportalkorea_com <- function(x){
  stringr::str_split(x, " ") %>%
    .[[1]] %>% .[length(.)] %>%
    stringr::str_squish()
}

