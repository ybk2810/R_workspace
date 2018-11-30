
# animation

install.packages("animation")
library(animation)

ani.options(interval=1)
v<-c("H","E","L","L","O"," ","W","O","R","L","D")
v

for (i in c(1:11)){
  plot.new()
  size = 11-i
  rect(0,0,1,1,col="black")
  text(0.5,0.5,v[i],cex=size,
       col=rgb(1,1,0))
  ani.pause()
}


ani.options(interval=1) # 1초 간격으로
for( i in c(1:10)){
  y <- runif(5,0,1)
  y
  barplot(y, ylim=c(0,1), col=rainbow(5))
  ani.pause()
}

# 1/10번씩 10번에 걸쳐 바 차트 완성
y <- runif(5,0,1)
y
y2<-rep(0,5)
y2
raiseY<-y/10
raiseY

for (i in c(1:10)){
  ani.options(interval=(10-i)*0.02)
  y2<-y2+raiseY
  barplot(y2,ylim = c(0,1), col =rainbow(5))
  ani.pause()
}

# 1부터 100 사이의 값을 랜덤하게 10개
# barchart 를 작성
# 1/100 씩 나눠서 점점 증가하는 애니메이션 효과
k <- runif(10,1,100)
k
k2<-rep(0,10)
k2
raiseK<-k/100
raiseK

for (i in c(1:100)){
  ani.options(interval=0.05)
  k2<-k2+raiseK
  barplot(k2,ylim = c(0,120), col =rainbow(10))
  ani.pause()
}

# --------------------------------------------------------------------------------
# 구글맵 사용하기

install.packages("ggmap")
library(ggmap)

gc <- geocode(enc2utf8("서"))
gc

# 보라카이 : 11.9693246,121.9097194
gc_num <- c(121.9097194,11.9693246)
gc_num
gc$lon
gc$lat

map <- get_googlemap(center = gc_num, zoom=17,
                     maptype = "hybrid",
                     maker=gc)
# --------------------------------------------------------------------------------

# 특정 단어를 선정하여 네이버 api를 사용해 단어들의 목록을 가져와서 워드클라우드를 만들어보려 한다.
# https://search.shopping.naver.com/search/all.nhn?origQuery=%EB%B8%94%EB%9D%BC%EC%9A%B0%EC%8A%A4&pagingSize=40&viewType=list&sort=rel&frm=NVSHPAG&query=%EB%B8%94%EB%9D%BC%EC%9A%B0%EC%8A%A4&pagingIndex=4
install.packages("rvest")
library(rvest)

df.products<-NULL
url<-"https://search.shopping.naver.com/search/all.nhn?origQuery=%EB%B8%94%EB%9D%BC%EC%9A%B0%EC%8A%A4&pagingSize=40&viewType=list&sort=rel&frm=NVSHPAG&query=%EB%B8%94%EB%9D%BC%EC%9A%B0%EC%8A%A4&pagingIndex="
url



library(stringr)
for(page in 1:10){
url2<-paste(url,page,sep ="")
url2

txt<-read_html(url2)
txt

# .tit
txt1<-txt %>% html_nodes("div.info > a.tit") %>% html_text()
txt1

# 특정 문자 제거
txt1<-gsub("\n",'',txt1)
txt1<-gsub("\t",'',txt1)
#txt1<-gsub(" ",'',txt1)
txt1

str_trim(txt1)


#rs<-txt1==""|txt1=="몰등급안내"|txt1=="쇼핑몰별최저가"|txt1=="찜하기"
#txt1<-txt1[!rs]
#txt1
# 가격만 뽑아오기
priceNode<-txt %>% html_nodes("._price_reload") %>% html_text()
priceNode<-gsub(",",'',priceNode)
priceNode<-as.numeric(priceNode)
priceNode

print(txt1)
print(priceNode)

}

# --------------------------------------------------------------------------------

url3<-"https://www.bithumb.com/"

