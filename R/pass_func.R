finish <- function(dat, func) {
  finish_func <- try(match.fun(func), silent = T)
  if (is.function(finish_func)) {
    finish_func(dat)
  } else if (is_at(func)) {
    finish_at_basic(dat)
  } else if (is_body(func)) {
    finish_body_basic(dat)
  } else {
    finish_basic(dat)
  }
}

is_at <- function(x)
  stringr::str_detect(x, stringr::fixed("_at"))
is_body <-
  function(x)
    stringr::str_detect(x, stringr::fixed("body_"))

finish_basic <- function(x) {
  stringr::str_squish(x[1])
}

finish_body_basic <- function(x) {
  x %>%
    purrr::when(identical(., character(0)) ~ return(.),
                is.na(x) ~ return(NA_character_),
                ~ .) %>%
    remove_jscss() %>%
    finish_basic()
}

finish_at_basic <- function(x) {
  finish_basic(x) %>%
    lubridate::ymd_hms(tz = "Asia/Seoul", quiet = T) %>%
    purrr::when(is.na(.) ~ lubridate::ymd_hm(finish_basic(x), tz = "Asia/Seoul", quiet = T),
                ~ .)
}

remove_jscss <- function(x) {
  remove_tag(x, c("script", "style"))
}

select_tag <- function(x, tar_nodes) {
  tar_nodes <- stringr::str_c(tar_nodes, collapse = ", ")
    rvest::html_nodes(x, tar_nodes)
}

remove_tag <- function(x, tar_nodes) {
  tar_nodes <- stringr::str_c(tar_nodes, collapse = ", ")
  x %>%
    rvest::html_nodes(tar_nodes) %>%
    rvest::html_text() %>%
    .[nchar(.) > 0] -> tar_remove

  if (identical(tar_remove, character(0))) {
    return(rvest::html_text(x))
  }

  rvest::html_text(x) -> texts

  for (i in 1:length(tar_remove)) {
    texts <-
      stringr::str_remove_all(texts, stringr::fixed(tar_remove[i]))
  }
  return(texts)
}


read <- function(func) {
  read_func <- try(match.fun(func), silent = T)
  if (is.function(read_func)) {
    read_func
  } else {
    read_basic
  }
}

read_html_safe <- purrr::possibly(xml2::read_html, otherwise = NULL)

read_with_agent <- function(x, encoding) {
  ah <- httr::add_headers("User-Agent"="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36")
  httr::GET(x, ah) %>%
    httr::content()
}

read_with_agent_safe <- purrr::possibly(read_with_agent, otherwise = NULL)



read_basic <- function(x, encoding = "utf-8") {
  read_html_safe(x) -> hobj
  if (!is.null(hobj)) {
    return(hobj)
  }

  read_html_safe(x, encoding = "euc-kr") -> hobj
  if (!is.null(hobj)) {
    return(hobj)
  }

  read_with_agent_safe(x, encoding = encoding) -> hobj
  if (!is.null(hobj)) {
    return(hobj)
  }

  suppressWarnings(
    httr::GET(x) %>%
      httr::content("raw") %>%
      rawToChar() %>%
      stringr::str_conv(., encoding = encoding) %>%
      xml2::read_html()
  )
}
