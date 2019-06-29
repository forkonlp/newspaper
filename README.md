
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

np_news("http://1318virus.net/?p=1129") %>% 
  glimpse()
#> Observations: 1
#> Variables: 6
#> $ title        <chr> "정치에서 소외되는 청년들 “군대 다녀와도 나이 때문에 피선거권이 없어요”"
#> $ body         <chr> "“군대 다녀와도 나이 때문에 피선거권이 없어요” “정당 대표여도 나이 때문에 피선거권이...
#> $ from         <chr> "인터넷뉴스 바이러스"
#> $ published_at <dttm> 2018-04-18 23:02:43
#> $ edited_at    <dttm> NA
#> $ by           <chr> "문일평 기자"
```

## 네이버 뉴스 스탠드 주요 언론사

``` r
library(tibble)
library(purrr)

print(target)
#>  [1] "https://newstapa.org/44014"                                                                             
#>  [2] "http://news.kmib.co.kr/article/view.asp?arcid=0924085038&code=11121400&sid1=pol&cp=nv2"                 
#>  [3] "https://www.sedaily.com/NewsView/1VKJK15CHP"                                                            
#>  [4] "http://sports.chosun.com/news/ntype5.htm?id=201906250100173480011943&ServiceDate=20190624"              
#>  [5] "http://isplus.live.joins.com/news/article/article.asp?total_id=23504743"                                
#>  [6] "http://www.mediatoday.co.kr/news/articleView.html?idxno=200760"                                         
#>  [7] "http://biz.chosun.com/site/data/html_dir/2019/06/24/2019062402909.html"                                 
#>  [8] "http://www.zdnet.co.kr/view/?no=20190624164954"                                                         
#>  [9] "https://www.hankyung.com/economy/article/2019062450611"                                                 
#> [10] "http://www.segye.com/newsView/20190624511168"                                                           
#> [11] "http://www.yonhapnewstv.co.kr/MYH20190624017300038/"                                                    
#> [12] "http://www.fnnews.com/news/201906231503559480"                                                          
#> [13] "http://www.sportalkorea.com/news/view.php?gisa_uniq=2019062413381708&key=&page=1&field=&section_code=10"
#> [14] "http://www.donga.com/news/NewsStand/article/all/20190624/96160046/1"                                    
#> [15] "https://news.joins.com/article/23505282"                                                                
#> [16] "https://www.hankookilbo.com/News/Read/201906242396749918?did=NS&dtype=2&dtypecode=9690&prnewsid="       
#> [17] "http://www.newdaily.co.kr/site/data/html/2019/06/24/2019062400170.html"                                 
#> [18] "https://news.sbs.co.kr/news/endPage.do?news_id=N1005323012&plink=STAND&cooper=NAVER"                    
#> [19] "http://www.hani.co.kr/arti/society/society_general/899142.html?_ns=r2"                                  
#> [20] "http://www.dailian.co.kr/news/view/805409"                                                              
#> [21] "http://news.chosun.com/site/data/html_dir/2019/06/24/2019062402306.html"                                
#> [22] "http://news.heraldcorp.com/view.php?ud=20190624000010&nt=1&md=20190624071612_BL"                        
#> [23] "https://view.asiae.co.kr/article/2019062420075833804"                                                   
#> [24] "https://www.edaily.co.kr/news/read?newsId=03516166622525000&mediaCodeNo=257&OutLnkChk=Y"                
#> [25] "https://www.seoul.co.kr/news/newsView.php?id=20190625005001&wlog_sub=svt_006"                           
#> [26] "http://www.pressian.com/news/article/?no=246193"                                                        
#> [27] "http://mbn.mk.co.kr/pages/news/newsView.php?ref=newsstand&news_seq_no=3870180&pos=20002_3"              
#> [28] "http://www.dt.co.kr/contents.html?article_no=2019062402109932781002&naver=stand"                        
#> [29] "https://www.nocutnews.co.kr/news/5171990"                                                               
#> [30] "https://www.mk.co.kr/news/politics/view/2019/06/451795/"                                                
#> [31] "https://www.ytn.co.kr/_ln/0103_201906241617041128_005"                                                  
#> [32] "http://www.bloter.net/archives/343946"                                                                  
#> [33] "http://news.mt.co.kr/mtview.php?no=2019062418127667075&cast=1&STAND=MTS_P"                              
#> [34] "http://sports.donga.com/NewsStand/3/all/20190624/96150971/1"                                            
#> [35] "http://www.newsis.com/view/?id=NISX20190624_0000690173&cid="                                            
#> [36] "http://news.jtbc.joins.com/html/034/NB11838034.html"                                                    
#> [37] "https://www.sisain.co.kr/?mod=news&act=articleView&idxno=34905"                                         
#> [38] "http://www.mydaily.co.kr/new_yk/html/read.php?newsid=201906242319596580"                                
#> [39] "http://www.munhwa.com/news/view.html?no=20190624MW145118207290&w=ns"                                    
#> [40] "http://www.sportsseoul.com/news/read/780324"                                                            
#> [41] "http://news.kbs.co.kr/news/view.do?ncd=4228349"                                                         
#> [42] "http://www.etnews.com/20190624000311?mc=ns_003_00002"                                                   
#> [43] "http://imnews.imbc.com/replay/2019/nwdesk/article/5377194_24634.html"                                   
#> [44] "http://news.khan.co.kr/kh_news/khan_art_view.html?artid=201906252223015&code=910402"                    
#> [45] "http://www.osen.co.kr/article/G1111170712"                                                              
#> [46] "http://www.inews24.com/view/1180471"                                                                    
#> [47] "https://www.hankyung.com/economy/article/2019062450291"

