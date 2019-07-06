
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

target %>% 
  iwalk(
    ~ {print(.)
      purrr::safely(np_news)(.x) %>% 
      purrr::when(
        is.null(.$result) ~ invisible(.),
        ~ .$result %>% glimpse()
        )}
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
#> $ by           <chr> NA
#> [1] "https://www.sedaily.com/NewsView/1VKJK15CHP"
#> Observations: 1
#> Variables: 6
#> $ title        <chr> "'대선 주자 샌더스, 1,900조원 학자금 빚 탕감 법안 발의'"
#> $ body         <chr> "버니 샌더스 미국 상원의원 /AFP연합뉴스2020년 미국 대선 주자로 꼽히는 진보주의자...
#> $ from         <chr> "서울경제"
#> $ published_at <dttm> 2019-06-24 16:36:17
#> $ edited_at    <dttm> NA
#> $ by           <chr> "김창영 기자"
#> [1] "http://sports.chosun.com/news/ntype.htm?id=201906250100173480011943&ServiceDate=20190624"
#> Observations: 1
#> Variables: 6
#> $ title        <chr> "[SC핫포커스]'성장통? DTD?' NC 급추락 어떻게 봐야하나"
#> $ body         <chr> "◇스포츠조선DB [스포츠조선 박상경 기자]일시적 현상일까, 아니면 예고된 결과였을까.N...
#> $ from         <chr> "스포츠조선"
#> $ published_at <dttm> 2019-06-24 10:46:13
#> $ edited_at    <dttm> NA
#> $ by           <chr> NA
#> [1] "http://isplus.live.joins.com/news/article/article.asp?total_id=23509904"
#> Observations: 1
#> Variables: 6
#> $ title        <chr> "추신수, 희생플라이로 1타점 추가…타율 0.285"
#> $ body         <chr> "텍사스 추신수(37)가 희생플라이로 타점을 올렸다.추신수는 28일(한국시간) 코메리카파...
#> $ from         <chr> "일간스포츠"
#> $ published_at <dttm> 2019-07-06 18:44:21
#> $ edited_at    <dttm> NA
#> $ by           <chr> NA
#> [1] "http://www.mediatoday.co.kr/news/articleView.html?idxno=200760"
#> Observations: 1
#> Variables: 6
#> $ title        <chr> "조선일보 ‘직장 내 괴롭힘 금지’ 사규 조항 신설"
#> $ body         <chr> "직장 내 괴롭힘 금지 조항이 신설된 개정 근로기준법이 오는 7월16일 시행되는 가운데 ...
#> $ from         <chr> "미디어오늘"
#> $ published_at <dttm> 2019-06-24 17:08:00
#> $ edited_at    <dttm> NA
#> $ by           <chr> "정민경 기자"
#> [1] "http://biz.chosun.com/site/data/html_dir/2019/06/24/2019062402909.html"
#> Observations: 1
#> Variables: 6
#> $ title        <chr> "카카오뱅크 대주주 적격성 심사 '파란불'"
#> $ body         <chr> "김범수 카카오 이사회 의장이 금융위원회의 카카오뱅크 대주주 적격성 심사 대상에 해당하지...
#> $ from         <chr> "조선비즈"
#> $ published_at <dttm> 2019-06-24 19:20:00
#> $ edited_at    <dttm> 2019-06-24 19:36:00
#> $ by           <chr> "이윤정 기자"
#> [1] "http://www.zdnet.co.kr/view/?no=20190624164954"
#> [1] "https://www.hankyung.com/economy/article/2019062450611"
#> Observations: 1
#> Variables: 6
#> $ title        <chr> "[단독] 노후 휘발유車도 교체때 개소세 70% 깎아준다"
#> $ body         <chr> "사진=연합뉴스 정부가 연료 종류와 상관없이 노후자동차 교체 때 개별소비세를 70%까지 ...
#> $ from         <chr> "한국경제"
#> $ published_at <dttm> 2019-06-24 17:33:00
#> $ edited_at    <dttm> NA
#> $ by           <chr> "서민준/도병욱"
#> [1] "http://www.segye.com/newsView/20190624511168"
#> Observations: 1
#> Variables: 6
#> $ title        <chr> "민노총, 文정부와 전쟁 선포… \"도 넘었다\" 여론 냉담"
#> $ body         <chr> "국회 앞 집회에서 차단벽을 부수고 경찰을 폭행하는 등 불법행위를 주도한 혐의로 구속영장...
#> $ from         <chr> "세계일보"
#> $ published_at <dttm> 2019-06-24 19:58:31
#> $ edited_at    <dttm> 2019-06-24 22:11:38
#> $ by           <chr> "김승환"
#> [1] "http://www.yonhapnewstv.co.kr/MYH20190624017300038/"
#> Observations: 1
#> Variables: 6
#> $ title        <chr> "민주노총, 대정부 투쟁 ‘맞불’…얼어붙는 노정관계"
#> $ body         <chr> "민주노총, 대정부 투쟁 ‘맞불’…얼어붙는 노정관계 [앵커] 불법 시위를 주도한 혐의로 ...
#> $ from         <chr> "연합뉴스TV"
#> $ published_at <dttm> 2019-06-25 02:27:13
#> $ edited_at    <dttm> NA
#> $ by           <chr> NA
#> [1] "http://www.fnnews.com/news/201906231503559480"
#> Observations: 1
#> Variables: 6
#> $ title        <chr> "손흥민은 1052억원, 전 세계 1위 몸값의 사나이는?"
#> $ body         <chr> "(서울=뉴스1) 정재민 기자 = '슈퍼 손' 손흥민(27·토트넘 홋스퍼)의 몸값이 전 ...
#> $ from         <chr> "파이낸셜뉴스"
#> $ published_at <dttm> 2019-06-23 15:04:00
#> $ edited_at    <dttm> 2019-06-23 15:25:00
#> $ by           <chr> NA
#> [1] "http://www.sportalkorea.com/news/view.php?gisa_uniq=2019062413381708&key=&page=1&field=&section_code=10"
#> No encoding supplied: defaulting to UTF-8.
#> Observations: 1
#> Variables: 6
#> $ title        <chr> "베트남에 뜬 박지성 ''박항서 감독의 성공, 매우 기쁘다''"
#> $ body         <chr> "[스포탈코리아] 서재원 기자= 베트남을 방문한 박지성이 은사 박항서 감독의 성공 신화에...
#> $ from         <chr> "스포탈코리아"
#> $ published_at <dttm> 2019-06-24 13:35:31
#> $ edited_at    <dttm> NA
#> $ by           <chr> "서재원"
#> [1] "http://www.donga.com/news/NewsStand/article/all/20190624/96160046/1"
#> Observations: 1
#> Variables: 6
#> $ title        <chr> "트럼프, 29일 19개월 만에 방한·30일 정상회담…DMZ 방문할까"
#> $ body         <chr> "도널드 트럼프 미국 대통령이 29일부터 1박 2일 일정으로 한국을 찾는다. 2017년 ...
#> $ from         <chr> "동아닷컴"
#> $ published_at <dttm> 2019-06-24 16:56:00
#> $ edited_at    <dttm> 2019-06-24 17:05:00
#> $ by           <chr> "한상준기자 alwaysj@donga.com"
#> [1] "https://news.joins.com/article/23505282"
#> Observations: 1
#> Variables: 6
#> $ title        <chr> "중국 유학생 77명, 제주 쇠소깍에서 쓰레기 줍는 이유"
#> $ body         <chr> "24일 오전 제주도 쇠소깍. 쓰레기 봉투를 든 젊은이 77명이 나타났다. 이어 쓰레기 ...
#> $ from         <chr> "중앙일보"
#> $ published_at <dttm> 2019-06-24 18:06:28
#> $ edited_at    <dttm> NA
#> $ by           <chr> "왕철"
#> [1] "https://www.hankookilbo.com/News/Read/201906242396749918?did=NS&dtype=2&dtypecode=9690&prnewsid="
#> Observations: 1
#> Variables: 6
#> $ title        <chr> "주말 에티오피아 쿠데타 주동자 사살당해"
#> $ body         <chr> "실패로 끝난 에티오피아 암하라주(州) 쿠데타의 주동자가 24일(현지시간) 사살됐다. D...
#> $ from         <chr> "한국일보"
#> $ published_at <dttm> 2019-06-25 08:27:57
#> $ edited_at    <dttm> NA
#> $ by           <chr> "김진욱"
#> [1] "http://www.newdaily.co.kr/site/data/html/2019/06/24/2019062400170.html"
#> Observations: 1
#> Variables: 6
#> $ title        <chr> "\"北 목선귀순은 국방 게이트\" 한국당, 文대통령 고발 추진"
#> $ body         <chr> "북한 어선의 강원 삼척항 진입사건과 관련, 자유한국당 의원들이 현장을 방문하고 이번 사...
#> $ from         <chr> "뉴데일리"
#> $ published_at <dttm> 2019-06-24 17:14:00
#> $ edited_at    <dttm> NA
#> $ by           <chr> "임혜진 기자"
#> [1] "https://news.sbs.co.kr/news/endPage.do?news_id=N1005323012&plink=STAND&cooper=NAVER"
#> Observations: 1
#> Variables: 6
#> $ title        <chr> "'국회 정상화' 원내대표 합의…한국당 의총서 제동"
#> $ body         <chr> "<앵커> 오늘(24일) 8시 뉴스는 할 일이 쌓여 있는 국회 이야기부터 해보겠습니다. ...
#> $ from         <chr> "SBS 뉴스"
#> $ published_at <dttm> 2019-06-24 20:10:00
#> $ edited_at    <dttm> 2019-06-24 22:17:00
#> $ by           <chr> "이호건"
#> [1] "http://www.hani.co.kr/arti/society/society_general/899142.html?_ns=r2"
#> Observations: 1
#> Variables: 6
#> $ title        <chr> "권성동 ‘채용비리’ 1심 무죄…서울중앙지법 형사22부가 내놓은 논리는?"
#> $ body         <chr> "한국 사회를 흔든 채용비리 수사의 기폭제가 됐던 ‘강원랜드 채용비리’ 사건의 핵심 피고...
#> $ from         <chr> "한겨레"
#> $ published_at <dttm> 2019-06-24 20:07:00
#> $ edited_at    <dttm> 2019-06-24 20:20:00
#> $ by           <chr> "고한솔,장예지"
#> [1] "http://www.dailian.co.kr/news/view/805409"
#> Observations: 1
#> Variables: 6
#> $ title        <chr> "바른미래, 혁신위원회 구성 '연기'...실제 운영은 언제?"
#> $ body         <chr> "바른미래당의 혁신위원회 구성이 당초 예정일보다 늦어지고 있다. 당은 혁신위원회 출범을 ...
#> $ from         <chr> "데일리안"
#> $ published_at <dttm> 2019-06-24 15:13:20
#> $ edited_at    <dttm> NA
#> $ by           <chr> "이동우 기자(dwlee99@dailian.co.kr)"
#> [1] "http://news.chosun.com/site/data/html_dir/2019/06/24/2019062402306.html"
#> Observations: 1
#> Variables: 6
#> $ title        <chr> "정권 바뀌니 '무혐의' 뒤집고 수사만 3차례…3년 시달린 권성동, 결국 '무죄'"
#> $ body         <chr> "“피고인들에 대한 각 공소사실은 모두 범죄의 증명이 없는 경우에 해당해 무죄를 선고한다...
#> $ from         <chr> "조선일보"
#> $ published_at <dttm> 2019-06-24 17:54:22
#> $ edited_at    <dttm> 2019-06-25 14:48:00
#> $ by           <chr> "박현익 기자"
#> [1] "http://news.heraldcorp.com/view.php?ud=20190624000010&nt=1&md=20190624071612_BL"
#> Observations: 1
#> Variables: 6
#> $ title        <chr> "고유정 \"신상공개 결정 부당\" 소송했다가 취하"
#> $ body         <chr> "[헤럴드경제=송형근 기자] 전 남편을 잔인하게 살해하고 유기한 혐의를 받는 고유정(36...
#> $ from         <chr> "헤럴드경제"
#> $ published_at <dttm> 2019-06-24 07:14:54
#> $ edited_at    <dttm> NA
#> $ by           <chr> NA
#> [1] "https://view.asiae.co.kr/article/2019062420075833804"
#> Observations: 1
#> Variables: 6
#> $ title        <chr> "경찰, 가능성 없다 했지만…고유정 제주서 '종량제 봉투 4개' 버렸다"
#> $ body         <chr> "[아시아경제 최석환 인턴기자] '제주 전 남편 살해사건' 피의자 고유정(36·여)이 제...
#> $ from         <chr> "아시아경제"
#> $ published_at <dttm> 2019-06-24 20:50:05
#> $ edited_at    <dttm> NA
#> $ by           <chr> "최석환 인턴기자 ccccsh0126@asiae.co.kr"
#> [1] "https://www.edaily.co.kr/news/read?newsId=03516166622525000&mediaCodeNo=257&OutLnkChk=Y"
#> [1] "https://www.seoul.co.kr/news/newsView.php?id=20190625005001&wlog_sub=svt_006"
#> [1] "http://www.pressian.com/news/article/?no=246193"
#> [1] "http://mbn.mk.co.kr/pages/news/newsView.php?ref=newsstand&news_seq_no=3870180&pos=20002_3"
#> [1] "http://www.dt.co.kr/contents.html?article_no=2019062402109932781002&naver=stand"
#> [1] "https://www.nocutnews.co.kr/news/5171990"
#> [1] "https://www.mk.co.kr/news/politics/view/2019/06/451795/"
#> [1] "https://www.ytn.co.kr/_ln/0103_201906241617041128_005"
#> [1] "http://www.bloter.net/archives/343946"
#> [1] "http://news.mt.co.kr/mtview.php?no=2019062418127667075&cast=1&STAND=MTS_P"
#> [1] "http://sports.donga.com/NewsStand/3/all/20190624/96150971/1"
#> [1] "http://www.newsis.com/view/?id=NISX20190624_0000690173&cid="
#> [1] "http://news.jtbc.joins.com/html/034/NB11838034.html"
#> [1] "https://www.sisain.co.kr/?mod=news&act=articleView&idxno=34905"
#> [1] "http://www.mydaily.co.kr/new_yk/html/read.php?newsid=201906242319596580"
#> [1] "http://www.munhwa.com/news/view.html?no=20190624MW145118207290&w=ns"
#> [1] "http://www.sportsseoul.com/news/read/780324"
#> [1] "http://news.kbs.co.kr/news/view.do?ncd=4228349"
#> [1] "http://www.etnews.com/20190624000311?mc=ns_003_00002"
#> [1] "http://imnews.imbc.com/replay/2019/nwdesk/article/5377194_24634.html"
#> [1] "http://news.khan.co.kr/kh_news/khan_art_view.html?artid=201906252223015&code=910402"
#> [1] "http://www.osen.co.kr/article/G1111170712"
#> [1] "http://www.inews24.com/view/1180471"
#> [1] "https://www.hankyung.com/economy/article/2019062450291"
#> Observations: 1
#> Variables: 6
#> $ title        <chr> "이재용 삼성전자 부회장 \"中東 미래사업 공략…발 빠르게 움직이자\""
#> $ body         <chr> "이재용 삼성전자 부회장이 경영 보폭을 넓히고 있다. 삼성전자 등 전자 계열사에 이어 2...
#> $ from         <chr> "한국경제"
#> $ published_at <dttm> 2019-06-24 17:51:00
#> $ edited_at    <dttm> NA
#> $ by           <chr> "황정수/고재연"
```
