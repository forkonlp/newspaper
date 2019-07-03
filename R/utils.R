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

#' @export
url_to_name <- function(target_url) {
  target_url %>%
    urltools::domain() %>%
    stringr::str_remove("www.?\\.") %>%
    stringr::str_replace_all("[^a-zA-Z0-9]", "_")
}

support_info <- function(config) {
  config %>%
    .[4:9] %>%
    dplyr::as_tibble() %>%
    dplyr::mutate_all(as.character) %>%
    list(content = .,
         error = all(is.na(.))) %>%
    return()
}

encoding_info <- function(config){
  config$encoding
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

#' @importFrom yaml read_yaml
yml_template <- function(){
  system.file("", "template.yml",
              package = "newspaper") %>%
    yaml::read_yaml()
}

#' yml start
#'
#' start
#'
#' @param target_url urls
#' @param open open options
#'
#' @importFrom stringr str_c
#' @importFrom urltools scheme domain
#' @importFrom httr GET
#'
#' @export
yml_start <- function(target_url, open = T){

  yml_template() -> temp

  newspaper:::url_to_name(target_url) -> name

  filename <- str_c("./inst/yaml/" ,name, ".yml")

  stringr::str_c(
    urltools::scheme(target_url),
    "://",
    urltools::domain(target_url)
  ) -> site

  temp$name <- name
  temp$site <- site
  temp$encoding <- get_encoding(target_url)
  temp$body$attr <- "pass"

  yaml::write_yaml(x = temp,
                   file = filename,
                   fileEncoding = "UTF-8")
  if (open & interactive()) {
    rstudioapi::navigateToFile(file = filename)
    browseURL(target_url)
  }
}

#' @export
get_config <- function(name){
  system.file("yaml",
              stringr::str_c(name, ".yml"),
              package = "newspaper") %>%
    purrr::when(
      . == "" ~ stop("There's no config file for this site yet."),
      ~ .
    ) %>%
    yaml::read_yaml()
}


get_encoding <- function(target_url) {
  target_url %>% httr::GET() %>%
    httr::content("raw") %>%
    rawToChar() %>%
    stringr::str_remove_all("[^a-zA-Z0-9]") %>%
    tolower() %>%
    stringr::str_extract_all("utf8|euckr") %>%
    .[[1]] %>% unique() %>%
    purrr::when(
      identical(., character(0)) ~ NA,
      length(.) != 1 ~ NA,
      ~ .
    )
}
