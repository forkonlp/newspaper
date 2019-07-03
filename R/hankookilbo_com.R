body_hankookilbo_com <- function(x) {
  remove_tag(x, c("figcaption.caption")) %>%
    finish_basic()
}
