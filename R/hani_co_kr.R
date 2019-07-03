body_hani_co_kr <- function(x){
  remove_tag(x, "div.image-area") %>%
    finish_basic()
}


edited_at_hani_co_kr <- function(x){
  x[length(x)] %>%
    finish_at_basic()
}
