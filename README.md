
<!-- README.md is generated from README.Rmd. Please edit that file -->

# newspaper

<!-- badges: start -->

[![Travis build
status](https://travis-ci.org/forkonlp/newspaper.svg?branch=master)](https://travis-ci.org/forkonlp/newspaper)
[![AppVeyor build
status](https://ci.appveyor.com/api/projects/status/github/forkonlp/newspaper?branch=master&svg=true)](https://ci.appveyor.com/project/forkonlp/newspaper)
<!-- badges: end -->

The goal of newspaper is to extract contents from Newspaper’s website.

## Installation

You can install the released version of newspaper from
[Github](https://github.com/forkonlp/newspaper) with:

``` r
# install.packages("remotes")
remotes::install_github("forkonlp/newspaper")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(newspaper)
library(dplyr)
library(purrr)

c("http://www.100ssd.co.kr/news/articleView.html?idxno=62271",
  "http://1318virus.net/?p=1129",
  "http://www.1gan.co.kr/news/articleView.html?idxno=179119",
  "http://www.ablenews.co.kr/News/NewsContent.aspx?CategoryCode=0014&NewsCode=001420190620151645090595",
  "http://www.abouthr.co.kr/news/articleView.html?idxno=2554",
  "http://www.aflnews.co.kr/news/articleView.html?idxno=158380") %>% 
  iwalk(
    ~ np_news(.x) %>% 
      glimpse()
  )
#> Observations: 1
#> Variables: 6
#> $ title        [3m[38;5;246m<chr>[39m[23m "대한노인회 충남 예산군지회 주교3리경로당, 신나는 공동작업장"
#> $ body         [3m[38;5;246m<chr>[39m[23m "[백세시대=김순근기자] “출근이 즐거워”… 할머니 18명 매일 일하는 재미에 행복지수 ...
#> $ from         [3m[38;5;246m<chr>[39m[23m "백세시대"
#> $ published_at [3m[38;5;246m<dttm>[39m[23m 2019-06-21 15:40:00
#> $ edited_at    [3m[38;5;246m<dttm>[39m[23m NA
#> $ by           [3m[38;5;246m<chr>[39m[23m "김순근 기자"
#> Observations: 1
#> Variables: 6
#> $ title        [3m[38;5;246m<chr>[39m[23m "정치에서 소외되는 청년들 “군대 다녀와도 나이 때문에 피선거권이 없어요”"
#> $ body         [3m[38;5;246m<chr>[39m[23m "“군대 다녀와도 나이 때문에 피선거권이 없어요” “정당 대표여도 나이 때문에 피선거권이...
#> $ from         [3m[38;5;246m<chr>[39m[23m "인터넷뉴스 바이러스"
#> $ published_at [3m[38;5;246m<dttm>[39m[23m 2018-04-18 23:02:43
#> $ edited_at    [3m[38;5;246m<dttm>[39m[23m NA
#> $ by           [3m[38;5;246m<chr>[39m[23m "문일평 기자"
#> Observations: 1
#> Variables: 6
#> $ title        [3m[38;5;246m<chr>[39m[23m "성남시, 24~27일 농작물 체험 행사 열려…초·중·고교생 900여 명 참여"
#> $ body         [3m[38;5;246m<chr>[39m[23m "성남시가 운영하는 공공형 농장인 중원구 성남동 성남시민농원에서 감자 캐기 행사가 열린다...
#> $ from         [3m[38;5;246m<chr>[39m[23m "일간경기"
#> $ published_at [3m[38;5;246m<dttm>[39m[23m 2019-06-20 14:06:00
#> $ edited_at    [3m[38;5;246m<dttm>[39m[23m NA
#> $ by           [3m[38;5;246m<chr>[39m[23m "정연무 기자"
#> Observations: 1
#> Variables: 6
#> $ title        [3m[38;5;246m<chr>[39m[23m "시각장애인 외면 종합조사표 대정부 투쟁선포"
#> $ body         [3m[38;5;246m<chr>[39m[23m "▲ 시각장애인권리보장연대는 20일 오전 11시 서울 종로구 청와대 분수대 앞에서 대정부...
#> $ from         [3m[38;5;246m<chr>[39m[23m "에이블뉴스"
#> $ published_at [3m[38;5;246m<dttm>[39m[23m 2019-06-20 15:10:14
#> $ edited_at    [3m[38;5;246m<dttm>[39m[23m NA
#> $ by           [3m[38;5;246m<chr>[39m[23m "최석범 기자"
#> Observations: 1
#> Variables: 6
#> $ title        [3m[38;5;246m<chr>[39m[23m "학습 민첩성(Learning Agility), 어떻게 키울 것인가?"
#> $ body         [3m[38;5;246m<chr>[39m[23m "급변하는 경영환경하에서 회사들이 향후에도 지속적으로 성공하기 위해서는 학습 민첩성(Le...
#> $ from         [3m[38;5;246m<chr>[39m[23m "월간 인재경영"
#> $ published_at [3m[38;5;246m<dttm>[39m[23m 2017-07-26 17:21:00
#> $ edited_at    [3m[38;5;246m<dttm>[39m[23m NA
#> $ by           [3m[38;5;246m<chr>[39m[23m "박찬균 바이탈경영교육원 원장"
#> Observations: 1
#> Variables: 6
#> $ title        [3m[38;5;246m<chr>[39m[23m "국회 정상화 지연에 ‘임업직불제’ 도입 논의도 없어"
#> $ body         [3m[38;5;246m<chr>[39m[23m "[농수축산신문=서정학 기자] 국회 공전으로 ‘임업직접지불제(이하 임업직불제)...
#> $ from         [3m[38;5;246m<chr>[39m[23m "농수축산신문"
#> $ published_at [3m[38;5;246m<dttm>[39m[23m 2019-06-21 18:39:00
#> $ edited_at    [3m[38;5;246m<dttm>[39m[23m NA
#> $ by           [3m[38;5;246m<chr>[39m[23m "서정학 기자"
```

## 네이버 뉴스 스탠드 주요 언론사

``` r
c("https://newstapa.org/44014",
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
  "https://news.sbs.co.kr/news/endPage.do?news_id=N1005323012&plink=STAND&cooper=NAVER") %>% 
  iwalk(
    ~ purrr::safely(np_news)(.x) %>% 
      .$result %>% 
      glimpse()
  )
#> Observations: 1
#> Variables: 6
#> $ title        [3m[38;5;246m<chr>[39m[23m "美대학인증기관 \"베데스다대학은 김성혜가 좌지우지...이사회 유명무실\""
#> $ body         [3m[38;5;246m<chr>[39m[23m "美대학인증기관 ‘와스크(WASC)’ 베데스다대학 평가 보고서 입수“김성혜와 ...
#> $ from         [3m[38;5;246m<chr>[39m[23m "한국탐사저널리즘센터 뉴스타파"
#> $ published_at [3m[38;5;246m<dttm>[39m[23m 2018-12-27 18:23:00
#> $ edited_at    [3m[38;5;246m<dttm>[39m[23m NA
#> $ by           [3m[38;5;246m<chr>[39m[23m "홍여진"
#> Warning in file(file, "rt", encoding = fileEncoding): file("") only
#> supports open = "w+" and open = "w+b": using the former
#>  NULL
#> Warning in file(file, "rt", encoding = fileEncoding): file("") only
#> supports open = "w+" and open = "w+b": using the former
#>  NULL
#>  NULL
#> Warning in file(file, "rt", encoding = fileEncoding): file("") only
#> supports open = "w+" and open = "w+b": using the former
#>  NULL
#> Observations: 1
#> Variables: 6
#> $ title        [3m[38;5;246m<chr>[39m[23m "NA"
#> $ body         [3m[38;5;246m<chr>[39m[23m "NA"
#> $ from         [3m[38;5;246m<chr>[39m[23m "NA"
#> $ published_at [3m[38;5;246m<dttm>[39m[23m NA
#> $ edited_at    [3m[38;5;246m<dttm>[39m[23m NA
#> $ by           [3m[38;5;246m<chr>[39m[23m "NA"
#> Warning in file(file, "rt", encoding = fileEncoding): file("") only
#> supports open = "w+" and open = "w+b": using the former
#>  NULL
#> Warning in file(file, "rt", encoding = fileEncoding): file("") only
#> supports open = "w+" and open = "w+b": using the former
#>  NULL
#> Observations: 1
#> Variables: 6
#> $ title        [3m[38;5;246m<chr>[39m[23m "NA"
#> $ body         [3m[38;5;246m<chr>[39m[23m "NA"
#> $ from         [3m[38;5;246m<chr>[39m[23m "NA"
#> $ published_at [3m[38;5;246m<dttm>[39m[23m NA
#> $ edited_at    [3m[38;5;246m<dttm>[39m[23m NA
#> $ by           [3m[38;5;246m<chr>[39m[23m "NA"
#> Observations: 1
#> Variables: 6
#> $ title        [3m[38;5;246m<chr>[39m[23m "NA"
#> $ body         [3m[38;5;246m<chr>[39m[23m "NA"
#> $ from         [3m[38;5;246m<chr>[39m[23m "NA"
#> $ published_at [3m[38;5;246m<dttm>[39m[23m NA
#> $ edited_at    [3m[38;5;246m<dttm>[39m[23m NA
#> $ by           [3m[38;5;246m<chr>[39m[23m "NA"
#> Warning in file(file, "rt", encoding = fileEncoding): file("") only
#> supports open = "w+" and open = "w+b": using the former
#>  NULL
#> Observations: 1
#> Variables: 6
#> $ title        [3m[38;5;246m<chr>[39m[23m "NA"
#> $ body         [3m[38;5;246m<chr>[39m[23m "NA"
#> $ from         [3m[38;5;246m<chr>[39m[23m "NA"
#> $ published_at [3m[38;5;246m<dttm>[39m[23m NA
#> $ edited_at    [3m[38;5;246m<dttm>[39m[23m NA
#> $ by           [3m[38;5;246m<chr>[39m[23m "NA"
#> Warning in file(file, "rt", encoding = fileEncoding): file("") only
#> supports open = "w+" and open = "w+b": using the former
#>  NULL
#> Observations: 1
#> Variables: 6
#> $ title        [3m[38;5;246m<chr>[39m[23m "NA"
#> $ body         [3m[38;5;246m<chr>[39m[23m "NA"
#> $ from         [3m[38;5;246m<chr>[39m[23m "NA"
#> $ published_at [3m[38;5;246m<dttm>[39m[23m NA
#> $ edited_at    [3m[38;5;246m<dttm>[39m[23m NA
#> $ by           [3m[38;5;246m<chr>[39m[23m "NA"
#> Warning in file(file, "rt", encoding = fileEncoding): file("") only
#> supports open = "w+" and open = "w+b": using the former
#>  NULL
#> Observations: 1
#> Variables: 6
#> $ title        [3m[38;5;246m<chr>[39m[23m "NA"
#> $ body         [3m[38;5;246m<chr>[39m[23m "NA"
#> $ from         [3m[38;5;246m<chr>[39m[23m "NA"
#> $ published_at [3m[38;5;246m<dttm>[39m[23m NA
#> $ edited_at    [3m[38;5;246m<dttm>[39m[23m NA
#> $ by           [3m[38;5;246m<chr>[39m[23m "NA"
#> Warning in file(file, "rt", encoding = fileEncoding): file("") only
#> supports open = "w+" and open = "w+b": using the former
#>  NULL
#> Warning in file(file, "rt", encoding = fileEncoding): file("") only
#> supports open = "w+" and open = "w+b": using the former
#>  NULL
```
