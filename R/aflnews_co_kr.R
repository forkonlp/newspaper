read_aflnews_co_kr <- function(x) {
  xml2::read_html(x, encoding = "euc-kr")
}

published_at_aflnews_co_kr <- function(x){
  x[length(x)] %>%
    finish_basic() %>%
    lubridate::ymd_hm(tz = "Asia/Seoul", quiet = T)
}
