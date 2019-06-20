## code to prepare `DATASET` dataset goes here
#
# library(rvest)
# library(magrittr)
# library(stringr)
# library(dplyr)
# library(tibble)
# library(purrr)
# library(readr)
#
# NAS <- list(
#   node = NA,
#   attr = NA
# )
#
# rm_url <- c()
#
# "http://www.mediamap.co.kr/" %>%
#   read_html() %>%
#   html_nodes("td a") %>%
#   html_attr("href") %>%
#   enframe(name = NULL) %>%
#   filter(str_detect(value, "view")) %>%
#   pull(value) %>%
#   map_chr(
#     ~ read_html(.x) %>%
#       html_nodes('table tr td a[target="_blank"]') %>%
#       html_attr("href") %>%
#       unique() %>%
#       when(
#         length(.) == 2 ~ .[!str_detect(., fixed("?"))],
#         ~ .[!str_detect(., fixed("newswire.co.kr"))]
#       )
#   ) %>%
#   enframe(name = NULL) %>%
#   filter(!(value %in% rm_url)) %>%
#   pull(value) %>%
#   unique() %>%
#   map(
#     ~ safely(GET)(.x) %>%
#       when(
#         is.null(.$error) ~ .$result$url
#       )
#   ) %>%
#   unlist() %>%
#   enframe(name = NULL) %>%
#   filter(!str_detect(value, "error")) %>%
#   arrange(value) %>%
#   rename(site = value) %>%
#   filter(!str_detect(site, "hugedomains")) %>%
#   filter(!str_detect(site, "news.naver.com")) %>%
#   unique() %>%
#   mutate(
#     name = str_remove(site, "www.?\\.") %>%
#       urltools::domain() %>%
#       str_replace_all("[^a-zA-Z0-9]","_")
#   ) %>%
#   unique() %>%
#   transpose() %>%
#   map(
#     ~list(
#       name = .x$name,
#       site = .x$site,
#       encoding = "UTF-8",
#       title = NAS,
#       body = NAS,
#       from = NAS,
#       published_at = NAS,
#       edited_at = NAS,
#       by = NAS
#     ) %>%
#       yaml::write_yaml(
#         str_c("./inst/yaml/",.$name,".yml")
#       )
#   )

library(yaml)
library(purrr)
library(fs)
library(tibble)
library(dplyr)
library(stringr)
library(glue)

dir_ls("./inst/yaml") %>%
  enframe(name = NULL) %>%
  # slice(1:2) %>%
  transmute(name = path_split(value) %>%
              map_chr(~ str_remove(.x[4],fixed(".yml")))) ->
  tar_name

where <- c("title",
           "body",
           "from",
           "published_at",
           "edited_at",
           "by")

usethis::use_data(tar_name, where,
                  overwrite = TRUE, internal = TRUE)

# library(tidyr)
# library(glue)
# tar_name %>%
#   crossing(where) %>%
#   glue_data("{where}_{name} <- function(x) x") %>%
#   writeLines("R/finish_basic.R")
#
# library(tidyr)
# library(glue)
# tar_name %>%
#   glue_data("read_{name} <- function(x) read_html(x, encoding='UTF-8')") %>%
#   writeLines("R/read_basic.R")
