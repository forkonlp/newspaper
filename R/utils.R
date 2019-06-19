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

support_info <- function(name_) {
  system.file("yaml",
              stringr::str_c(name_, ".yml"),
              package = "newspaper") %>%

    yaml::read_yaml() %>%
    .[4:9] %>%
    dplyr::as_tibble() %>%
    tidyr::unnest() %>%
    list(
      content = dplyr::select_if(~ !is.na(.)),
      error = all(is.na(.))
    )
}
#' @importFrom urltools
#' @importFrom stringr str_detect
is_url <- function(target_url){
  stringr::str_detect(
    target_url,
    "^(http:\\/\\/www\\.|https:\\/\\/www\\.|http:\\/\\/|https:\\/\\/)?[a-z0-9]+([\\-\\.]{1}[a-z0-9]+)*\\.[a-z]{2,5}(:[0-9]{1,5})?(\\/.*)?$"
  )
}