txt3<-read_html(url3)
txt3

coin<-txt3 %>% html_nodes(".tx_coin") %>%html_text()
coin


cost<-txt3 %>% html_nodes(".sort_total") %>%html_text()
cost<-gsub("조",'',cost)
cost<-gsub("억",'',cost)
cost<-gsub(" ",'',cost)
cost<-paste0(cost,"00000000")
cost<-as.numeric(cost)
cost

# --------------------------------------------------------------------------------

# 문자열 관련함수
# str_xxx()

data <- "a12345 6789"
#        12345678901  11자리
str_length(data) # 공백포함 글자수 체크

str_sub(data, start = 3, end = 8)

str_sub(data, start = -3, end = -1)

letters[4:8]

LETTERS[-26]

str_c(letters[-26], " 다음은 ", letters[-1])

str_c("a, b, c, d, e", sep = ",")

str_c(letters, collapse = ",")

data2 <- c("무지개 색깔은 빨강, 주황, 노랑, 초록, 파랑, 남색, 보라", "과일에는 딸기, 바나나, 망고, 포도, 배 를 좋아해요")
data2

#, 단위로 분리
d3<- str_split(data2, pattern = ",")
d3

# n 등분
d4 <- str_split(data2, n=4, pattern = ",")
d4

d5 <- str_split(data2, pattern = ",",12)
d5

d6 <- str_split_fixed(data2,pattern = ",",12)
d6

id_list <- c("aaa, bbb, ccc, ddd, eee, fff")

# 아이디만 출력하고 싶다! 
id_list_real<- str_split(id_list, pattern = ",")
id_list_real

# str_dup(문자열, 반복횟수)
data3 <- c("소주", "맥주", "막걸리")
data3

str_dup(data3,3)
str_dup(data3,1:3)

# str_pad(문자열, 문자열 너비, side=c("left","right","both"),pad="삽입문자")
# lpad() ==> oracle
data4 <- 3000
str_pad(data4,10,side = "left", pad="*")
str_pad(data4,10,side = "right", pad="*")

data5 <- 5000

# 5000***********
str_pad(data5,15,side = "right",pad = "*")

# ****5000****
str_pad(data5,12,side = "both",pad = "*")

# str_wrap(문자열, width=폭, indent="첫번째 오는 행의 여백", exdent="그외의 행의 여백")
# 지정한 폭으로 줄을 바꿔주는 함수

d7 <- str_wrap("오늘 stringr 패키지를 공부하느라 많이 힘들죠 ^^ 좀만 더 할께요", width=50, indent=4, exdent=0)
d7

# word(문자열, start=시작숫자, end=끝숫자)
data5 <- "간장공강 공장장은 깐콩 공장 공장장"
word(data5, start = 2, end = 3)



# Hello Bigdata R World 문자열에서 Bigdata R 문자열만 뽑아서 출력
data6 <- "Hello Bigdata R World"
word(data6, start = 2, end = 3)

str_split(data5,pattern = ' ')
str(str_split(data5,pattern = ' ')) # 리스트 타입 나온다

data55 <- unlist(str_split(data5,pattern = ' '))
data55
str(data55) # 문자타입 나온다


# 패턴 매칭
# str_detect()

str_detect(data55,'공')
data5[str_detect(data55,'공')]

str_count(data55,"공")
sum(str_count(data55,"공"))
str_locate(data55,"공")


data7 <-c("aaa","bbb","123","aaa@aaa.com")

# data7 : @가 포함되어있는 문자열은 탐색하고, 해당 단어를 출력
str_detect(data7,'@')
data7[str_detect(data7,'@')]

# 아이디만 추출
realId <- str_split(data7[str_detect(data7,'@')],pattern = "@")
str(realId)

# 특정한 문자열만 추출하는 함수
data7 <-c("aaa","bbb","123","aaa@aaa.com")
data7

str_extract(data7,"\\d+")

