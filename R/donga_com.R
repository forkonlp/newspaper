edited_at_donga_com <- function(x) {
  x[length(x)] %>%
    finish_at_basic()
}

body_donga_com <- function(x) {
  remove_tag(x, c("div.article_relation",
                  "div#bestnews_layer",
                  "script")) %>%
    finish_basic()
}
