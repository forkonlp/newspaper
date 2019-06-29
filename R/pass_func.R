finish <- function(dat, func) {
  finish_func <- try(match.fun(func), silent = T)
  if (is.function(finish_func)){
    finish_func(dat)
  } else if (is_at(func)) {
    finish_at_basic(dat)
  } else {
    finish_basic(dat)
  }
}

is_at <- function(x) stringr::str_detect(x, stringr::fixed("_at"))

finish_basic <- function(x) stringr::str_squish(x[1])

finish_at_basic <- function(x) {
  finish_basic(x) %>%
    lubridate::ymd_hms(tz = "Asia/Seoul", quiet = T)
}

remove_jscss <- function(x) {
  x %>%
    remove_tag(c("script","style")) %>%
    finish_basic()
}

remove_tag <- function(x, tar_nodes) {
  tar_nodes <- str_c(tar_nodes, collapse = ", ")
  x %>%
    rvest::html_nodes(tar_nodes) %>%
    rvest::html_text() %>%
    .[nchar(.)>0] -> tar_remove

  rvest::html_text(x) -> texts

  for(i in 1:length(tar_remove)){
    texts <- stringr::str_remove_all(texts, stringr::fixed(tar_remove[i]))
  }
  return(texts)
}


read <- function(func) {
  read_func <- try(match.fun(func), silent = T)
  if (is.function(read_func)) { read_func } else { read_basic }
}

read_basic <- function(x) xml2::read_html(x, encoding = 'UTF-8')