# 알파벳 소문자로 되어 있는 문자만
str_extract(data7,"[a-z]+")

# @ 문자가 포함되어있는 문자만 추출
str_extract(data7,"@")

# str_replace(문자열, 매치할 부분, 치환할 부분)
fruit <- c("one apple","two pears","three bananas")
str_replace(fruit,"[aeiou]","-")

# data7번에서 이메일형식을 찾고 그중 id부분에 몇글자 인지 출력




# ------------------------------------------------------------------

data <- c("앞면","뒷면")
data

# 복원추출
sample(data,10,replace = T)

plot(0,0,xlab="동전던진횟수",ylab="앞면비율",xlim=c(1,5000),ylim=c(0,1))

library(animation)
ani.options(interval=0.05)

sum<-0

for(x in 1:5000){
  coin<-sample(data,1,replace = T)
  if(coin=="앞면"){
    sum<-sum+1
  }
  prob <- sum/x
  points(x,prob)
  ani.pause()
}
abline(a=0.5,b=0,col="red")

# 몬테카를로 시뮬레이션
# 카지노로 유명한 모나코의 도시
# 무작위값, 난수를 이용하여 반복적 계산을 통해 확률적 값을 구하는 모형

# 무한모집단
# 무작위로 추출된 확률변수 x 가 독립적으로 동일한 분포에 따라 mu, sigma 인 경우

# 표본의 크기가 커짐에 따라 표본평균은
# 근사적으로 mu sigma 인 정규분포를 따른다.

# 중심극한정리
# 동일분포를 가지는 분포들의 평균은 그 개수가 많아지면 언제나 정규분포로 수렴한다.

# hw1.
# 인스타그램에서 특정인의 사진 경로를 가져오기 

# _9AhH0
# https://www.instagram.com/wooju1025/?hl=ko

hwUrl <- "https://www.instagram.com/wooju1025/?hl=ko"
hwRead <- read_html(hwUrl)
imgurl <- hwRead %>% html_nodes('script')

jsp<-imgurl[4]%>%html_text()
jsp

hm<-str_extract_all(jsp,'https://[a-z0-9\\-\\.]+/vp/[a-z0-9\\-\\.]+/[A-Z0-9]+/[a-z0-9\\.\\-]+/[a-z0-9]+/[0-9a-z\\_]+.jpg')

hm

list(hm)

# 비복원추출


# -----------------------------------------------------------------------------------------------------------------
# 척도별 기술 통계량

# 대표값 : mean(평균), sum(합계), 사분위수, 최빈수
# 산포도 : 분산(Varience), 표준편차(standard deviation), 최소(min), 최대(max)

# 비대칭도 : 왜도(skewness), 첨도(kurtosis)



# -----------------------------------------------------------------------------------------------------------------

# 예측 분석 방법 분류

# 지도학습 (Supervised Learning)

# 비지도학습 (unSupervised Learning)

# 분석 절차
# 1. 가설 설정 이전의 연구조사
# 1) 연구문제 설정
# 2) 예비조사
# 3) 연구모형
# 1-1) 연구 독창성, 검증 가능석, 결과의 실용성, 구체성, 경제성
# 2-1) 연구문제에 대한 사전지식, 변수 규명, 가설 도출등을 위한 사전조사

# 2. 가설 설정
# 가설(Hy)
# - 사회조사, 연구에서 주어진 연구문제에 대한 예측적 해답
# - 실증적인 증명에 앞서 세우는 잠정적인 진술
# - 나중에 논리적으로 검정될 수 있는 명제
# -  통계분석을 통해 채택 또는 기각

# 3 .가설의 유형
# - 귀무가설 : 두 변수간의 관계가 없다 또는 차이가 없다. ==> 부정적 형태 진술 (신약의 효과가 없다)
# - 연구가설(대립가설) ==> 차이가 있다 또는 효과가 있다. ==> 긍정적 형태 진술 (신약의 효과가 있다)

