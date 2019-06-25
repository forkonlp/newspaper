read_sports_chosun_com <- function(x) {
  xml2::read_html(x, encoding = "euc-kr")
}

body_sports_chosun_com <- function(x) {
  as.character(x) %>%
    stringr::str_remove_all("<script>.*?</script>") %>%
    xml2::read_html() %>%
    rvest::html_text() %>%
    stringr::str_squish()
}
