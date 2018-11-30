# 이산형 변수
# 정수 단위로 나누어 측정할 수 있는 변수
# 시각화 방법 : 막대차트, 점차트, 파이차트

# 연속형 변수
# 시간, 길이 등과 같이 연속성을 가진 실수 단위변수
# 시각화 방법 : 히스토그램, 상자 그래프, 산점도, 변수간의 비교 시각화

library(RSADBE)
data("resistivity")

resistivity
str(resistivity)

# 와이어의 저항, 제조 프로세스 간에 차이가 있는가?
summary(resistivity)

# box 그래프
?boxplot
boxplot(resistivity, range = 0)

# notch = T : 중위수 비교시 사용되는 옵션으로 허리선 이라고도 한다.
boxplot(resistivity, range = 0, notch = T)

# 기준선 부여
# lty 선옵션 3점
abline(h=0.14, lty = 3)

abline(h=0.143, lty = 3)

# 히스토그램 시각화
install.packages("psych")
library(psych)

galton
str(galton)
# galton : 영국 유전학자, 우생학 창시자
# galton에 의해 연구된 부모와 자식의 키 사이의 관계
# 928 관측치와 2개의 변수로 데이터화
# 회귀분석
par(mfrow=c(1,2))

# 부모키로 히스토그램
hist(galton$parent, breaks = "FD", xlab = "부모의 키(인치)", ylab="빈도",
     main="부모의 키 히스토그램")
hist(galton$child, breaks = "FD", xlab = "자식의 키(인치)", ylab="빈도",
     main="자식의 키 히스토그램")

par(mfrow=c(1,1))

# 산점도 시각화
price <- runif(10,min=1,max = 100)
price

plot(price)

par(mfrow=c(2,2))

plot(price,type="o") #원
plot(price,type="l") #실선
plot(price,type="h") #직선
plot(price,type="s") #꺾은선

# pch : 연결점 문자 타입
# plotting Character (1~30)
plot(price, type = "o", pch=5) # 빈 마름모
plot(price, type = "o", pch=15) # 채워진 사각형
plot(price, type = "o", pch=20, col = "blue") # 채워진 원
plot(price, type = "o", pch=20, col = "orange", cex=1.5) # 채워진 원, 점의 크기 1.5
plot(price, type = "o", pch=20, col = "orange", cex=2.0) # 채워진 원, 점의 크기 2.0 
plot(price, type = "o", pch=20, col = "orange", cex=2.0, lwd=3) # 채워진 원, 점의 크기 2.0, 선굵기 3

# line width

# sales.csv
sales<-read.csv('sales.csv')
sales
str(sales)
# plot
par(mfrow=c(1,1))
attach(sales) # 데이터셋 이름을 생략할 수 있다.
plot(Quarter, A, type="o", pch=18, col="blue", ylim = c(0,2500))
plot(Quarter, A, type="o", pch=18, col="blue", ylim = c(0,2500), axes=F, ann=F)
# axes=F 는 x축, y축 눈금제거
# ann=F 축의 이름을 제거
axis(1,at=1:4, labels = c("1분기", "2분기", "3분기", "4분기"))
axis(2, ylim=c(0,2500))
text(3.7, 2200, "사업부A", cex = 0.8)
title(main = "사업부 2017년 분기멸 매출 추이 비교")

# B 출력
par(new=T)
plot(Quarter, B, type="o", pch=18, col="orange", ylim = c(0,2500), axes=F, ann=F)
text(3.7, 1400, "사업부B", cex = 0.8)
par(new=T)
plot(Quarter, C, type="o", pch=18, col="red", ylim = c(0,2500), axes=F, ann=F)
text(3.7, 900, "사업부C", cex = 0.8)
par(new=T)
plot(Quarter, D, type="o", pch=18, col="green", ylim = c(0,2500), axes=F, ann=F)
text(3.7, 620, "사업부D", cex = 0.8)

detach(sales) # attach 해제

# x 변수와 y 변수의 회귀 관계

# plot(x,y)
# plot(y~x)

plot(child~parent, data=galton, ylim=c(45,90), xlim=c(50,90))
out=lm(child~parent, data=galton)
abline(out,col="red")
summary(out)

# 동일 데이터가 겹친 경우 시각화 표현
x<-c(1,2,3,4,2,4)
y<-rep(2,6)
x
y