target %>% 
  iwalk(
    ~ {print(.)
      purrr::safely(np_news)(.x) %>% 
      .$result %>% 
      glimpse()}
  )
#> [1] "https://newstapa.org/44014"
#> Observations: 1
#> Variables: 6
#> $ title        <chr> "美대학인증기관 \"베데스다대학은 김성혜가 좌지우지...이사회 유명무실\""
#> $ body         <chr> "美대학인증기관 ‘와스크(WASC)’ 베데스다대학 평가 보고서 입수“김성혜와 아들이 좌지...
#> $ from         <chr> "한국탐사저널리즘센터 뉴스타파"
#> $ published_at <dttm> 2018-12-27 18:23:00
#> $ edited_at    <dttm> NA
#> $ by           <chr> "홍여진"
#> [1] "http://news.kmib.co.kr/article/view.asp?arcid=0924085038&code=11121400&sid1=pol&cp=nv2"
#> Observations: 1
#> Variables: 6
#> $ title        <chr> "김정은 “트럼프 친서 만족”, 미, 셈법 변화 밝혔나"
#> $ body         <chr> "김정은 북한 국무위원장이 도널드 트럼프 미국 대통령이 보내온 친서를 읽고 있는 사진을 ...
#> $ from         <chr> "국민일보"
#> $ published_at <dttm> 2019-06-23 18:57:00
#> $ edited_at    <dttm> NA
#> $ by           <chr> "NA"
#> [1] "https://www.sedaily.com/NewsView/1VKJK15CHP"
#> Observations: 1
#> Variables: 6
#> $ title        <chr> "'대선 주자 샌더스, 1,900조원 학자금 빚 탕감 법안 발의'"
#> $ body         <chr> "버니 샌더스 미국 상원의원 /AFP연합뉴스 2020년 미국 대선 주자로 꼽히는 진보주의...
#> $ from         <chr> "서울경제"
#> $ published_at <dttm> 2019-06-24 16:36:17
#> $ edited_at    <dttm> NA
#> $ by           <chr> "김창영 기자"
#> [1] "http://sports.chosun.com/news/ntype5.htm?id=201906250100173480011943&ServiceDate=20190624"
#> Observations: 1
#> Variables: 6
#> $ title        <chr> "[SC핫포커스]'성장통? DTD?' NC 급추락 어떻게 봐야하나"
#> $ body         <chr> "◇스포츠조선DB [스포츠조선 박상경 기자]일시적 현상일까, 아니면 예고된 결과였을까.N...
#> $ from         <chr> "스포츠조선"
#> $ published_at <dttm> 2019-06-24 10:46:13
#> $ edited_at    <dttm> NA
#> $ by           <chr> "NA"
#> [1] "http://isplus.live.joins.com/news/article/article.asp?total_id=23504743"
#> Warning in file(file, "rt", encoding = fileEncoding): 파일("")은 오로지
#> open = "w+"과 open = "w+b"만을 지원합니다: 전자의 것을 사용합니다
#>  NULL
#> [1] "http://www.mediatoday.co.kr/news/articleView.html?idxno=200760"
#> Observations: 1
#> Variables: 6
#> $ title        <chr> "NA"
#> $ body         <chr> "NA"
#> $ from         <chr> "NA"
#> $ published_at <dttm> NA
#> $ edited_at    <dttm> NA
#> $ by           <chr> "NA"
#> [1] "http://biz.chosun.com/site/data/html_dir/2019/06/24/2019062402909.html"
#> Warning in file(file, "rt", encoding = fileEncoding): 파일("")은 오로지
#> open = "w+"과 open = "w+b"만을 지원합니다: 전자의 것을 사용합니다
#>  NULL
#> [1] "http://www.zdnet.co.kr/view/?no=20190624164954"
#> Warning in file(file, "rt", encoding = fileEncoding): 파일("")은 오로지
#> open = "w+"과 open = "w+b"만을 지원합니다: 전자의 것을 사용합니다
#>  NULL
#> [1] "https://www.hankyung.com/economy/article/2019062450611"
#> Observations: 1
#> Variables: 6
#> $ title        <chr> "NA"
#> $ body         <chr> "NA"
#> $ from         <chr> "NA"
#> $ published_at <dttm> NA
#> $ edited_at    <dttm> NA
#> $ by           <chr> "NA"
#> [1] "http://www.segye.com/newsView/20190624511168"
#> Observations: 1
#> Variables: 6
#> $ title        <chr> "NA"
#> $ body         <chr> "NA"
#> $ from         <chr> "NA"
#> $ published_at <dttm> NA
#> $ edited_at    <dttm> NA
#> $ by           <chr> "NA"
#> [1] "http://www.yonhapnewstv.co.kr/MYH20190624017300038/"
#> Warning in file(file, "rt", encoding = fileEncoding): 파일("")은 오로지
#> open = "w+"과 open = "w+b"만을 지원합니다: 전자의 것을 사용합니다
#>  NULL
#> [1] "http://www.fnnews.com/news/201906231503559480"
#> Observations: 1
#> Variables: 6
#> $ title        <chr> "NA"
#> $ body         <chr> "NA"
#> $ from         <chr> "NA"
#> $ published_at <dttm> NA
#> $ edited_at    <dttm> NA
#> $ by           <chr> "NA"
#> [1] "http://www.sportalkorea.com/news/view.php?gisa_uniq=2019062413381708&key=&page=1&field=&section_code=10"
#> Warning in file(file, "rt", encoding = fileEncoding): 파일("")은 오로지
#> open = "w+"과 open = "w+b"만을 지원합니다: 전자의 것을 사용합니다
#>  NULL
#> [1] "http://www.donga.com/news/NewsStand/article/all/20190624/96160046/1"
#> Observations: 1
#> Variables: 6
#> $ title        <chr> "NA"
#> $ body         <chr> "NA"
#> $ from         <chr> "NA"
#> $ published_at <dttm> NA
#> $ edited_at    <dttm> NA
#> $ by           <chr> "NA"
#> [1] "https://news.joins.com/article/23505282"
#> Warning in file(file, "rt", encoding = fileEncoding): 파일("")은 오로지
#> open = "w+"과 open = "w+b"만을 지원합니다: 전자의 것을 사용합니다
#>  NULL
#> [1] "https://www.hankookilbo.com/News/Read/201906242396749918?did=NS&dtype=2&dtypecode=9690&prnewsid="
#> Observations: 1
#> Variables: 6
#> $ title        <chr> "NA"
#> $ body         <chr> "NA"
#> $ from         <chr> "NA"
#> $ published_at <dttm> NA
#> $ edited_at    <dttm> NA
#> $ by           <chr> "NA"
#> [1] "http://www.newdaily.co.kr/site/data/html/2019/06/24/2019062400170.html"
#> Warning in file(file, "rt", encoding = fileEncoding): 파일("")은 오로지
#> open = "w+"과 open = "w+b"만을 지원합니다: 전자의 것을 사용합니다
#>  NULL
#> [1] "https://news.sbs.co.kr/news/endPage.do?news_id=N1005323012&plink=STAND&cooper=NAVER"
#> Warning in file(file, "rt", encoding = fileEncoding): 파일("")은 오로지
#> open = "w+"과 open = "w+b"만을 지원합니다: 전자의 것을 사용합니다
#>  NULL
#> [1] "http://www.hani.co.kr/arti/society/society_general/899142.html?_ns=r2"
#> Observations: 1
#> Variables: 6
#> $ title        <chr> "NA"
#> $ body         <chr> "NA"
#> $ from         <chr> "NA"
#> $ published_at <dttm> NA
#> $ edited_at    <dttm> NA
#> $ by           <chr> "NA"
#> [1] "http://www.dailian.co.kr/news/view/805409"
#> Observations: 1
#> Variables: 6
#> $ title        <chr> "NA"
#> $ body         <chr> "NA"
#> $ from         <chr> "NA"
#> $ published_at <dttm> NA
#> $ edited_at    <dttm> NA
#> $ by           <chr> "NA"
#> [1] "http://news.chosun.com/site/data/html_dir/2019/06/24/2019062402306.html"
#> Warning in file(file, "rt", encoding = fileEncoding): 파일("")은 오로지
#> open = "w+"과 open = "w+b"만을 지원합니다: 전자의 것을 사용합니다
#>  NULL
#> [1] "http://news.heraldcorp.com/view.php?ud=20190624000010&nt=1&md=20190624071612_BL"
#> Warning in file(file, "rt", encoding = fileEncoding): 파일("")은 오로지
#> open = "w+"과 open = "w+b"만을 지원합니다: 전자의 것을 사용합니다
#>  NULL
#> [1] "https://view.asiae.co.kr/article/2019062420075833804"
#> Warning in file(file, "rt", encoding = fileEncoding): 파일("")은 오로지
#> open = "w+"과 open = "w+b"만을 지원합니다: 전자의 것을 사용합니다
#>  NULL
#> [1] "https://www.edaily.co.kr/news/read?newsId=03516166622525000&mediaCodeNo=257&OutLnkChk=Y"
#> Observations: 1
#> Variables: 6
#> $ title        <chr> "NA"
#> $ body         <chr> "NA"
#> $ from         <chr> "NA"
#> $ published_at <dttm> NA
#> $ edited_at    <dttm> NA
#> $ by           <chr> "NA"
#> [1] "https://www.seoul.co.kr/news/newsView.php?id=20190625005001&wlog_sub=svt_006"
#>  NULL
#> [1] "http://www.pressian.com/news/article/?no=246193"
#> Observations: 1
#> Variables: 6
#> $ title        <chr> "NA"
#> $ body         <chr> "NA"
#> $ from         <chr> "NA"
#> $ published_at <dttm> NA
#> $ edited_at    <dttm> NA
#> $ by           <chr> "NA"
#> [1] "http://mbn.mk.co.kr/pages/news/newsView.php?ref=newsstand&news_seq_no=3870180&pos=20002_3"
#> Warning in file(file, "rt", encoding = fileEncoding): 파일("")은 오로지
#> open = "w+"과 open = "w+b"만을 지원합니다: 전자의 것을 사용합니다
#>  NULL
#> [1] "http://www.dt.co.kr/contents.html?article_no=2019062402109932781002&naver=stand"
#>  NULL
#> [1] "https://www.nocutnews.co.kr/news/5171990"
#> Observations: 1
#> Variables: 6
#> $ title        <chr> "NA"
#> $ body         <chr> "NA"
#> $ from         <chr> "NA"
#> $ published_at <dttm> NA
#> $ edited_at    <dttm> NA
#> $ by           <chr> "NA"
#> [1] "https://www.mk.co.kr/news/politics/view/2019/06/451795/"
#>  NULL
#> [1] "https://www.ytn.co.kr/_ln/0103_201906241617041128_005"
#>  NULL
#> [1] "http://www.bloter.net/archives/343946"
#> Observations: 1
#> Variables: 6
#> $ title        <chr> "NA"
#> $ body         <chr> "NA"
#> $ from         <chr> "NA"
#> $ published_at <dttm> NA
#> $ edited_at    <dttm> NA
#> $ by           <chr> "NA"
#> [1] "http://news.mt.co.kr/mtview.php?no=2019062418127667075&cast=1&STAND=MTS_P"
#> Warning in file(file, "rt", encoding = fileEncoding): 파일("")은 오로지
#> open = "w+"과 open = "w+b"만을 지원합니다: 전자의 것을 사용합니다
#>  NULL
#> [1] "http://sports.donga.com/NewsStand/3/all/20190624/96150971/1"
#> Warning in file(file, "rt", encoding = fileEncoding): 파일("")은 오로지
#> open = "w+"과 open = "w+b"만을 지원합니다: 전자의 것을 사용합니다
#>  NULL
#> [1] "http://www.newsis.com/view/?id=NISX20190624_0000690173&cid="
#> Observations: 1
#> Variables: 6
#> $ title        <chr> "NA"
#> $ body         <chr> "NA"
#> $ from         <chr> "NA"
#> $ published_at <dttm> NA
#> $ edited_at    <dttm> NA
#> $ by           <chr> "NA"
#> [1] "http://news.jtbc.joins.com/html/034/NB11838034.html"
#> Warning in file(file, "rt", encoding = fileEncoding): 파일("")은 오로지
#> open = "w+"과 open = "w+b"만을 지원합니다: 전자의 것을 사용합니다
#>  NULL
#> [1] "https://www.sisain.co.kr/?mod=news&act=articleView&idxno=34905"
#> Warning in file(file, "rt", encoding = fileEncoding): 파일("")은 오로지
#> open = "w+"과 open = "w+b"만을 지원합니다: 전자의 것을 사용합니다
#>  NULL
#> [1] "http://www.mydaily.co.kr/new_yk/html/read.php?newsid=201906242319596580"
#>  NULL
#> [1] "http://www.munhwa.com/news/view.html?no=20190624MW145118207290&w=ns"
#> Warning in file(file, "rt", encoding = fileEncoding): 파일("")은 오로지
#> open = "w+"과 open = "w+b"만을 지원합니다: 전자의 것을 사용합니다
#>  NULL
#> [1] "http://www.sportsseoul.com/news/read/780324"
#> Observations: 1
#> Variables: 6
#> $ title        <chr> "NA"
#> $ body         <chr> "NA"
#> $ from         <chr> "NA"
#> $ published_at <dttm> NA
#> $ edited_at    <dttm> NA
#> $ by           <chr> "NA"
#> [1] "http://news.kbs.co.kr/news/view.do?ncd=4228349"
#> Warning in file(file, "rt", encoding = fileEncoding): 파일("")은 오로지
#> open = "w+"과 open = "w+b"만을 지원합니다: 전자의 것을 사용합니다
#>  NULL
#> [1] "http://www.etnews.com/20190624000311?mc=ns_003_00002"
#> Observations: 1
#> Variables: 6
#> $ title        <chr> "NA"
#> $ body         <chr> "NA"
#> $ from         <chr> "NA"
#> $ published_at <dttm> NA
#> $ edited_at    <dttm> NA
#> $ by           <chr> "NA"
#> [1] "http://imnews.imbc.com/replay/2019/nwdesk/article/5377194_24634.html"
#> Warning in file(file, "rt", encoding = fileEncoding): 파일("")은 오로지
#> open = "w+"과 open = "w+b"만을 지원합니다: 전자의 것을 사용합니다
#>  NULL
#> [1] "http://news.khan.co.kr/kh_news/khan_art_view.html?artid=201906252223015&code=910402"
#> Warning in file(file, "rt", encoding = fileEncoding): 파일("")은 오로지
#> open = "w+"과 open = "w+b"만을 지원합니다: 전자의 것을 사용합니다
#>  NULL
#> [1] "http://www.osen.co.kr/article/G1111170712"
#> Warning in file(file, "rt", encoding = fileEncoding): 파일("")은 오로지
#> open = "w+"과 open = "w+b"만을 지원합니다: 전자의 것을 사용합니다
#>  NULL
#> [1] "http://www.inews24.com/view/1180471"
#> Observations: 1
#> Variables: 6
#> $ title        <chr> "NA"
#> $ body         <chr> "NA"
#> $ from         <chr> "NA"
#> $ published_at <dttm> NA
#> $ edited_at    <dttm> NA
#> $ by           <chr> "NA"
#> [1] "https://www.hankyung.com/economy/article/2019062450291"
#> Observations: 1
#> Variables: 6
#> $ title        <chr> "NA"
#> $ body         <chr> "NA"
#> $ from         <chr> "NA"
#> $ published_at <dttm> NA
#> $ edited_at    <dttm> NA
#> $ by           <chr> "NA"
```