# 4. 유의수준과 임계값
# h0 : 신약 A는 X 암 치료에 효과가 없다.
# h1 : 신약 A는 X 암 치료에 효과가 있다.
# - 분석결과 : 생쥐 100마리를 대상으로 신약A를 투약한 결과 검정통계량의 유의확률(P=0.03)이 나왔다.
# 유의수준 0.05를 기준으로 귀무가설을 기각한다.
# 사회과학분야 임계값 : (알파) = 0.05 (p < 0.05)
# 의학생명분야 임계값 : (알파) = 0.01 (p < 0.01)

# 유의수준 (Significant level)
# - 가설 채택 또는 기각 기준
# - 분석결과 유의수준 이내일때 가설을 채택
# - 알파로 표시
# - 유의수준의 김계값(기준값) 결정

# 5. 측정 도구를 선정
# - 가설에 나오는 변수를 무엇으로 측정할 것인가를 결정
# - 가설에 나오는 변수(변인) 추출
# - 변수의 척도를 고려하여 측정도구를 선정

# 6. 데이터 수집 ==> 이 단계가 완료되면 논문의 50% 이상 완성
# - 데이터 수집(설문지 작성)
# - 선정된 측정도구를 이용하여 설문 문항 작성
# - 정형/비정형 데이터 수집(DB, WEB, SNS)

# 7. 데이터 코딩
# - 통계분석 프로그램 (Excel, R, SPSS, SAS) 데이터 입력
# - 데이터 전처리 (미응답자, 잘못된 데이터 처리)

# 8. 통계분석 수행 
# - 전문 통계분석 프로그램 분석 단계
# - 통계분석방법을 계획하지 않고 데이터를 수집할 경우 실패 확률이 높다.

# 9. 결과분석
# - 결과분석 제시
# - 연구목적과 연구 가설에 대한 분석 및 검증단계
# - 인구통계학적 특성 반영
# - 주요 변인에 대한 기술 통계량 제시
# - 연구가설에 대한 통계량 검정 및 해석
# - 연구자 의견 기술 (논문 / 보고서 작성)

# 1. 통계학
# - 논리적 사고와 객관적인 사실에 의거, 화률 기반 인과관계 규명
# - 연구목적에 의해 설정된 가설들에 대하여 분석 결과가 어떤 결과를 뒷받침하고 있는지 통계적 방법으로 검정
# - 사회학, 경제학, 경영학, 정치학, 교육학, 의생명등 대부분의 모든 학문 분야에서 폭 넓게 사용

# 기술통계학
# - 기능 : 수집된 자료의 특성을 쉽게 파악하기 위해서 자료를 정리 및 요약
# - 방법 : 표, 그래프, 대표값 등

# 추론통계학
# - 기능 : 모집단에서 추출한 표본의 정보를 이용하여 모집단의 다양한 특성을 과학적으로 추론
# - 방법 : 회귀분석, T-검정, 분산분석

# 모집단과 표본
# - 전수조사 : 모집단 내에 있는 모든 조사방법, 모집단의 특성을 정확히 반영, 시간과 비용이 많이 소요되는 단점
# - 표본조사 : 모집단으로부터 추출된 표본을 대상으로 분석 실시, 모집단의 특성을 반영하지 못하는 표본은 무용지물, 

# 통계적 추정
# - 모집단의 특성을 대표하는 표본을 추출하고, 이러한 표본을 이용하여 모집단의 특성을 나타내는 각종 모수(모평균, 모분산 등)를 예측하는 방법

# 점추정
# - 방식 : 모집단의 특성을 하나의 값으로 추정하는 방식
# - 특징 : 모수와 동일할 가능성이 가장 높은 하나의 값을 선택하는 방법

# 구간추정
# - 방식 : 모집단의 특성을 적절한 구간을 이용하여 추정하는 방식
# - 모수가 속하는 일정구간 (하한값, 상한값)으로 추정 (일반적으로 많이 사용)

