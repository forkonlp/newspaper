
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
library(stringr)

news <- np_news("http://www.segye.com/newsView/20190624511168")

news 
#> # A tibble: 1 x 6
#>   title     body        from  published_at        edited_at           by   
#>   <chr>     <chr>       <chr> <dttm>              <dttm>              <chr>
#> 1 "민노총, 文정~ 국회 앞 집회에서 ~ 세계일보~ 2019-06-24 19:58:31 2019-06-24 22:11:38 김승환~

news$title
#> [1] "민노총, 文정부와 전쟁 선포… \"도 넘었다\" 여론 냉담"
news$from
#> [1] "세계일보"
news$published_at
#> [1] "2019-06-24 19:58:31 KST"
news$edited_at
#> [1] "2019-06-24 22:11:38 KST"
news$by
#> [1] "김승환"
news$body %>% 
  str_wrap(80) %>% 
  cat()
#> 국회 앞 집회에서 차단벽을 부수고 경찰을 폭행하는 등 불법행위를 주도한 혐의로 구
#> 속영장이 청구된 김명환 민주노총 위원장이 21일 서울 양천구 서울남부지방법원에서
#> 영장실질심사를 받은 뒤 법정을 나서고 있다. 연합뉴스 “문재인 대통령은 끝내 민노총
#> 을 짓밟고 김명환 위원장 동지를 잡아 가뒀다. 노동존중 재벌개혁에서 노동탄압 재벌
#> 존중 사회로 가겠다는 문재인정부의 선전포고다.” 김경자 전국민주노총조합총연맹(민
#> 노총) 위원장 직무대행이 24일 청와대 사랑채 앞에서 열린 ‘문재인정부 노동탄압 규
#> 탄과 민주노총 대응투쟁 계획 발표’ 기자회견에서 밝힌 결의문 일부다. 민노총은 이
#> 날 김 위원장 구속 대응 차원에서 7월 총파업 등 대정부 강경투쟁 계획을 공식 발표했
#> 다. 최저임금위원회, 일자리위원회 등 사회적 대화 기구 불참 카드도 검토하겠다고 밝
#> 혔다. 청와대는 이날 김 위원장 구속과 관련해 “무척 안타까운 일이지만 사법부의 결
#> 정”이라고만 밝혔다. 청와대가 김 위원장 구속에 대해 입장을 공개 표명한 건 처음이
#> 다. “정부 노동탄압 규탄” 24일 오전 서울 종로구 청와대 사랑채 앞에서 민노총 중앙
#> 집행위원들이 ‘문재인정부 노동탄압 규탄과 민주노총 대응투쟁 계획 발표 기자회견’을
#> 열고 구호를 외치고 있다. 남정탁 기자 정당한 법절차에 따른 결정에 민노총이 과도
#> 하게 정치적 해석에 나선 것 자체에 대해 전문가와 시민들의 반응은 냉담하다. 오히려
#> 전문가들은 “(민노총의 행보는) 사회적 공감대가 결여된 결정으로, 일반 시민들로부터
#> 고립을 자초하고 있다”고 비판하고 있다. 성태윤 연세대 교수(경제학부)는 “문재인정
#> 부가 그간 경제에 미치는 부정적 영향에도 불구하고 노동 이슈와 관련해 민노총에 우
#> 호적인 방향으로 정책을 수행했는데도 민노총의 전면적 총파업은 적절하다고 보기 어
#> 렵다”고 지적했다. 윤창현 서울시립대 교수(경영학부)도 “법원의 판단에 따라 이뤄진
#> 것을 이유로 총파업을 벌이는 게 과연 전체 근로자의 권익을 위한 결정인지 의문”이라
#> 면서 “‘촛불청구서’라는 말이 들릴 정도로 민노총이 무소불위 모습을 보이는 데 대해
#> 사회가 불편한 시선을 많이 보내고 있다”고 비판했다. 민노총 측은 이번 결정이 단순
#> 히 김 위원장 구속만이 아니라 정부의 저임금·장시간 노동 문제 관련 움직임 대응 차
#> 원에서 이뤄진 것이란 입장이다. 김형석 민노총 대변인은 “최저임금 산입범위 확대,
#> 탄력근로제 확대 등 저임금·장시간 노동을 강화하는 법안의 국회 통과를 막기 위해 집
#> 회를 벌이던 중 김 위원장이 구속됐다”면서 “영장은 법원 판단 아래 발부되지만 경찰,
#> 검찰을 거쳐서 영장 청구가 이뤄진다는 걸 고려하면 문재인정부가 책임을 피할 수 없
#> 다”고 반박했다. 김 위원장 직무대행은 이날 “300명 넘는 민노총 간부와 조합원 동지
#> 들이 집결해 문재인정부 노동탄압에 대한 분노로 강력한 규탄 투쟁을 결의했다”며 “이
#> 분노는 결국 7·3 공공부문 비정규노동자 총파업과 7·18 문재인정부 노동탄압 규탄 총
#> 파업 투쟁으로 불타오를 것”이라고 말했다. 비정규노동자 총파업의 민노총 측 참여 예
#> 상 인원은 20만명이다. 7월18일로 예정된 총파업 규모는 오는 28일 열리는 전국 단위
#> 사업장 대표자 결의대회에서 대강의 윤곽이 나올 것으로 보인다. 민노총은 거리 투쟁
#> 과 함께 사회적 대화 불참도 검토한다는 입장이다. 김 직무대행은 “최저임금위원회에
#> 서 빠지는 걸 검토할 것”이라면서 “다만 위원회에서 현재 최저임금 차등적용을 검토
#> 중인 상황이라 표결에 빠지면 불리한 결과를 초래할 수 있어 당분간은 참석할 예정”이
#> 라고 밝혔다. 최저임금위 외 다른 기구 불참이 잇따를 가능성도 크다. 김 직무대행은
#> “일단 개인 판단 아래 이번주 금요일(28일) 예정된 일자리위원회는 불참할 것”이라며
#> “민주노총 차원에선 더 논의해봐야 한다”고 설명했다. 민노총은 지난해 11월 기준 53
#> 개 정부 위원회에 참여 중이다. 김승환·이강진·박현준 기자hwan@segye.com [ⓒ 세계일
#> 보 & Segye.com, 무단전재 및 재배포 금지]
```

## 네이버 뉴스 스탠드 주요 언론사

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
    #> $ published_at <dttm> 2019-07-07 10:29:48
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
    #> Observations: 1
    #> Variables: 6
    #> $ title        <chr> "나사 풀린 공무원, 근무시간에 '속눈썹 연장' 시술받다 덜미"
    #> $ body         <chr> "[이데일리 이재길 기자] 근무시간에 대전시청 수유실에서 불법 미용시술을 받은 공무원이 ...
    #> $ from         <chr> "이데일리"
    #> $ published_at <dttm> 2019-06-24 16:45:20
    #> $ edited_at    <dttm> 2019-06-24 04:47:47
    #> $ by           <chr> "이재길 기자"
    #> [1] "https://www.seoul.co.kr/news/newsView.php?id=20190625005001&wlog_sub=svt_006"
    #> Observations: 1
    #> Variables: 6
    #> $ title        <chr> "무면허·계산오류·기계 오작동… 한빛 1호기 사고는 역시나 人災"
    #> $ body         <chr> "지난달 10일 발생한 한빛 원자력발전소 1호기의 열출력 급증 사고는 무면허 운전과 제어...
    #> $ from         <chr> "서울신문"
    #> $ published_at <dttm> 2019-06-24 18:10:00
    #> $ edited_at    <dttm> 2019-06-24 18:34:00
    #> $ by           <chr> "이두걸"
    #> [1] "http://www.pressian.com/news/article/?no=246193"
    #> Observations: 1
    #> Variables: 6
    #> $ title        <chr> "여야, 패스트트랙 법안 처리 합의 문구 만들었다"
    #> $ body         <chr> "두 달 가까이 멈춰섰던 국회가 가까스로 다시 활로를 찾았다. 더불어민주당·자유한국당·바...
    #> $ from         <chr> "프레시안"
    #> $ published_at <dttm> 2019-06-24 16:27:18
    #> $ edited_at    <dttm> NA
    #> $ by           <chr> "곽재훈 기자"
    #> [1] "http://mbn.mk.co.kr/pages/news/newsView.php?ref=newsstand&news_seq_no=3870180&pos=20002_3"
    #> Observations: 1
    #> Variables: 6
    #> $ title        <chr> "트럼프 미국 대통령 29일 방한…한미정상회담 열려"
    #> $ body         <chr> "【 앵커멘트 】 트럼프 미국 대통령이 오는 29일 1박 2일간의 일정으로 우리나라를 방...
    #> $ from         <chr> "MBN매일방송"
    #> $ published_at <dttm> 2019-06-24 19:30:00
    #> $ edited_at    <dttm> 2019-06-24 20:04:00
    #> $ by           <chr> "황재헌"
    #> [1] "http://www.dt.co.kr/contents.html?article_no=2019062402109932781002&naver=stand"
    #> Observations: 1
    #> Variables: 6
    #> $ title        <chr> "건조기·식기세척기 등 ‘新가전’ 부상… 신기록 달성 주목"
    #> $ body         <chr> "[디지털타임스 박정일 기자] 최근 생활 환경과 소비자 라이프스타일의 급격한 변화로 등장...
    #> $ from         <chr> "디지털타임스"
    #> $ published_at <dttm> 2019-06-24 06:41:00
    #> $ edited_at    <dttm> NA
    #> $ by           <chr> "박정일 기자"
    #> [1] "https://www.nocutnews.co.kr/news/5171990"
    #> Observations: 1
    #> Variables: 6
    #> $ title        <chr> "서울 청량리 재개발 지역 농성자, 폭발 사고로 사망"
    #> $ body         <chr> "서울 청량리 재개발 건물 옥상에서 농성을 벌이던 50대 남성이 폭발 사고로 숨졌다.서울...
    #> $ from         <chr> "노컷뉴스"
    #> $ published_at <dttm> 2019-06-24 22:38:22
    #> $ edited_at    <dttm> NA
    #> $ by           <chr> "김태헌 기자"
    #> [1] "https://www.mk.co.kr/news/politics/view/2019/06/451795/"
    #> Observations: 1
    #> Variables: 6
    #> $ title        <chr> "한국당, 2시간만에 與野합의 뒤집어…6월 국회도 파행"
    #> $ body         <chr> "80일 만에 재가동될 것으로 기대를 모았던 국회가 제1야당인 자유한국당의 합의안 추인 ...
    #> $ from         <chr> "매일경제"
    #> $ published_at <dttm> 2019-06-24 21:05:36
    #> $ edited_at    <dttm> 2019-06-25 09:59:54
    #> $ by           <chr> "김명환, 백상경 기자"
    #> [1] "https://www.ytn.co.kr/_ln/0103_201906241617041128_005"
    #> Observations: 1
    #> Variables: 6
    #> $ title        <chr> "'YG 성 접대' 싸이 소환...\"양현석도 조사 방침\""
    #> $ body         <chr> "앵커 양현석 전 YG엔터테인먼트 대표의 성 접대 의혹을 내사하는 경찰이 자리에 동석했던...
    #> $ from         <chr> "YTN"
    #> $ published_at <dttm> 2019-06-24 16:17:00
    #> $ edited_at    <dttm> NA
    #> $ by           <chr> NA
    #> [1] "http://www.bloter.net/archives/343946"
    #> Observations: 1
    #> Variables: 6
    #> $ title        <chr> "카카오, 머신러닝 문제해결 대회 ‘카카오아레나’ 개최"
    #> $ body         <chr> "카카오가 머신러닝을 이용한 문제해결 대회 ‘제2회 카카오아레나’를 개최한다고 6월24일...
    #> $ from         <chr> "Bloter.net"
    #> $ published_at <dttm> 2019-06-24
    #> $ edited_at    <dttm> NA
    #> $ by           <chr> "이기범"
    #> [1] "http://news.mt.co.kr/mtview.php?no=2019062418127667075&cast=1&STAND=MTS_P"
    #> Observations: 1
    #> Variables: 6
    #> $ title        <chr> "한국당에 날아간 국회 정상화…나경원 리더십 '뭇매' 불가피"
    #> $ body         <chr> "자유한국당이 24일 여야 3당 원내교섭단체 원내대표간 합의에 대한 추인을 거부하면서 나...
    #> $ from         <chr> "머니투데이"
    #> $ published_at <dttm> 2019-06-24 18:32:54
    #> $ edited_at    <dttm> NA
    #> $ by           <chr> "백지수 , 조준영"
    #> [1] "http://sports.donga.com/NewsStand/3/all/20190624/96150971/1"
    #> Observations: 1
    #> Variables: 6
    #> $ title        <chr> "김새롬, 이혼 후 G사 부회장님과?…깜짝 고백"
    #> $ body         <chr> "오는 25일 방송되는 MBC에브리원 '비디오스타'는 ’이 구성 마지막! 완판 남녀 특집...
    #> $ from         <chr> "스포츠동아"
    #> $ published_at <dttm> 2019-06-24 10:16:00
    #> $ edited_at    <dttm> NA
    #> $ by           <chr> NA
    #> [1] "http://www.newsis.com/view/?id=NISX20190624_0000690173&cid="
    #> Observations: 1
    #> Variables: 6
    #> $ title        <chr> "'진격의 나경원' 휘청…국회 정상화 한국당 의원들 '비토' 왜?"
    #> $ body         <chr> "【서울=뉴시스】박준호 기자 = 나경원 자유한국당 원내대표가 두 달 넘게 닫혀 있는 국회...
    #> $ from         <chr> "뉴시스"
    #> $ published_at <dttm> 2019-06-24 19:55:47
    #> $ edited_at    <dttm> NA
    #> $ by           <chr> NA
    #> [1] "http://news.jtbc.joins.com/html/034/NB11838034.html"
    #> Observations: 1
    #> Variables: 6
    #> $ title        <chr> "황교안, 성적 낮춘 건 거짓말 아니다?…반발 부른 해명"
    #> $ body         <chr> "[앵커]자유한국당 황교안 대표가 지난주에 대학에서 '학점과 토익점수가 높지 않은 아들의...
    #> $ from         <chr> "JTBC"
    #> $ published_at <dttm> 2019-06-24 21:03:00
    #> $ edited_at    <dttm> NA
    #> $ by           <chr> "노진호 기자"
    #> [1] "https://www.sisain.co.kr/?mod=news&act=articleView&idxno=34905"
    #> Observations: 1
    #> Variables: 6
    #> $ title        <chr> "타다, 혁신과 약탈 사이 어디로 모실까요"
    #> $ body         <chr> "택시는 왜 불편할까? 가장 먼저 떠오르는 것은 승차 거부다. 최근 사회적 논란으로 떠오...
    #> $ from         <chr> "시사IN"
    #> $ published_at <dttm> 2019-06-17 10:40:52
    #> $ edited_at    <dttm> 2019-06-24
    #> $ by           <chr> "전혜원 기자"
    #> [1] "http://www.mydaily.co.kr/new_yk/html/read.php?newsid=201906242319596580"
    #> Observations: 1
    #> Variables: 6
    #> $ title        <chr> "'안녕하세요' 이국주 최근 8~9kg 감량… 7kg 더 감량할 것"
    #> $ body         <chr> "[마이데일리 = 장민혜 객원기자] 개그우먼 이국주가 다이어트 중이라고 밝혔다. 24일 ...
    #> $ from         <chr> "마이데일리"
    #> $ published_at <dttm> 2019-06-24 23:19:31
    #> $ edited_at    <dttm> NA
    #> $ by           <chr> "장민혜 객원기자 selise@mydaily.co.kr"
    #> [1] "http://www.sportsseoul.com/news/read/780324"
    #> Observations: 1
    #> Variables: 6
    #> $ title        <chr> "박찬호, 큰 딸과 류현진 경기 관람 \"다저스 구장 나들이\"[★SNS]"
    #> $ body         <chr> "[스포츠서울 윤소윤기자]원조 야구스타 박찬호 전 메이저리거가 딸과 함께한 근황을 공개했...
    #> $ from         <chr> "스포츠서울"
    #> $ published_at <dttm> 2019-06-24 13:29:00
    #> $ edited_at    <dttm> 2019-06-24 13:29:00
    #> $ by           <chr> "윤소윤"
    #> [1] "http://news.kbs.co.kr/news/view.do?ncd=4228349"
    #> Observations: 1
    #> Variables: 6
    #> $ title        <chr> "야당도 찬성한 ‘집배원 증원예산’, ‘소소위’에서 사라졌다"
    #> $ body         <chr> "[앵커]집배원들이 장시간 노동에 내몰리는 이유는 인력이 현저하게 부족해섭니다. 파업 목...
    #> $ from         <chr> "KBS 뉴스"
    #> $ published_at <dttm> 2019-06-24 21:20:00
    #> $ edited_at    <dttm> 2019-06-24 22:14:00
    #> $ by           <chr> "김연주"
    #> [1] "http://www.etnews.com/20190624000311?mc=ns_003_00002"
    #> Observations: 1
    #> Variables: 6
    #> $ title        <chr> "[국제]WSJ “美, 중국 내 생산 5G 장비 반입 금지 검토”"
    #> $ body         <chr> "중국 화웨이 5세대(5G) 장비에 이어 중국에서 만들어진 모든 5G 장비에 대한 미국 ...
    #> $ from         <chr> "전자신문"
    #> $ published_at <dttm> 2019-06-24 16:05:00
    #> $ edited_at    <dttm> NA
    #> $ by           <chr> "박진형"
    #> [1] "http://imnews.imbc.com/replay/2019/nwdesk/article/5377194_24634.html"
    #> Observations: 1
    #> Variables: 6
    #> $ title        <chr> "해외서 번 돈 이것밖에?…이번엔 '역외탈세' 포착"
    #> $ body         <chr> "◀ 앵커 ▶ 이미 여러 차례 탈세 의혹이 제기됐던 효성그룹이 이번에는 해외 법인을 이용...
    #> $ from         <chr> "MBC NEWS"
    #> $ published_at <dttm> 2019-06-24 20:15:02
    #> $ edited_at    <dttm> 2019-06-24 20:43:00
    #> $ by           <chr> "임소정"
    #> [1] "http://news.khan.co.kr/kh_news/khan_art_view.html?artid=201906252223015&code=910402"
    #> Observations: 1
    #> Variables: 6
    #> $ title        <chr> "“우리공화당 작명에 박근혜 전 대통령이 관여”"
    #> $ body         <chr> "전 대한애국당 관계자 주장“유영하 변호사 통해 교감”박 ‘옥중정치’ 본격화 논란 대한애...
    #> $ from         <chr> "경향신문"
    #> $ published_at <dttm> 2019-06-25 22:51:09
    #> $ edited_at    <dttm> NA
    #> $ by           <chr> "허남설 기자 nsheo@kyunghyang.com"
    #> [1] "http://www.osen.co.kr/article/G1111170712"
    #> Observations: 1
    #> Variables: 6
    #> $ title        <chr> "西 언론, \"이강인 미래, 발렌시아 이적시장에 달렸다\" - OSEN"
    #> $ body         <chr> "[OSEN=강필주 기자] 이강인의 미래는 결국 이번 여름 소속팀 발렌시아의 이적 상황에...
    #> $ from         <chr> "OSEN"
    #> $ published_at <dttm> NA
    #> $ edited_at    <dttm> NA
    #> $ by           <chr> "강필주"
    #> [1] "http://www.inews24.com/view/1180471"
    #> Observations: 1
    #> Variables: 6
    #> $ title        <chr> "KT 빅데이터 플랫폼, 클라우드서 쓴다"
    #> $ body         <chr> "[아이뉴스24 김국배 기자] KT가 빅데이터 플랫폼을 연내 클라우드 서비스 방식으로 제...
    #> $ from         <chr> "inews24"
    #> $ published_at <dttm> 2019-05-21 14:11:00
    #> $ edited_at    <dttm> 2019-05-21 19:32:00
    #> $ by           <chr> "김국배"
    #> [1] "https://www.hankyung.com/economy/article/2019062450291"
    #> Observations: 1
    #> Variables: 6
    #> $ title        <chr> "이재용 삼성전자 부회장 \"中東 미래사업 공략…발 빠르게 움직이자\""
    #> $ body         <chr> "이재용 삼성전자 부회장이 경영 보폭을 넓히고 있다. 삼성전자 등 전자 계열사에 이어 2...
    #> $ from         <chr> "한국경제"
    #> $ published_at <dttm> 2019-06-24 17:51:00
    #> $ edited_at    <dttm> NA
    #> $ by           <chr> "황정수/고재연"
