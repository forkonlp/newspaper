#' Get News contents
#'
#' @param target_url target url
#' @param format tibble and list
#'
#' @importFrom purrr pmap
#'
#' @export
np_news <- function(target_url,
                    format = c("tibble", "list"),
                    edited = c("na","copy")){

  if (!is_url(target_url)) {
    stop("Is it valid url?")
  }

  name <- url_to_name(target_url)

  config <- get_config(name)

  conditions <- support_info(config)
  encoding <- encoding_info(config)

  if (conditions$error) {
    stop("This site is on the list but can't get information.")
  }

  conditions <- conditions$content

  hobj <- read(stringr::str_c("read_", name))(target_url, encoding)

  format <- match.arg(format)

  conditions %>%
    content_for_use() %>%
    dplyr::mutate(prep = stringr::str_c(where,"_",config$name)) %>%
    purrr::pmap(function(site, where, node, attr, prep) {
      list(col = where, value = np_info(hobj, node, attr, prep))
    }) %>%
    purrr::when(
      format == "tibble" ~ tibbler(.),
      ~ . )
}

#' @importFrom purrr map_dfc
#' @importFrom dplyr select
tibbler <- function(condition_list) {
  . <- NULL
  condition_list %>%
    purrr::map_dfc(
      ~ tibble::tibble(!!.x$col := .x$value)
      ) %>%
    dplyr::select(where[where %in% names(.)])
}

np <- function(x){
  np_news(x) %>%
    dplyr::glimpse()
}

#' @importFrom rvest html_nodes html_text html_attr
#' @importFrom purrr when
np_info <- function(hobj,
                    node,
                    attr,
                    prep) {
  hobj %>%
    rvest::html_nodes(node) %>%
    purrr::when(
      attr == "pass" ~ .,
      attr != "NA" ~ rvest::html_attr(., attr),
      attr == "NA" ~ rvest::html_text(.)
    ) %>%
    finish(prep)
}

