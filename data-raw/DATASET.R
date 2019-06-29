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



target <- c("https://newstapa.org/44014",
  "http://news.kmib.co.kr/article/view.asp?arcid=0924085038&code=11121400&sid1=pol&cp=nv2",
  "https://www.sedaily.com/NewsView/1VKJK15CHP",
  "http://sports.chosun.com/news/ntype5.htm?id=201906250100173480011943&ServiceDate=20190624",
  "http://isplus.live.joins.com/news/article/article.asp?total_id=23504743",
  "http://www.mediatoday.co.kr/news/articleView.html?idxno=200760",
  "http://biz.chosun.com/site/data/html_dir/2019/06/24/2019062402909.html",
  "http://www.zdnet.co.kr/view/?no=20190624164954",
  "https://www.hankyung.com/economy/article/2019062450611",
  "http://www.segye.com/newsView/20190624511168",
  "http://www.yonhapnewstv.co.kr/MYH20190624017300038/",
  "http://www.fnnews.com/news/201906231503559480",
  "http://www.sportalkorea.com/news/view.php?gisa_uniq=2019062413381708&key=&page=1&field=&section_code=10",
  "http://www.donga.com/news/NewsStand/article/all/20190624/96160046/1",
  "https://news.joins.com/article/23505282",
  "https://www.hankookilbo.com/News/Read/201906242396749918?did=NS&dtype=2&dtypecode=9690&prnewsid=",
  "http://www.newdaily.co.kr/site/data/html/2019/06/24/2019062400170.html",
  "https://news.sbs.co.kr/news/endPage.do?news_id=N1005323012&plink=STAND&cooper=NAVER",
  "http://www.hani.co.kr/arti/society/society_general/899142.html?_ns=r2",
  "http://www.dailian.co.kr/news/view/805409",
  "http://news.chosun.com/site/data/html_dir/2019/06/24/2019062402306.html",
  "http://news.heraldcorp.com/view.php?ud=20190624000010&nt=1&md=20190624071612_BL",
  "https://view.asiae.co.kr/article/2019062420075833804",
  "https://www.edaily.co.kr/news/read?newsId=03516166622525000&mediaCodeNo=257&OutLnkChk=Y",
  "https://www.seoul.co.kr/news/newsView.php?id=20190625005001&wlog_sub=svt_006",
  "http://www.pressian.com/news/article/?no=246193",
  "http://mbn.mk.co.kr/pages/news/newsView.php?ref=newsstand&news_seq_no=3870180&pos=20002_3",
  "http://www.dt.co.kr/contents.html?article_no=2019062402109932781002&naver=stand",
  "https://www.nocutnews.co.kr/news/5171990",
  "https://www.mk.co.kr/news/politics/view/2019/06/451795/",
  "https://www.ytn.co.kr/_ln/0103_201906241617041128_005",
  "http://www.bloter.net/archives/343946",
  "http://news.mt.co.kr/mtview.php?no=2019062418127667075&cast=1&STAND=MTS_P",
  "http://sports.donga.com/NewsStand/3/all/20190624/96150971/1",
  "http://www.newsis.com/view/?id=NISX20190624_0000690173&cid=",
  "http://news.jtbc.joins.com/html/034/NB11838034.html",
  "https://www.sisain.co.kr/?mod=news&act=articleView&idxno=34905",
  "http://www.mydaily.co.kr/new_yk/html/read.php?newsid=201906242319596580",
  "http://www.munhwa.com/news/view.html?no=20190624MW145118207290&w=ns",
  "http://www.sportsseoul.com/news/read/780324",
  "http://news.kbs.co.kr/news/view.do?ncd=4228349",
  "http://www.etnews.com/20190624000311?mc=ns_003_00002",
  "http://imnews.imbc.com/replay/2019/nwdesk/article/5377194_24634.html",
  "http://news.khan.co.kr/kh_news/khan_art_view.html?artid=201906252223015&code=910402",
  "http://www.osen.co.kr/article/G1111170712",
  "http://www.inews24.com/view/1180471",
  "https://www.hankyung.com/economy/article/2019062450291")

use_data(target, overwrite = T)
