# latterice 패키지

install.packages("lattice")
library(lattice)

install.packages("mlmRev")
library(mlmRev)

# mlmRev 패키지에서 제동되는 데이터셋으로 1997년 영국의 2280개 학교의 31022명의 학생들을
# 대상으로 A 레벨(대학시험) 화학점수를 기록한 데이터셋이다.

# $ lea       : (Local Education Authority) 지방교육청
# $ school    : 학교 ID
# $ student   : 학생 ID
# $ score     : 화학점수 (범위 : 0, 2, 4, 6, 8, 10)
# $ gender    : 성별 (범위 : M, F)
# $ age       : 18.5세 (범위 : -6, +5)
# $ gcsescore : GCSE 개인평균성적 (범위 : 0 ~ 8 사이의 실수)
# $ gcsecnt   : 수능점수

str(Chem97)
dim(Chem97)

# 30개만 앞에서 출력
head(Chem97,30)

# 1. histogram : GCSEORE 변수 대상으로 백분율 적용
# 히스토그램 : histogram(~x축, dataframe)
histogram(~gcsescore, data = Chem97)

# 형식2 histogram(~축 | 조건, dataframe)
histogram(~gcsescore | score, data =Chem97) # score 단위
histogram(~gcsescore | factor(score), data =Chem97) # score 요인 단위

# 밀도 그래프
densityplot(~gcsescore|factor(score), data = Chem97, groups = gender, plot.points = T, auto.key = T)
# 밀도점 : plot.points = F
# 범례 : auto.key = T
# 성별 단위 (그룹화)로 GCSE점수를 밀도로 플로팅

#막대그래프
data("VADeaths")
VADeaths # R에서 기본적으로 제공되는 데이터셋, 1940년 미국 버지니아주의 하위계층 사망비율을 기록

str(VADeaths)
class(VADeaths)

# Rural Male : 시골출신 남자
# Rural Female : 시골출신 여자
# Urban Male : 도시 출신 남자
# Urban Female : 도시 출신 여자

# matrix ==> data frame
df <- as.data.frame(VADeaths)
df

dft <- as.data.frame.table(VADeaths)
dft

# barchart
# barchart(y ~ x | 조건, dataframe, layout)
barchart(Var1~Freq|Var2, data=dft,layout=c(4,1))

dotplot(Var1~Freq, data=dft, groups=Var2, type='o', auto.key=list(space="right", point = T, lines = T))

# ---------------------------------------------------------------------------------------------------------------
# 추정 : 표본을 통해서 모집단을 확률적으로 추측
# 검정통계량 : 표본에 의해서 계산된 통계량 (표본평균, 표본 표준편차)

# 모수 : 모집단에 의해서 나온 통계량 (모평균, 모표준편차)

# 점추정 : 제시된 한개의 값과 검정통계량을 직접 비교하여 가설의 기각유무를 결정하는 값
# 예) 중학교 2학년 학생들의 평균키를 160.0cm로 추정

# 구간추정 : 신뢰구간과 검정통계량을 비교하여 가설 기각유무를 결정하는것
# 신뢰구간 : 오차범위에 의해서 결정된 하한값과 상한값의 범위
# 예) 중학교 2학년 학생들의 평균키 +-5cm로 155.0cm ~ 165.0cm 로 추정

x <- rnorm(1000, mean = 100, sd = 10)
x
mean(x)

# 평균차이 검정
# H0 : 평균 95와 차이가 없다.
# H1 : 평균 95와 차이가 있다.

# 스튜던트 t-test
# 흑맥주 생산에 필요한 보리를 어떻게 하면 조금더 좋은 품질로 농장에서 수확 할 수 있는가

t.test(x, mu=95)
t.test(x, mu=95, conf.level = 0.95)
# t = 16.643, df = 999, p-value < 2.2e-16
# 2.2e-16는 2.2의 -16승
# 95% 신뢰수준에서의 신뢰구간은 (99.50297, 100.70678) 이고
# p-value = 2.2e-16 < 0.05
# 귀무가설 기각
# 대립가설 채택
# 모평균 95와 차이가 있다고 할 수 있다.

