#' @import dplyr
#' @importFrom stringr str_detect
#' @importFrom urltools domain
chk_list <- function(name_){
  name <- NULL
  tar_name %>%
    dplyr::pull(name) %>%
    stringr::str_detect(name_) %>%
    any() %>%
    return()
}

url_to_name <- function(target_url) {
  target_url %>%
    urltools::domain() %>%
    stringr::str_remove("www.?\\.") %>%
    stringr::str_replace_all("[^a-zA-Z0-9]", "_")
}

support_info <- function(name_, config) {
  config %>%
    .[4:9] %>%
    dplyr::as_tibble() %>%
    tidyr::unnest() %>%
    list(content = .,
         error = all(is.na(.))) %>%
    return()
}

content_for_use <- function(x) {
  dplyr::mutate(x, rowid = c("node","attr")) %>%
    tidyr::gather(where, value, -rowid) %>%
    tidyr::spread(rowid, value) %>%
    dplyr::select(where, node, attr) %>%
    dplyr::filter(!is.na(node))
}

#' @importFrom stringr str_detect
is_url <- function(target_url){
  stringr::str_detect(
    target_url,
    "^(http:\\/\\/www\\.|https:\\/\\/www\\.|http:\\/\\/|https:\\/\\/)?[a-z0-9]+([\\-\\.]{1}[a-z0-9]+)*\\.[a-z]{2,5}(:[0-9]{1,5})?(\\/.*)?$"
  )
}
