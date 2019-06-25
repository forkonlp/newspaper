read_news_kmib_co_kr <- function(x) {
  xml2::read_html(x, encoding = "euc-kr")
}
