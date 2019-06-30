from_yonhapnewstv_co_kr <- function(x){
  stringr::str_split(x, stringr::fixed("::")) %>%
    .[[1]] %>% .[1] %>%
    stringr::str_squish()
}
