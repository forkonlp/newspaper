read_sportalkorea_com <- function(x){
  httr::GET(x) %>%
    httr::content("raw") %>%
    rawToChar() %>%
    xml2::read_html()
}


from_sportalkorea_com <- function(x){
  stringr::str_split(x, " ") %>%
    .[[1]] %>% .[length(.)] %>%
    stringr::str_squish()
}
