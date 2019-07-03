body_news_sbs_co_kr <- function(x){
  remove_tag(x, "a") %>%
    finish_basic()
}