# 평균 99.54와 차이가 있는가에 관한 가설설정과 검정통계량을 구하고 최종적인 해석을 하라!
t.test(x, mu=99.54, conf.level = 0.95)

# H0 : 모평균은 99.54와 차이가 없다.
# H1 : 모평균은 99.54와 차이가 있다.
# t0= -0.155509, df=999, p-value = 0.8768
# 유의수준 0.05에서 유의확률(0.8768)이 유의수준보다 크므로 귀무가설을 기각하기 어렵다.
# 따라서 모평균은 99.54와 차이가 없다고 할 수 있다.


t.test(x, mu=99.54, conf.level = 0.99)





# ---------------------------------------------------------------------------------------------------------------
# 단일 집단 비율차이 검정
# ---------------------------------------------------------------------------------------------------------------

data <- read.csv("one_sample.csv", header = T)
data

dim(data)
str(data)

x <- data$survey
x

# 결측치
summary(x)
# 0은 불만족, 1은 만족

table(x)

# 패키지를 이용하여 빈도수와 비율을 계산해보고 싶다.
library(prettyR)
freq(x)

# 만족율 기준으로 비율검정
# 귀무가설 : 올해의 고객 만족율은 작년의 만족율 80%와 차이가 없다.
# 대립가설 : 올해의 고객 만족율은 작년의 만족율 80%와 차이가 있다.

binom.test(c(136,14),p=0.8)

# number of successes = 136, number of trials = 150, p-value = 0.0006735
# alternative hypothesis: true probability of success is not equal to 0.8
# 95 percent confidence interval:
# 0.8483615 0.9480298
# 0.0006735 < 0.05
# 귀무가설 기각
# 따라서 올해의 고객 만족율은 작년의 만족율 80%와 차이가 있다고 할 수 있다.

# 귀무가설 : 올해의 고객불만족율이 작년(20%)과 차이가 없다.
# 대립가설 : 올해의 고객불만족율이 작년(20%)과 차이가 있다.
binom.test(c(14,136),p=0.2)
# number of successes = 14, number of trials = 150, p-value = 0.0006735
# alternative hypothesis: true probability of success is not equal to 0.2
# 95 percent confidence interval:
# 0.05197017 0.15163853
# 0.0006735 < 0.05
# 귀무가설 기각
# 따라서 올해의 고객불만족율이 작년(20%)과 차이가 있다고 할 수 있다.

# 귀무가설 : 올해의 고객 불만족율은 작년(20%) 보다 크지 않다.
# 대립가설 : 올해의 고객 불만족율은 작년(20%) 보다 크다.

binom.test(c(14,136),p=0.2,alternative = "greater",conf.level = 0.95)
# 0.05 <0.9999
# 유의수준 0.05에 대해 유의확률이 0.9999로 크므로, 귀무가설 채택
# 올해의 고객 불만족율은 작년(20%) 보다 크지 않다고 할 수 있다.



# ---------------------------------------------------------------------------------------------------------------
# 1. 벡터 v : 1 or 0 의 값 100개 생성.
# 2. 출력
# 3. 1: 동전의 앞면 0은 동전의 뒷면이라고 하자.
# 4. 동전의 앞면 비율이 45%인지 검정하시오.
# 5. 아니라면 큰지? 작은지? 검정하세요.
# ---------------------------------------------------------------------------------------------------------------
v <- round(runif(100,0,1),0)
v

table(v)
library(prettyR)
binom.test(c(55,45),p=0.45)
# H0 : 동전의 앞면 비율은 45%와 차이가 없다.
# H1 : 동전의 앞면 비율은 45%와 차이가 있다.
# 유의수준 0.05에서 유의확률이 0.05563로 유의수준보다 크므로 귀무가설 채택
# 따라서 동전의 앞면 비율은 45%와 차이가 없다고 할 수 있다.

