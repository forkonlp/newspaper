#' @importFrom lubridate ymd_hm ymd_hms
published_at_aflnews_co_kr <- function(x){
  x[length(x)] %>%
    finish_basic() %>%
    lubridate::ymd_hm(tz = "Asia/Seoul", quiet = T)
}

body_dailian_co_kr <- function(x) {
  rm_tar <- c("script", "b", "td")
  remove_tag(x, rm_tar) %>%
    finish_basic()
}

by_dailian_co_kr <- function(x) {
  remove_tag(x, "label") %>%
    finish_basic()
}

edited_at_donga_com <- function(x) {
  x[length(x)] %>%
    finish_at_basic()
}

body_donga_com <- function(x) {
  remove_tag(x, c("div.article_relation",
                  "div#bestnews_layer",
                  "script")) %>%
    finish_basic()
}

body_fnnews_com <- function(x){
  remove_tag(x, c("div.security","table.news_cont_img_wrap")) %>%
    finish_basic()
}

from_fnnews_com <- function(x){
  stringr::str_split(x, " ") %>%
    .[[1]] %>% .[length(.)] %>%
    stringr::str_squish()
}

published_at_fnnews_com <- function(x){
  x[2] %>%
    finish_at_basic()
}

edited_at_fnnews_com <- function(x){
  x[3] %>%
    finish_at_basic()
}

body_hani_co_kr <- function(x){
  remove_tag(x, "div.image-area") %>%
    finish_basic()
}


edited_at_hani_co_kr <- function(x){
  x[length(x)] %>%
    finish_at_basic()
}

body_hankookilbo_com <- function(x) {
  remove_tag(x, c("figcaption.caption")) %>%
    finish_basic()
}

read_isplus_live_joins_com <- function(x, encoding){
  httr::GET(x) %>%
    httr::content("raw") %>%
    rawToChar() -> tem
  Encoding(tem) <- toupper(encoding)
  stringr::str_remove_all(tem, "<!-{2,}.*?-{2,}>") %>%
    xml2::read_html()
}

body_newdaily_co_kr <- function(x){
  tar_slt <- c('div span[style="font-family: Arial;"]', 'div font[face="Arial"]')
  select_tag(x, tar_slt) %>%
    rvest::html_text() %>%
    stringr::str_c(collapse = " ")  %>%
    finish_basic()
}


by_newdaily_co_kr <- function(x){
  remove_tag(x, c("a.nd-tooltip-text")) %>%
    finish_basic()
}

body_news_joins_com <- function(x) {
  remove_tag(x, c("div.ab_photo")) %>%
    finish_basic()
}

from_ablenews_co_kr <- function(x) {
  stringr::str_split(x, " ") %>%
    .[[1]] %>% .[1] %>%
    stringr::str_squish()
}

published_at_ablenews_co_kr <- function(x) {
  as.character(x) %>%
    .[stringr::str_detect(., intToUtf8(c(44592,49324,51089,49457,51068)))] %>%
    stringr::str_split(stringr::fixed(" : ")) %>%
    .[[1]] %>% .[2] %>% finish_at_basic()
}

by_ablenews_co_kr <- function(x) {
  stringr::str_split(x[1], intToUtf8(51032)) %>%
    .[[1]] %>% .[1] %>% stringr::str_squish()
}

from_yonhapnewstv_co_kr <- function(x){
  stringr::str_split(x, stringr::fixed("::")) %>%
    .[[1]] %>% .[1] %>%
    stringr::str_squish()
}

from_sportalkorea_com <- function(x){
  stringr::str_split(x, " ") %>%
    .[[1]] %>% .[length(.)] %>%
    stringr::str_squish()
}

published_at_segye_com <- function(x){
  x %>%
    stringr::str_squish() %>%
    stringr::str_split(" : ") %>%
    .[[1]] %>% .[2] %>%
    finish_at_basic()
}

edited_at_segye_com <- function(x){
  x %>%
    stringr::str_squish() %>%
    stringr::str_split(" : ") %>%
    .[[1]] %>% .[3] %>%
    finish_at_basic()
}

body_news_sbs_co_kr <- function(x){
  remove_tag(x, "a") %>%
    finish_basic()
}

from_1gan_co_kr <- function(x) {
  tem <- stringr::str_split(trimws(x), " ")[[1]]
  return(tem[length(tem)])
}

published_at_1gan_co_kr <- function(x) {
  trimws(x) %>%
    stringr::str_split(" ") %>%
    .[[1]] %>% .[-1] %>%
    stringr::str_c(collapse = " ") %>%
    lubridate::ymd_hm(tz = "Asia/Seoul") %>%
    return()
}

