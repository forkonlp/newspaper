read_isplus_live_joins_com <- function(x, encoding){
  httr::GET(x) %>%
    httr::content("raw") %>%
    rawToChar() -> tem
  Encoding(tem) <- toupper(encoding)
  stringr::str_remove_all(tem, "<!-{2,}.*?-{2,}>") %>%
    xml2::read_html()
}
