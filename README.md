
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
#> 
#> Attaching package: 'dplyr'
#> The following objects are masked from 'package:stats':
#> 
#>     filter, lag
#> The following objects are masked from 'package:base':
#> 
#>     intersect, setdiff, setequal, union

np_news("http://www.100ssd.co.kr/news/articleView.html?idxno=62271") %>% glimpse()
#> Observations: 1
#> Variables: 6
#> $ title        <chr> "대한노인회 충남 예산군지회 주교3리경로당, 신나는 공동작업장"
#> $ body         <chr> "[백세시대=김순근기자] “출근이 즐거워”… 할머니 18명 매일 일하는 재미에 행복지수 ...
#> $ from         <chr> "백세시대"
#> $ published_at <dttm> 2019-06-21 15:40:00
#> $ edited_at    <dttm> NA
#> $ by           <chr> "김순근 기자"
np_news("http://1318virus.net/?p=1129") %>% glimpse()
#> Observations: 1
#> Variables: 6
#> $ title        <chr> "정치에서 소외되는 청년들 “군대 다녀와도 나이 때문에 피선거권이 없어요”"
#> $ body         <chr> "“군대 다녀와도 나이 때문에 피선거권이 없어요” “정당 대표여도 나이 때문에 피선거권이...
#> $ from         <chr> "인터넷뉴스 바이러스"
#> $ published_at <dttm> 2018-04-18 23:02:43
#> $ edited_at    <dttm> NA
#> $ by           <chr> "문일평 기자"
np_news("http://www.1gan.co.kr/news/articleView.html?idxno=179119") %>% glimpse()
#> Observations: 1
#> Variables: 6
#> $ title        <chr> "성남시, 24~27일 농작물 체험 행사 열려…초·중·고교생 900여 명 참여"
#> $ body         <chr> "성남시가 운영하는 공공형 농장인 중원구 성남동 성남시민농원에서 감자 캐기 행사가 열린다...
#> $ from         <chr> "일간경기"
#> $ published_at <dttm> 2019-06-20 14:06:00
#> $ edited_at    <dttm> NA
#> $ by           <chr> "정연무 기자"
np_news("http://www.ablenews.co.kr/News/NewsContent.aspx?CategoryCode=0014&NewsCode=001420190620151645090595") %>% glimpse()
#> Observations: 1
#> Variables: 6
#> $ title        <chr> "시각장애인 외면 종합조사표 대정부 투쟁선포"
#> $ body         <chr> "▲ 시각장애인권리보장연대는 20일 오전 11시 서울 종로구 청와대 분수대 앞에서 대정부...
#> $ from         <chr> "에이블뉴스"
#> $ published_at <dttm> 2019-06-20 15:10:14
#> $ edited_at    <dttm> NA
#> $ by           <chr> "최석범 기자"
np_news("http://www.abouthr.co.kr/news/articleView.html?idxno=2554") %>% glimpse()
#> Observations: 1
#> Variables: 6
#> $ title        <chr> "학습 민첩성(Learning Agility), 어떻게 키울 것인가?"
#> $ body         <chr> "급변하는 경영환경하에서 회사들이 향후에도 지속적으로 성공하기 위해서는 학습 민첩성(Le...
#> $ from         <chr> "월간 인재경영"
#> $ published_at <dttm> 2017-07-26 17:21:00
#> $ edited_at    <dttm> NA
#> $ by           <chr> "박찬균 바이탈경영교육원 원장"
np_news("http://www.aflnews.co.kr/news/articleView.html?idxno=158380") %>% glimpse()
#> Observations: 1
#> Variables: 6
#> $ title        <chr> "국회 정상화 지연에 ‘임업직불제’ 도입 논의도 없어"
#> $ body         <chr> "[농수축산신문=서정학 기자] 국회 공전으로 ‘임업직접지불제(이하 임업직불제)’ 도입을 ...
#> $ from         <chr> "농수축산신문"
#> $ published_at <dttm> 2019-06-21 18:39:00
#> $ edited_at    <dttm> NA
#> $ by           <chr> "서정학 기자"
```

## Target Site