# 신뢰수준 : 계산된 구간이 모수를 포함할 확률 의미 ==> 통상 90% 95% 99%
# 신뢰구간 : 신뢰수준 하에서 모수를 포함하는 구간 (하한값 ~ 상한값 형식으로 표현)
# 표본오차 : 모집단에서 추출한 표본이 모집단의 특성과 정확히 일치하지 않아서 발생되는 확률의 차이

# 임계값 : 귀무가설의 기각여부를 구분하는 기준점
# 채택역 : 임계값 기준 채택범위
# 기각영 : 기각범위

# 단측검정 : 방향의 우열이 있는 가설
# 예) H0 : 새로운 공정으로 발생하는 1일 불량품의 갯수는 평균 30개 이다.
#     H1 : 새로운 공정으로 발생하는 1일 불량품의 갯수는 평균 30개 미만이다.

# 양측검정 : 중첩적인 가설
# 예) H0 : 성별에 따라 만족도에 차이가 없다.
#     H1 : 성별에 따라 만족도에 차이가 있다.
# ==> 양측검정으로 가설을 검정한 후에 만고 적음의 가설을 검정하기 위해 단측검정을 추가로 수행한다.

# 유의수준에 따른 z값
# 유의수준 0.005 z0=2.58
# 유의수준 0.01 z0=2.33
# 유의수준 0.025 z0=1.96
# 유의수준 0.05 z0=1.65

# 가설검정 오류
# - 제 1종 오류 : 귀무가설이 참인경우 귀무가설을 기각하는 오류
# - 제 2종 오류 : 귀무가설이 거짓인데 귀무가설을 기각하지 않는 오류
# 1종오류가 발생되는것을 감안해서 판단하는게 유의수준 (0.05,0.025,0.01)

# 검정통계량
# - 가설검정을 위해 수집된 자료를 계산한 통계량
# - 가설검정에서 기각역을 결정하는 기준이 되는 통계량
# - 유의수준 알파의 값과 비교하여 귀무가설을 기각 또는 채택
# - 상관분석 r값, T검정의 t값, 분산분석/회귀분석의 F값

# descriptive.csv 읽기
data <- read.csv("descriptive.csv", header = T, sep = ",")
data

# 전체 데이터의 특성 보기
dim(data) # [1] 300 8
length(data) # 열의 갯수
length(data$survey) # 컬럼의 관측치 [1] 300

str(data)
summary(data)

# 명목척도 변수의 기술통계량
# 명목척도 : 크기비교가 불가능한 것들
length(data$gender)
summary(data$gender)

table(data$gender) # 이상치 발견

# 성별 1,2만 선택하고 나머지는 제거
library(dplyr)
data%>%filter(gender==1|gender==2)
data2 <- subset(data, data$gender ==1 | data$gender ==2)
x <- table(data2$gender)
barplot(x)

prop.table(x) # 빈도의 비율을 계산해주는 함수!
y <- prop.table(x)

# 백분율로 변환 (소수점 2자리)
round(100*y,2)

# 서열척도 변수의 기술통계량
length(data$level) # 학력수준
head(data$level)
summary(data$level)

# 이상치 제거
data2 <- subset(data, data$level == 1 | data$level == 2 | data$level == 3)

# 빈도수?
x <- table(data2$level)
x
# 막대차트, 색
barplot(x, xlab="학력수준", ylab="수", ylim=c(0,130), col=rainbow(3))
abline(a=117,b=0,col="red")
abline(a=100,b=0,col="green")
abline(a=70,b=0,col="blue")


prop.table(x)
y <- prop.table(x)
round(y*100,2)

# 척도의 종류

# 질적 척도 : 명목척도, 서열척도
# 양적 척도 : 등간척도, 비율척도

# 등간척도 : 관찰 대상의 속성을 상대적 크기로 나타낸것
# 순위를 부여할 뿐 아니라 어느정도 큰지 순자간의 계산이 의미가 있다.