# ---------------------------------------------------------------------------------------------------------------
# binom.test(c(70,30),p=0.45,alternative = "greater",conf.level = 0.95) ==> H0 기각 ==> 45%보다 크다할 수 있다.
# binom.test(c(30,70),p=0.45,alternative = "greater",conf.level = 0.95) ==> H0 채택 ==> 45%보다 작다할 수 있다.
# ---------------------------------------------------------------------------------------------------------------

# 두 집단 비율 차이 검정
data <- read.csv("two_sample.csv", header = T)
data
dim(data)
str(data)

table(data$survey)
x <- data$method
y <- data$survey
x
y

# y
# 0 : 불만족, 1: 만족
summary(y) # NA 여부 보기 위해!
y[y==0] <- "불만족"
y[y==1] <- "만족"
y

table(x,y)
table(x)
table(y)

# 귀무가설 : 두 집단의 만족비율의 차이가 없다.
# 대립가설 : 두 집단의 만족비율의 차이가 있다.

# 두 집단의 비율차이 검정 : prop.test()

prop.test(c(110,135),c(150,150))

# 0.05
# data:  c(110, 135) out of c(150, 150)
# X-squared = 12.824, df = 1, p-value = 0.0003422

# p-value : 0.0003422 < 0.05
# 귀무가설 기각
# 대립가설 채택

# 귀무가설 : 방법 1 비율 <= 방법 2 비율
# 대립가설 : 방법 1 비율 > 방법 2 비율

prop.test(c(110,135), c(150,150), alternative = "greater", conf.level = 0.95)
# p = 0.9998 > 0.05
# 귀무가설 채택
# 방법 1의 만족비율이 방법2의 만족비율보다 작거나 같다고 할 수 있다.

# ---------------------------------------------------------------------------------------------------------------
# 대응 두 집단 평균차이 검정
# ---------------------------------------------------------------------------------------------------------------
# 조건 A집단 독립적 B집단간의 비교
# 비교 대상 독립성 유지
# 대응 : 표본이 짝을 이룬다.
# ---------------------------------------------------------------------------------------------------------------
data <- read.csv("paired_sample.csv", header = T)
data
dim(data)
str(data)
# 빈도
table(data$before)
# NA
# 기술통계량
summary(data$before)
summary(data$after)

results <- subset(data, !is.na(after), c(before,after))
results

head(results)

after <- results$after
before <- results$before
mean(after)
mean(before)

# 분포모양 검정
# 귀무가설 : 두 집단간의 분포 모양의 차이가 없다.
# 대립가설 : 두 집단간의 분포 모양의 차이가 있다.

# 동질성검정
var.test(before,after,paired=TRUE)
# F = 1.0718, num df = 95, denom df = 95, p-value = 0.7361
# p-value = 0.7361 > 0.05
# 귀무가설 채택 ==> 두 집단간의 분포 모양의 차이가 없다고 할 수 있으니 이제 평균비교를 해보자!

# 귀무가설 : 다이어트약 복용 전후에 차이가 없다.
# 대립가설 : 다이어트약 복용 전후에 차이가 있다.

t.test(before,after,paired=TRUE)

# p-value < 2.2e-16 < 0.05
# 귀무가설 기각 ==> 다이어트약 복용 전후에 차이가 있다고 할 수 있다.

# 귀무가설 : 다이어트약 복용 전후에 효과가 작다.
# 대립가설 : 다이어트약 복용 전후에 효과가 크다.

# 방향성을 갖는 단측가설검정
t.test(before,after,paired = TRUE, alternative = "less", conf.level = 0.95)
t.test(after,before,paired = TRUE, alternative = "greater", conf.level = 0.95)

# p-value < 2.2e-16 < 0.05
# 귀무가설 기각
# before을 기준으로 비교 : before가 after보다 적다.



