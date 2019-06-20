#' Get News contents
#'
#' @param target_url target url
#'
#' @importFrom purrr pmap
#'
#' @export
np_news <- function(target_url){

  if (!is_url(target_url)) {
    stop("Is it valid url?")
  }

  name <- url_to_name(target_url)

  if (!chk_list(name)) {
    stop("This site is not on the list.
          please add issue https://github.com/forkonlp/newspaper/issues")
  }

  config <- system.file("yaml",
                    stringr::str_c(name, ".yml"),
                    package = "newspaper") %>%
              yaml::read_yaml()

  c(conditions, error) %<-% support_info(name, config)

  if (error) {
    stop("This site is on the list but can't get information.")
  }

  hobj <- read(stringr::str_c("read_", name))(target_url)

  conditions %>%
    content_for_use() %>%
    dplyr::mutate(prep = stringr::str_c(where,"_",config$name)) %>%
    purrr::pmap_dfr(function(site, where, node, attr, prep) {
      tibble::tibble(col = where, value = np_info(hobj, node, attr, prep))
    }) %>%
    tidyr::spread(col, value) %>%
    select(where[where %in% names(.)])
}

#' @importFrom rvest html_nodes html_text html_attr
#' @importFrom purrr when
#'
#' @export
np_info <- function(hobj,
                    node,
                    attr,
                    prep) {
  hobj %>%
    rvest::html_nodes(node) %>%
    purrr::when(
      is.na(attr) ~ rvest::html_text(.),
      ~ rvest::html_attr(attr)
    ) %>%
    finish(prep)
}

