body_sedaily_com <- function(x) {
  as.character(x) %>%
    stringr::str_remove_all("<script>.*?</script>") %>%
    xml2::read_html() %>%
    rvest::html_text() %>%
    stringr::str_squish()
}
