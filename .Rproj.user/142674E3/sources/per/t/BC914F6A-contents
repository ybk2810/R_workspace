# 세 집단간 비율차이를 검정해보고 싶다!
# IT 교육센터에서 3가지 교육방법으로 교육실시
# 가장 효과적인 교육방법?
# 150명 대상으로 설문

# method               survey
# 교육방법     인원    만족
# 1.이론교육   50      34
# 2.실습교육   50      37
# 3.혼합교육   50      39

# 0 불만족     1 만족

df <- read.csv("three_sample.csv", header = T)
df
str(df) # 150개 관측치 4개의 var
dim(df)

method <- df$method
survey <- df$survey
method
survey

x <- c(1,NA,3,4,NA,5)
x

y <- c(1:10)

table(x)
table(x,useNA = 'no')
table(x,useNA = 'ifany')
table(x,useNA = 'always')
table(y,useNA = 'always')

table(method,useNA = 'no')
table(method, survey)

# 세 집단간 비율차이 검정
# 귀무가설 : 세 집단간 만족도비율에 차이가 없다.
# 대립가설 : 세 집단간 만족도비율의 차이가 있다.


# prop.test(그룹별빈도, 그룹수)
prop.test(c(34,37,39), c(50,50,50))

# X-squared = 1.2955, df = 2, p-value = 0.5232
# 유의수준 0.05에서 유의확률이 0.5232로 유의확률이 유의수준보다 크므로 귀무가설을 기각할 수 없다.
# 따라서, 세 집단간 만족도의 비율에 차이가 없다고 할 수 있다.

# 세 집단의 평균차이 검정
# 귀무가설 : 교육방법에 따른 세 집단간의 시험의 평균성적 차이가 없다.
# 대립가설 : 교육방법에 따른 세 집단간의 시험의 평균성적 차이가 있다.

df <- read.csv("three_sample.csv", header = T)
df

is.na(df$score)

# score NA를 제외
# df$method    df$score
# df

# 방법 1
df2 <- df[!is.na(df$score),]
df2
df3 <- df2[,c(2,4)]
df3

# 방법 2
df4 <- subset(df, !is.na(score),c(method,score))
df4

summary(df4)
plot(df4)

# 14이상 되는값은 outlier 제거
df5 <- subset(df4,score<14)
df5

df5$method2[df5$method==1]<-"이론교육"
df5$method2[df5$method==2]<-"실습교육"
df5$method2[df5$method==3]<-"혼합교육"
df5

# 정규성 검정
# 셋 이상의 모집단들이 동일한 분산을 갖는지에 대한 검정
# bartlett.test(종속변수 ~ 독립변수)
# 귀무가설 : 세 집단간의 분포의 모양 차이가 없다.
# 대립가설 : 세 집단간의 분포의 모양 차이가 있다.
bartlett.test(score ~ method2, data = df5)
# Bartlett's K-squared = 3.3157, df = 2, p-value = 0.1905
# 바틀렛의 케이제곱검정결과 유의확률이 0.1905로 유의수준 0.05보다 크므로 귀무가설을 기각할 수 없다.
# 따라서, 세 집단간의 분포의 모양차이가 없다고 할 수 있다.

# 동일한 집간간의 분석은 분산분석표를 작성
# ANOVA (Analysis of Variance)
# 동일한 집단이 아니라면
# kruskal

# 귀무가설 : 세 집단의 성적 평균의 차이가 없다.
# 대립가설 : 세 집단의 성적 평균의 차이가 있다.

# aov(종속변수 ~ 독립변수, data = 쓸 데이터)
result <- aov(score ~ method2, data = df5)
result
summary(result)
# Df Sum Sq Mean Sq F value   Pr(>F)    
# method2      2  99.37   49.68   43.58 9.39e-14 ***
#   Residuals   85  96.90    1.14                     
# ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 유의확률이 유의수준보다 작으므로 귀무가설을 기각한다.
# 따라서, 세 집단의 성적 평균은 차이가 있다고 할 수 있다.

TukeyHSD(result)
# 이론교육과 실습교육간의 차이가  -2.6으로 가장 큰 것을 알 수 있다.

# -----------------------------------------------------------------------------------------------------------
data("iris")
str(iris)

# 붓꽃
# iris의 품종별로 sepal.width 평균차이가 존재하는지 알고 싶다.

head(iris)

# Species ==> method2
# Sepal.Width ==> score
# 등분산성

# 귀무가설 : 품종에 따른 꽃받침너비의 분포의 모양은 차이가 없다.
# 대립가설 : 품종에 따른 꽃받침너비의 분포의 모양은 차이가 있다.
bartlett.test(Sepal.Width ~ Species, data = iris)
# Bartlett's K-squared = 2.0911, df = 2, p-value = 0.3515
# 유의확률이 0.3515로 유의수준 0.05보다 크므로 귀무가설을 기각할 수 없다.
# 따라서, 품종에 따른 꽃받침너비의 분포의 모양은 차이가 없다고 할 수 있다.
result2 <- aov(Sepal.Width ~ Species, data = iris)
summary(result2)
# 귀무가설 : 세 종류의 꽃의 꽃받침너비 평균에 차이가 없다.
# 대립가설 : 세 종류의 꽃의 꽃받침너비 평균에 차이가 있다.
# 유의확률이 0에 가까우므로 유의수준 0.05보다 작으므로 귀무가설을 기각한다.
# 따라서, 세 종류의 꽃의 꽃받침 너비의 평균은 차이가 있다고 할 수 있다.
TukeyHSD(result2)
# versicolor품종과 setosa품종간의 너비 평균차가 -0.658로 가장 큼을 알 수 있다.


