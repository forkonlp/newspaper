#' @import dplyr
#' @importFrom stringr str_detect
#' @importFrom urltools domain
get_el <- function(target_url){
  site <- NULL
  target_domain <- urltools::domain(target_url)
  config_main %>%
    dplyr::filter(stringr::str_detect(site, target_domain)) %>%
    return()
}

#' @importFrom stringr str_detect
is_url <- function(target_url){
  stringr::str_detect(
    target_url,
    "^(http:\\/\\/www\\.|https:\\/\\/www\\.|http:\\/\\/|https:\\/\\/)?[a-z0-9]+([\\-\\.]{1}[a-z0-9]+)*\\.[a-z]{2,5}(:[0-9]{1,5})?(\\/.*)?$"
  )
}
