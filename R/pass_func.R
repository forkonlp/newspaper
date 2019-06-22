finish <- function(dat, func) {
  finish_func <- try(match.fun(func), silent = T)
  if (is.function(finish_func)) { finish_func(dat) } else { finish_basic(dat) }
}

finish_basic <- function(x) stringr::str_squish(x[1])

finish_at_basic <- function(x) {
  stringr::str_squish(x[1]) %>%
    lubridate::ymd_hms(tz = "Asia/Seoul", quiet = T)
}


read <- function(func) {
  read_func <- try(match.fun(func), silent = T)
  if (is.function(read_func)) { read_func } else { read_basic }
}

read_basic <- function(x) xml2::read_html(x, encoding = 'UTF-8')