published_at_abouthr_co_kr <- function(x){
  x[length(x)] %>%
    finish_basic() %>%
    lubridate::ymd_hm(tz = "Asia/Seoul", quiet = T)
}

published_at_biz_chosun_com <- function(x) {
  stringr::str_split(x, stringr::fixed("|")) %>%
    .[[1]] %>% .[1] %>%
    stringr::str_squish() %>%
    lubridate::ymd_hm(tz = "Asia/Seoul", quiet = T)
}

edited_at_biz_chosun_com <- function(x) {
  stringr::str_split(x, stringr::fixed("|")) %>%
    .[[1]] %>% .[2] %>%
    stringr::str_squish() %>%
    lubridate::ymd_hm(tz = "Asia/Seoul", quiet = T)
}

from_biz_chosun_com <- function(x) {
  stringr::str_split(x, ",") %>%
    .[[1]] %>% .[1] %>%
    finish_basic()
}

body_biz_chosun_com <- function(x) {
  tar_rm <- c("div.news_date", "script", "style")
  x %>%
    remove_tag(tar_rm) %>%
    finish_basic()
}


from_news_chosun_com <- function(x) {
  stringr::str_split(x, stringr::fixed(",")) %>%
    .[[1]] %>% .[1] %>%
    stringr::str_squish()
}

edited_at_news_chosun_com <- function(x) {
  stringr::str_split(x, stringr::fixed("|")) %>%
    .[[1]] %>% .[2] %>%
    stringr::str_squish() %>%
    lubridate::ymd_hm(tz = "Asia/Seoul", quiet = T)
}

body_news_chosun_com <- function(x) {
  tar_rm <- c("div.news_date",
              "h3.news_subtitle",
              "div.news_like",
              "div.news_rel",
              "div.news_copyright",
              "script",
              "style")
  x %>%
    remove_tag(tar_rm) %>%
    finish_basic()
}

body_news_heraldcorp_com <- function(x) {
  remove_tag(x, "table") %>%
    finish_basic()
}

edited_at_view_asiae_co_kr <- function(x) {
  stringr::str_split(x, stringr::fixed("\n")) %>%
    .[[1]] -> tem
  tem[2] %>%
    stringr::str_squish() %>%
    lubridate::ymd_hm(tz = "Asia/Seoul", quiet = T) -> cand1
  tem[3] %>%
    stringr::str_squish() %>%
    lubridate::ymd_hm(tz = "Asia/Seoul", quiet = T) -> cand2
  if (cand1 == cand2){
    return(lubridate::as_datetime(NA))
  } else {
    return(cand1)
  }
}


body_view_asiae_co_kr <- function(x){
  rm_tar <- c(
    "div.article_photo",
    "div.art_btm",
    "div.news_twobox",
    "div.add_banner",
    "p.txt_prohibition",
    "div.e_article"
  )
  remove_tag(x, rm_tar) %>%
    finish_basic()
}


edited_at_edaily_co_kr <- function(x) {
  x[2] %>%
    stringr::str_squish() %>%
    lubridate::ymd_hms(tz = "Asia/Seoul", quiet = T)
}

body_edaily_co_kr <- function(x){
  rm_tar <- c(
    "table"
  )
  remove_tag(x, rm_tar) %>%
    finish_basic()
}

read_seoul_co_kr <- function(x, encoding) {
  httr::GET(x) %>%
    httr::content("raw") %>%
    rawToChar() %>%
    xml2::read_html()
}

body_seoul_co_kr <- function(x) {
  rm_tar <- c(
    "div.stit",
    "strong",
    "script",
    "div.v_photoarea"
  )
  remove_tag(x, rm_tar) %>%
    finish_basic()
}

edited_at_seoul_co_kr <- function(x) {
  stringr::str_split(x, stringr::fixed("ㅣ")) %>%
    .[[1]] %>% .[2] %>%
    stringr::str_squish() %>%
    lubridate::ymd_hm(tz = "Asia/Seoul", quiet = T)
}

from_pressian_com <- function(x) {
  stringr::str_split(x, " ") %>%
    .[[1]] %>% .[length(.)]
}

published_at_mbn_mk_co_kr <- function(x){
  stringr::str_split(x, "l") %>%
    .[[1]] %>% .[1] %>%
    stringr::str_squish() %>%
    lubridate::ymd_hm(tz = "Asia/Seoul", quiet = T)
}

edited_at_mbn_mk_co_kr <- function(x){
  stringr::str_split(x, "l") %>%
    .[[1]] %>% .[2] %>%
    stringr::str_squish() %>%
    lubridate::ymd_hm(tz = "Asia/Seoul", quiet = T)
}


