body_news_joins_com <- function(x) {
  remove_tag(x, c("div.ab_photo")) %>%
    finish_basic()
}