par(mfrow=c(1,1))
plot(x,y)
table(x,y)
xy_df<-data.frame(table(x,y))
xy_df

plot(y~x, pch="@", cex=0.5*xy_df$Freq, col="red")

# 빈도 먼저 구하기
table(galton$child, galton$parent)

# 현재 테이블이기에 데이터 프레임으로 형변환
freqData<-as.data.frame(table(galton$child, galton$parent))
freqData
str(freqData)
names(freqData)<-c("child","parent","freq")
str(freqData)

parent<-as.numeric(freqData$parent)
child<-as.numeric(freqData$child)

plot(child~parent, pch="@", col="blue",
     cex=0.1*freqData$freq,
     xlab="parent",
     ylab="child")

# iris 데이터셋
# 세가지 꽃의 종류별로 50개씩 
# 150개의 관측치
# 붓꽃에 관한 데이터 5개의 변수로 제공
str(iris)
#Sepal.Length : 꽃받침의 길이
#Sepal.Width : 꽃받침의 너비
#Petal.Length : 꽃잎의 길이
#Petal.Width : 꽃잎의 너비
#Species : 꽃의 종류

head(iris)

pairs(iris[,1:4])

tail(iris)

# Species ==> virginica
library(dplyr)
df <- iris %>% filter(Species=="virginica") %>% select(-Species)
df
str(df)

# 꽃밭침의 길이
# x : Petal.Width
# y : Petal.Length
plot(df$Petal.Length~df$Petal.Width)

# 명령어로 저장하기
df1 <- iris[iris$Species == 'virginica',1:4]
df1

getwd()

library(psych)

jpeg("galton.png",width = 720, height = 480)
plot(child~parent, data = galton)
title(main = "부모와 자식의 키 유전관계")
out = lm(child~parent, data = galton)
abline(out, col = "red")
dev.off() # 장치 종료

# 탐색적 데이터 분석 (EDA)
dataset <- read.csv("dataset.csv", header = T, sep = ",")
dataset
str(dataset)

# resident : 거주지
# gender : 성별
# job : 직업
# age : 나이
# position : 직위
# price : 구매금액
# survey : 만족도

View(dataset)
head(dataset)
tail(dataset)
dim(dataset)
names(dataset)
attributes(dataset)

dataset$age
dataset$resident

length(dataset$age)

plot(dataset$price)

x <- dataset$gender
y <- dataset$price

x
y

dataset$gender
dataset["gender"]

# 색인(index)으로 변수의 위치값을 조회
dataset[2]
dataset[6]

# 3번째 관측치 (행) 전체
dataset[3,]

# 3번째 변수(열) 전체
dataset[,3]

# job, price 컬럼 두개의 변수 조회?
dataset[c("job","price")]

# 2행 ~ 4행 전체
dataset[2:4,]

# 결측치 처리 - NA
summary(dataset$price)

sum(dataset$price, na.rm = T)

price2 <- na.omit(dataset$price)
price2
sum(price2)
length(price2)

# 극단치 발견과 정제(이상치)

# 1, 2 선택
dataset$gender

# filter 함수
library(dplyr)
data <- dataset%>%filter(gender==c(1,2))
data <- dataset%>%filter(gender==1|gender==2)
# subset 함수
data2 <- subset(dataset,select = "gender") # 이건 성별 만 가져오는것
data2 <- subset(dataset,dataset$gender==1|dataset$gender==2)
data2

head(data)
head(data2)

# gender 히스토그램, 파이차트 그리기!
hist(data$gender)
pie(table(data$gender))

length(data$gender)

# price 이상치 발견과 정제 -> 2 이상 10 이하에 해당하는 것만 따로 모으고 싶다!
plot(dataset$price)

data<-subset(dataset,dataset$price>=2&dataset$price<=10)
data$price

# 줄기와 잎 도표 보기
stem(data$price)

# 설문
# 만족도 조사
data$survey

# 1.매우만족  2.만족  3.보통 4.불만족  5.매우불만족
# 관념상 높은점수가 좋은것이다라는 인식이 있으니 숫자를 역코딩한다
# 1 ==> 5
# 5 ==> 1

survey <- data$survey
survey

curvey <- 6-survey
curvey

# 5점척도라 6에서 뺐으니, 마찬가지로10점척도로 되어있다면, 11에서 빼면 된다.

data$age