from_dt_co_kr <- function(x) {
  stringr::str_split(x," ") %>%
    .[[1]] %>% .[length(.)]
}

body_dt_co_kr <- function(x) {
  rm_tar <- c(
    "div.img_center",
    "a"
  )
  remove_tag(x, rm_tar) %>%
    finish_basic()
}

from_nocutnews_co_kr <- function(x) {
  stringr::str_split(x, " ") %>%
    .[[1]] %>% .[length(.)] %>%
    stringr::str_squish()
}

body_nocutnews_co_kr <- function(x) {
  rm_tar <- c(
    "div.viewpic"
  )
  remove_tag(x, rm_tar) %>%
    finish_basic()
}

by_nocutnews_co_kr <- function(x) {
  stringr::str_split(x, " ") %>%
    .[[1]] %>% .[-1] %>%
    stringr::str_c(collapse = " ")
}


body_mk_co_kr <- function(x) {
  rm_tar <- c(
    "div.img_center",
    "script"
  )
  remove_tag(x, rm_tar) %>%
    finish_basic()
}


from_ytn_co_kr <- function(x) {
  stringr::str_split(x, " ") %>%
    .[[1]] %>% .[length(.)]
}

read_ytn_co_kr <- function(x, encoding){
  httr::GET(x) %>%
    httr::content("raw") %>%
    rawToChar() -> tem
  Encoding(tem) <- toupper(encoding)
  stringr::str_remove_all(tem, "<!-{2,}.*?-{2,}>") %>%
    xml2::read_html()
}


body_bloter_net <- function(x) {
  rm_tar <- c(
    "p.wp-caption-text",
    "script"
  )
  remove_tag(x, rm_tar) %>%
    finish_basic()
}

published_at_bloter_net <- function(x) {
  lubridate::ymd(x[1], tz = "Asia/Seoul", quiet = T)
}

body_news_mt_co_kr <- function(x) {
  rm_tar <- c(
    "table.article_photo"
  )
  remove_tag(x, rm_tar) %>%
    finish_basic()
}

body_sports_donga_com <- function(x) {
  rm_tar <- c(
    "b","a",
    "div.articlePhoto_C"
  )
  remove_tag(x, rm_tar) %>%
    finish_basic()
}

body_newsis_com <- function(x) {
  rm_tar <- c(
    "div.summary_view",
    "div.view_text"
  )
  remove_tag(x, rm_tar) %>%
    finish_basic()
}


body_news_jtbc_joins_com <- function(x) {
  rm_tar <- c(
    "div.module_report"
  )
  remove_tag(x, rm_tar) %>%
    finish_basic()
}


edited_at_sisain_co_kr <- function(x) {
  lubridate::ymd(x[1], tz = "Asia/Seoul", quiet = T)
}

body_sisain_co_kr <- function(x) {
  rm_tar <- c(
    "div"
  )
  remove_tag(x, rm_tar) %>%
    finish_basic()
}


from_mydaily_co_kr <- function(x) {
  jsonlite::fromJSON(x)$name
}



published_at_sportsseoul_com <- function(x) {
  lubridate::ymd_hm(x[1], tz = "Asia/Seoul", quiet = T)
}

edited_at_sportsseoul_com <- function(x) {
  lubridate::ymd_hm(x[2], tz = "Asia/Seoul", quiet = T)
}




published_at_news_kbs_co_kr <- function(x) {
  lubridate::ymd_hm(x[1], tz = "Asia/Seoul", quiet = T)
}

edited_at_news_kbs_co_kr <- function(x) {
  lubridate::ymd_hm(x[2], tz = "Asia/Seoul", quiet = T)
}

from_etnews_com <- function(x) {
  stringr::str_split(x, " ") %>%
    .[[1]] %>% .[length(.)]
}

from_news_khan_co_kr <- function(x) {
  stringr::str_split(x, " ") %>%
    .[[1]] %>% .[length(.)]
}

body_news_khan_co_kr <- function(x) {
  rvest::html_text(x) %>%
    stringr::str_c(collapse = " ")
}


published_at_inews24_com <- function(x){
  lubridate::ymd_hm(x[1], tz = "Asia/Seoul", quiet = T)
}
edited_at_inews24_com <- function(x) {
  lubridate::ymd_hm(x[2], tz = "Asia/Seoul", quiet = T)
}
body_inews24_com <- function(x) {
  rm_tar <- c(
    "address",
    "h1.photo-list",
    "ul.related", "script",
    "figcaption","h1.elli1",
    "ad"
  )
  remove_tag(x, rm_tar) %>%
    finish_basic()
}