survey <- data$survey
# 고객만족도 5점 척도
survey
summary(survey)

x1 <- table(survey)
x1
str(x1)

# 등간척도는 시각화를 위해 히스토그램을 사용한다.
hist(x1, xlim = c(1,100), ylim=c(1,8))

# 비율척도 : 절대적 기준이 있는 영점이 존재하고 모든 사칙연산이 가능하다.
# 연구대상을 분류할 수 있고, 차이를 비교할 수  있고, 순위를 만들 수 있다.
length(data$cost)
summary(data$cost)

# 결측치, 이상치 제거
# 2~10
data <- subset(data,data$cost >= 2 & data$cost <= 10)
x <- data$cost
length(x)
summary(x)

# 대표값 해석
# 최소값 2.1
# 1사분위수 4.6
# 중위수 5.4
# 평균 5.361
# 3사분위수 6.2
# 최대값 7.9

# 분산 
var(x) 

# 표준편차
sd(x)

min(x)
max(x)
range(x)

# 연속형 (등간/비율 척도) 시각화
table(data$cost)
hist(data$cost) # 히스토그램
plot(data$cost) # 산점도

# 범주형 (리코딩) : 1, 2, 3

# cost 1~3 미만 : 1
# cost 3~6 미만 : 2
# cost 6 이상 : 3

# 방법 1
data$cost2[data$cost<3 & data$cost>=1]<-1
data$cost2[data$cost<6 & data$cost>=3]<-2
data$cost2[data$cost>=6]<-3

# 방법 2
data$cost2 <- ifelse(data$cost<3 & data$cost>=1,1,ifelse(data$cost<6 & data$cost>=3,2,3))

# 빈도
table(data$cost2)

# barplot
barplot(table(data$cost2))

# pie
pie(table(data$cost2))

# cost 비율척도 기술통계량
attach(data)

length(cost)
summary(cost)

sort(cost)
sort(cost, decreasing = T)

detach(data)

test<-c(1:5,NA,10:20)
test

# 최소값
min(test, na.rm = T)

# 최대값
max(test, na.rm = T)

# 범위
range(test, na.rm = T)

# 평균
mean(test, na.rm = T)


# 비대칭도 구하기
install.packages("moments")
library(moments)

# 왜도 : 평균을 중심으로 기울어진 정도
cost <- data$cost
cost

skewness(cost)

# 0보다 작으면 왼쪽 꼬리
# 0보다 크면 오른쪽 꼬리

# 첨도 : 
kurtosis(cost) # 정규분포의 첨도 : 3

hist(cost, freq=F)

# 확률밀도 분포 곡선
lines(density(cost), col='blue')

cost

# 표준정규분포 곡선
x<-seq(0.8,0.1)
x
curve(dnorm(x,mean(cost), sd(cost)),col="red",add=T)

# attach(), detach() 함수를 사용해서 기술 통계량 구하기
# 기술 통계량 구하기
attach(data)
# attach(data) data$
# detach(data)
#길이
length(data)
#요약통계량
summary(cost)
#평균
mean(cost)
#최소
min(cost)
#최대
max(cost)
#범위
range(cost)
#표준편차
var(cost)
#분산
table(cost)

#----------------------------------------------------
# 패키지를 이용하여 기술통계량을 한번에 구할 수 있다.
install.packages("Hmisc")
library(Hmisc)

# 전체 변수 대상 기술 통계량
describe(data)

# 개별 변수 기술 통계량
describe(data$gender)

describe(data$gender)
summary(data$gender)

# prettyR 패키지
install.packages("prettyR")
library(prettyR)

# 전체 변수 대상
freq(data) # 각 변수별: 빈도, 결측치, 백분율, 특징-소수점 제공

freq(data$gender)