# 1.age 변수 : 20~69
# 이상치와 결측치 제거
age2<-data%>%filter(age>=20 & age<=69)
age2<-subset(data,data$age>=20&data$age<=69)


# position
# 1급 ==> 5급
# 역코딩
tpos <- 6-data$position
tpos

data$position<-tpos
mean(data$position, na.rm = T)

is.na(data$age)

# 데이터의 수가 적으면 신뢰도의 문제

mean(data$age, na.rm=T) # 42.6

data$age[is.na(data$age)] <- mean(data$age, na.rm=T)

table(dataset$age)
table(data$age)

# 연속형 변수 ==> 범주형으로 변환
# data$age2
# 30세 이하면 청년층
# 45세 이하면 중년층
# 45세 초과는 장년층
data$age2[data$age<=30]<-"청년층"
data$age2[data$age>30 & data$age<=45]<-"중년층"
data$age2[data$age>45]<-"장년층"
data$age2

# data$resident2
# 1 특별시   2~4 광역시   5 시구   NA 제거
data$resident2[data$resident==1]<-"특별시"
data$resident2[data$resident==2|data$resident==3|data$resident==4]<-"광역시"
data$resident2[data$resident==5]<-"시구군"
data$resident2
subset(data,data$resident>=1 |data$resident<=5)

# 범위
range(data$resident, na.rm=T)

data<-subset(data, !is.na(data$resident))
data
range(data$resident)

# gender2 1==>남자 2==>여자
# 빈도를 이용한 파이 그래프 그리기!
data$gender2[data$gender==1]<-"남자"
data$gender2[data$gender==2]<-"여자"
data$gender2
data<-subset(data, !is.na(data$gender))
range(data$gender)

pie(table(data$gender2))

# data$age3      30세 이하는 1, 31~45세는 2, 46세 이상은 3
data$age3[data$age<=30]<-1
data$age3[data$age>=31 & data$age<=45]<-2
data$age3[data$age>=46]<-3

table(data$age3)

#cleanData.csv
write.csv(data,"cleanData.csv", quote = F, row.names = F)


# 표본 샘플링
sample(1:30,10)

dim(data)

# 전체 데이터 분석용과 테스트용 데이터로 분리
# 7:3 사용

# train set : test set = 7 : 3

# 행 번호 추출
# 30개만 추출
choice <- sample(1:nrow(data),30)
choice

# 관측치 추출
result <- data[choice,]
result


# 10~50, 30개 추출
choice2 <- sample(10:50,30)
choice2

# 50-end, 30개 추출
choice3 <- sample(50:nrow(data),30)
choice3

# 70~end, 15개 추출
choice4 <- sample(70:nrow(data),15)
choice4

# 다양한 범위를 지정해서 무작위 샘플링
choice5 <- sample(c(10:50,70:150,160:190),30)
result2 <- data[choice5,]
result2

# iris
str(iris)
nrow(iris)

# 전체 데이터중 70%만 Train set
# 70%만 샘플링 데이터 번호를 추출!
idx <- sample(1:nrow(iris),nrow(iris)*0.7)
length(idx)
train <- iris[idx,]
train

# test 셋은 30퍼센트에 해당되는 데이터셋만 추출!

test <- iris[-idx,]
test

# train / test 각 데이터셋을 대상으로 꽃의 빈도수를 체크!
# 한 화면에 두개의 차트를 그리고 싶다!
# 파이 차트로 시각화
par(mfrow=c(1,2))
pie(table(train$Species))
pie(table(test$Species))

par(mfrow=c(1,1))

LETTERS # 대문자
letters # 소문자

x <- runif(2600000, min = 0, max = 100)
length(x)
head(x)

y <- rep(LETTERS, each = 100000)
length(y)

df <- data.frame(x,y)
df

head(df)
tail(df)

dim(df)

# df 를 대상으로 50개만 샘플링하여
# 영문자의 빈도수를 pie
# sample(범위,갯수)
num<-sample(1:nrow(df),50)
table(df[num,2])
pie(table(df[num,2]))

# train set 70%, test set 30%
# 영문자의 빈도
# 한 화면 2개의 pie 차트를 작성

idx7 <- sample(1:nrow(df),nrow(df)*0.7)
str(idx7)
length(idx7)

train <- df[idx7,]
test <- df[-idx7,]

par(mfrow=c(1,2))
pie(table(train$y))
pie(table(test$y))