# ------------------------------------------------------------------------------------------------------
# 일원배치 분산분석
# product.csv 파일을 읽어 result data.frame 을 생성

result3 <- read.csv("product.csv", header = T)
result3

head(result3)
summary(result3)
summary(result3$제품_만족도)

# 각 변수의 표준편차
sd(result3$제품_친밀도)
sd(result3$제품_적절성)
sd(result3$제품_만족도)

# 피어슨의 상관계수를 사용하려 한다. 
# cor(x,y,method)
cor(result3$제품_친밀도,result3$제품_적절성)
# 0.4992086 --> 다소 높은 양의 상관관계

# 친밀도, 만족도 상관관계
cor(result3$제품_친밀도,result3$제품_만족도)
# 0.467145 --> 다소 높은 양의 상관관계

cor(result3, method = "pearson")

# 방향성 있는 색상으로 표현 - 동일 색상으로 그룹화 표시 및 색의 농도
install.packages("corrgram")
library(corrgram)

corrgram(result3)
corrgram(result3, upper.panel = panel.conf)
corrgram(result3, lower.panel = panel.conf)

# 차트에 곡선과 별표 표시
install.packages("PerformanceAnalytics")
library(PerformanceAnalytics)

# 상관성, P값, 정규분포 시각화 - 모수 검정 조건
chart.Correlation(result3, histogram = , pch="+")

# 문제
# iris 데이터셋에서 각 독립변수끼리의 상관성 여부를 판단한 후에 이것을 시각화
cor(iris[,-5], method = "pearson")
corrgram(iris[,-5], upper.panel = panel.conf)
chart.Correlation(iris[,-5], histogram = ,pch="+")

# -----------------------------------------------------------------------------------
# 추론
# 예측 : 회귀분석
# Regression Analysis

# 단순회귀분석

# 독립변수와 종속변수가 1개인 경우
# 제품의 적절성은 제품의 만족에 양의 영향을 미친다.

# 귀무가설 : 제품의 적절성은 만족도에 양의 영향을 미치지 않는다.
# 대립가설 : 제품의 적절성은 만족도에 양의 영향을 미친다.

# 독립변수 : 제품 적절성
# 종속변수 : 제품 만족도

# 선형회귀 모델
# lm(y ~ x , data)
str(result3)
x <- result3$제품_적절성
y <- result3$제품_만족도

result.lm <- lm(formula = y~x, data = result3)

# 선형회귀분석 결과보기
summary(result.lm)
fitted.values(result.lm)
head(result3,1)
plot(x,y,ylim=c(1,10),xlim=c(1,10))



# y = 0.77886 + 0.73928*x
0.77886 + 0.73928*4
# 3 = 0.77886 + 0.73928*4  ???  -->  3.73598


# 빨간색으로 회귀선 그리기!
abline(0.77886,0.73928, col = "red")


# 제품의 적절성은 제품 만족도에 양의 영향을 미친다.

# 회귀식
# y = 0.77886 + 0.73928*x

# ==============================================================================================================

# 영화진흥위원회 사이트에서 
# 2018년도 정보를 가져오기 

# 네이버에서 영화제목으로 별점 가져오기 

# df에 붙이기 

# 매출액  스크린수 별점 장르 와 상관관계 

# 상관관계가 있다면 
# 회귀분석을 수행하여 결과를 출력 

# 기울기 , 절편이용해서 그래프 작성 
# 별점 : 네이버별점 참고 
# 웹크롤링, 엑셀

df <- read.csv("2018.csv", header = T)
str(df)
dim(df)


head(df)

str(df$장르)
genre <- df$장르
screen <- df$전국스크린수
sales <- df$전국매출액
movies <- data.frame(genre, screen, sales)
movies$name <- df$영화명
head(movies)

library(xml2)
library(stringr)
library(rvest)
library(dplyr)
install.packages("splashr")
library(splashr)
install.packages("jsonlite")
library(jsonlite)

movies$name

for (data in movies$name){
  data<-as.character(data)
  data
  #URLencode(iconv(movies$name,to="UTF-8"))
  data<-URLencode(iconv(data,to="UTF-8"))
  url <- "https://movie.naver.com/movie/search/result.nhn?section=all&ie=utf8&query="
  url2 <- paste(url, data, sep="")
  url2 <- gsub(" ", '+', url2)
  
  html <- read_html(url2)
  html2<- html_nodes(html,"em.num")
  print(html2)
  
}