#----------------------------------------------------------
# 기술 통계량 보고서 작성
# 변수 리코딩과 빈도분석
# 거주지역 변수 리코딩, 비율 계산
data$resident2[data$resident==1]<-"특별시"
data$resident2[data$resident>=2&data$resident<=4]<-"광역시"
data$resident2[data$resident==5]<-"시구군"

x<-table(data$resident2)
x
# 비율
prop.table(x)
y<-prop.table(x)
round(y*100,2)

# 파이차트
pie(y)

# 성별 변수 리코딩, 비율계산 
# gender2 추가 
data$gender2[data$gender==1]<-"남"
data$gender2[data$gender==2]<-"여"

x<-table(data$gender2)
x
y<-round(prop.table(x)*100,2)
y

# 파이 차트 
pie(y,col=rainbow(3))
data

# 나이 변수 리코딩 과 비율계산 
# age 45 이하는 중년   46~59 장년층 60이상 노년층 
# age2 
data$age2[data$age<=45]<-'중년'
data$age2[data$age>=46 & data$age<=59]<-'장년층'
data$age2[data$age>=60]<-'노년층'

#파이 차트 
pie(round(prop.table(table(data$age2))*100,2), col = rainbow(3), main = '나이')

#학년 수준 변수 리코딩과 비율계산 
# level == 1 고졸 2 대졸 3대학원졸 
data$level2[data$level==1]<-"1고졸"
data$level2[data$level==2]<-"2대졸"
data$level2[data$level==3]<-"3대학원졸"
pie(round(prop.table(table(data$level2))*100,2), col=rainbow(3), main = '학년 수준')

# 합격 여부 변수 리코딩과 비율계산 
# pass 1 합격 2 실패 
data$pass2[data$pass==1]<-'합격'
data$pass2[data$pass==2]<-'실패'
pie(round(prop.table(table(data$pass2))*100,2), col=rainbow(2), main = '합격 여부 ')


#---------------------------------------------------------
data<-read.csv("cleanDescriptive.csv", header = T)
data

head(data)

# 부모의 학력수준 level2(x)
# 자식의 대학 진학 여부 pass2(y)
x=data$level2
y=data$pass2
result=data.frame(Level=x, Pass=y)
result
dim(result)
str(result)

table(result)

# 교차분할표 생성
install.packages("gmodels")
library(gmodels)

# diamod의 cut에 대한 color에 대한 교차분할표를 생성할 수 있다.
library(ggplot2)
CrossTable(x=diamonds$color, y=diamonds$cut)

#----------------------------------------------------------
CrossTable(x=result$Level, y=result$Pass)

df<-table(result)
df

#----------------------------------------------------------
# 카이제곱 
# 카이제곱 분포에 기초한 통계적 방법으로 관찰한 빈도가 기대되는 빈도와 의미있게 다른지 여부를 검증하기 위해 사용되는 검증 방법

# 명목척도 자료의 분석 이용
# Chisq.test() 함수를 이용하여 관찰치와 기대빈도 일치여부를 검정

# 적합도 검정 예
#----------------------------------------------------------
# 귀무가설: 기대치와 관측치의 차이가 없다.
#   예) 도박사의 주사위는 게임에 적합하다
# 대립가설: 기대치와 관측치의 차이가 있다.
#   예) 도박사의 주사위는 게임에 적합하지 않다.

# 귀무가설 : 같다. 다르지 않다. 차이가 없다. 효과가 없다.
# 연구가설 : 같지 않다. 다르다. 차이가 있다. 효과가 있다.

# 60회 주사위를 던져서 나온

# 관측도수 / 기대도수

# 주사위 눈: 1,2,3,4,5,6
# 관측도수: 4,6,17,16,8,9
# 기대회수: 10,10,10,10,10,10

v<-c(4,6,17,16,8,9)
v

chisq.test(v)
#Chi-squared test for given probabilities
#data:  v
#X-squared = 14.2, df = 5, p-value = 0.01439

# 0.05 기준 
# p-value = 0.01439 < 0.05

