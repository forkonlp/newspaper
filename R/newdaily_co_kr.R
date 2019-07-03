body_newdaily_co_kr <- function(x){
  tar_slt <- c('div span[style="font-family: Arial;"]', 'div font[face="Arial"]')
  select_tag(x, tar_slt) %>%
    rvest::html_text() %>%
    stringr::str_c(collapse = " ")  %>%
    finish_basic()
}


by_newdaily_co_kr <- function(x){
  remove_tag(x, c("a.nd-tooltip-text")) %>%
    finish_basic()
}
