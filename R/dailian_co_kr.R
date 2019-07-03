body_dailian_co_kr <- function(x) {
  rm_tar <- c("script", "b", "td")
  remove_tag(x, rm_tar) %>%
    finish_basic()
}

by_dailian_co_kr <- function(x) {
  remove_tag(x, "label") %>%
    finish_basic()
}