# 귀무가설 기각
# 연구가설 체택

# 유의확률(p-value: 0.01439)이 0.05미만이기 때문에 유의미한 수준(알파: 0.05)에서 귀무가설을 기각할 수 있다.

# cf) 검정통계량 해석
# 검정통계량이 자유도(df)가 5이고, 유의수준 0.05 인 경우 카이 스퀘어분포표에 의하면 임계값이 11.07에 해당하므로 chi-squared 기각역은 >=11.07dl ehlsek.

# X-squared=14.2
# df=5
# 알파: 0.05(사회,과학)
# 알파: 0.01(의.생명)

# 선호도 분석
df_data<-textConnection(
  "스포츠음료종류 관측도수
  1 41
  2 31
  3 51
  4 71
  5 61
  ")
df_data
x<-read.table(df_data,header = T)
x
v<-x$관측도수
v
# 귀무가설: 스포츠 음료의 선호에 차이가 없다.
# 대립가설 : 스포츠 음료의 선호에 차이가 있다.

chisq.test(v)
# Chi-squared test for given probabilities

#data:  v
#X-squared = 19.608, df = 4, p-value = 0.0005967

# 9.49

# 검정통계량 해석
# 검정통계량 자유도(df)가 4이고, 유의수준 0.05인 카이 스퉤어 분포표에 의하면 9.49<19.608
# 0.0005967<0.05

# 귀무가설 기각
# 연구가설 체택


#1019금----------------------------------------------------
# 이원 카이제곱

# 독립성/관련성 검정
# 귀무가설: 부모의 학력수준과 자녀의 대학진학 여부는 관련성이 없다.
# 대립가설 : 부모의 학력수준과 자녀의 대학진학 여부는 관련성이 있다.

x<-result$Level
x
y<-result$Pass
y

CrossTable(x,y,chisq=T)
# Chi^2 =  2.766951     d.f. =  2     p =  0.2507057 

chisq.test(x,y)
# data:  x and y
# X-squared = 2.767, df = 2, p-value = 0.2507

# p-value=0.2507
# 알파: 0.05

# p-value>0.05
# 귀무가설 체택

# 부모의 학력 수준과 자녀의 대학 진학 여부는 관련성이 없다고 본다.

#-------------------------------------------------
# 교육 방법에 따른 만족도
#-------------------------------------------------
data<-read.csv("homogenity.csv",header = T)
data
dim(data)
str(data)

# 변수리코딩
# survey 의 값이 널이 아닌값만
# na는 제외
summary(data)
data<-subset(data,!is.na(survey),c(method,survey))
is.na(data)
data

data$method2[data$method==1]<-"방법1"
data$method2[data$method==2]<-"방법2"
data$method2[data$method==3]<-"방법3"
data

data$survey2[data$survey==1]<-"매우만족"
data$survey2[data$survey==2]<-"만족"
data$survey2[data$survey==3]<-"보통"
data$survey2[data$survey==4]<-"불만족"
data$survey2[data$survey==5]<-"매우불만족"
data

# 교차분할표 작성
table(data$method2,data$survey2)
CrossTable(data$method2,data$survey2,chisq=T)
# Pearson's Chi-squared test 
# ---------------------------------------------------
# Chi^2 =  6.544668     d.f. =  8     p =  0.5864574 

chisq.test(x,y)
# Pearson's Chi-squared test
# data:  x and y
# X-squared = 6.5447, df = 8, p-value = 0.5865

# 동질성 검정
# 귀무가설, 영가설
# h0,귀무가설 : 교육방법에 따른 만족도에 차이가 없다.
# h1,대립가설 : 교육방법에 따른 만족도에 차이가 있다.
# 유의수준 0.05에서 유의확률(0.5865)이 0.05보다 크므로 귀무가설을 기각할 수 없다.
# 따라서, 교육방법에 따른 만족도는 차이가 없다고 할 수 있다.



