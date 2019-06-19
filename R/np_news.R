#' Get News contents
#'
#' @param target_url target url
#' @param silent FALSE is defualt.
#'
#' @export
np_news <- function(target_url, silent = F){
  if (is_url(target_url)) {
    stop("Is it valid url?")
  }
  conditions <- get_el(target_url)
  if (nrow(conditions) == 0) {
    stop("This site not support now. please add issue https://github.com/forkonlp/newspaper/issues ")
  }
  target_url %>%
    read_html() ->
    hobj
  arg_title <- conditions$title
  arg_body <- conditions$body
  arg_pub_at <- conditions$published_at
  arg_ed_at <- conditions$edited_at
  arg_by <- conditions$by
}

#' @importFrom rvest html_nodes html_text html_attr
#' @importFrom purrr when
#'
#' @export
np_info <- function(hobj,
                    node,
                    attr,
                    prep = preproseccing) {
  hobj %>%
    rvest::html_nodes(node) %>%
    purrr::when(
      is.na(attr) ~ rvest::html_text(.),
      ~ rvest::html_attr(attr)
    ) %>%
    prep()
}

preproseccing <- function(x){
  return(x)
}
