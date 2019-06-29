read_sports_chosun_com <- function(x) {
  xml2::read_html(x, encoding = "euc-kr")
}

body_sports_chosun_com <- function(x) {
  remove_script(x)
}
