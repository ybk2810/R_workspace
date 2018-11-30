# 제어문
if(TRUE){
  print("TRUE")
  print("Hello")
}else{
  print("FALSE")
  print("World")
}


# 1부터 10의 값중 홀수, 짝수 출력
x<-c(1:10)
x
for(i in x){
  if(i%%2==0){
    cat(i,": 짝수 \n")
  }else{
    cat(i,": 홀수 \n")
  }
}


# ifelse
ifelse(x%%2==0,"even","odd")

# for(i in data){
#       반복할 문장
# }
#
# while(조건){
#   조건이 참일때 수행할 문장
# }
#
# repeat{
#   반복해서 수행할 문장
# }

repeat{
  if(T){
    break
  }else{
    next #continue
  }
}


x<-10
y<-5
z<-x*y

if(z>40){
  cat("x*y의 결과는 40보다 큽니다. \n")
  cat("x*y =",z)
}else{
  cat("x*y의 결과는 40보다 작거나 같습니다. x*y =",z)
}

# 학점 구하기
score<-scan()


# 만약 90 이상이면 A
if(score>=90){
  result="A"
}else if(score>=80){
  result="B"
}else if(score>=70){
  result="C"
}else if(score>=60){
  result="D"
}else{
  result="F"
}
cat("당신의 학점은",result)

# 80점 이상이라면 우수, 아니면 노력
# ifelse()
ifelse(score>=80,"우수","노력")

# 중첩가능
ifelse(score>=90,"A",ifelse(score>=80,"B",ifelse(score>=70,"C",ifelse(score>=60,"D","F"))))

excel<-read.csv(file = "excel.csv", header = TRUE, sep = ",")
excel

# 구조
str(excel)

# 차원?
dim(excel)

q1<-excel$q1
q1

# 4 보다 큰 경우 루트
for(i in q1){
  if(i>4){
    cat(sqrt(i),"\n")
  }else{
    cat(i,"\n")
  }
}

ifelse(q1>4,sqrt(q1),q1)

# 1과 5만 출력, 그외 나머지는 지수승
for(i in q1){
  if(i<=1|i>=5){
    cat(i,"\n")
  }else{
    cat(i*i,"\n")
  }
}

ifelse(q1<=1|q1>=5,q1,q1^2)
ifelse(q1<=4&q1>=2,q1^2,q1)

# switch문
# switch(비교구문, 실행구문1, 실행구문2, 실행구문3, ...)
switch("pwd", id="hong", pwd=1234, age=320, name="홍길동")

# which문
# which()괄호 내에 조건에 해당하는 위치(index)를 출력

name<-c("kim","lee","park","ko")
which(name=="ko")

no<-c(1:5)
name<-c("홍길동","이순신","강다니엘","황민현","김태형")
score<-c(85,90,99,99,99)

exam<-data.frame(학번=no,이름=name,성적=score)
exam

# 홍길동은 몇번째 있을까?
which(exam$이름=="홍길동")

# 88점 이상인 사람들만 출력
exam[which(exam$성적>=88),]

# 88점 이상인 사람들은 누구?
exam[which(exam$성적>=88),2]

# 95점 이하의 성적을 받은 사람의 이름과 성적을 출력
exam[which(exam$성적<=95),c(2,3)]

# 복사
df<-data.frame(var1=c(1,2,3),var2=c(7,8,9))
df
df_copy<-df
df_copy
df

install.packages("dplyr")
library(dplyr)

df_copy<-rename(df_copy,y1=var1)
df_copy
df_copy<-rename(df_copy,y2=var2)
df_copy

ls()
rm(list = ls())
ls()

# ggplot2 패키지에 들어있는 mpq데이터 실습
install.packages("ggplot2")
library(ggplot2)

# :: 특정 패키지에 들어있는 함수나 데이터를 지칭할때는 콜론 2개를 사용한다.

mpg<-as.data.frame(ggplot2::mpg)
mpg
str(mpg)
dim(mpg)

# 1999년~2008년 사이에 차 38대 유명모델의 연비데이터
# manufacturer : 제조회사
# model : 모델명
# displ : 배기량
# cyl : 실리더 갯수
# drv : 구동 방식
# hwy : 고속도로 연비
# class : 자동차의 종류
# year : 생산연도
# trans : 변속기 종류
# cty : 도시 연비
# fl : 연료종류

# cty : city 변경
# hwy : highway 변경
# fl : fuel_type 변경
mpg<-rename(mpg,city=cty)
mpg<-rename(mpg,highway=hwy)
mpg<-rename(mpg,fuel_type=fl)
mpg

# 통합연비 total 파생변수
mpg$total<-(mpg$city+mpg$highway)/2
head(mpg)
summary(mpg$total)
hist(mpg$total)

# 합격판정
# 20 이상이면 PASS
# mpg$test
mpg$test<-ifelse(mpg$total>=20,"PASS","FAIL")
mpg$test
head(mpg)
tail(mpg)

# 등급 grade
# 30 A , 25 B , 20 C , 그외 D
mpg$grade<-ifelse(mpg$total>=30,"A",ifelse(mpg$total>=25,"B",ifelse(mpg$total>=20,"C","D")))
mpg$grade
str(mpg)
head(mpg)
tail(mpg)


# emp3.xls , 2번째 sheet에 있는 데이터를 읽어서 student dataframe 생성
library(readxl)
student <- read_xls("emp3.xls", sheet = 2)
student
# 총점 (total), 평균(avg) 파생변수 추가
student$total <- student$kor + student$eng + student$mat
student$avg <- apply(student[,2:4],1,mean)
student
# grade 성적 ABCDF 파생변수 추가
student$grade <- ifelse(student$avg>=90,"A",ifelse(student$avg>=80,"B",ifelse(student$avg>=70,"C",ifelse(student$avg>=60,"D","F"))))
student$grade
# 평균 점수를 기준으로 히스토그램 출력
hist(student$avg)
# 앞데이터 5개만 출력
head(student,5)

# 조건에 맞는 데이터 추출하기
member <- read_xls("emp3.xls", sheet = 2)
library("dplyr")

# class 6개 생성
member$class<-rep(c(1:6),14)
dim(member)

# 1반 학생들의 데이터만 추출
# member[which(member$class==1),]
member %>% filter(class==1)

# 3반만 출력하고 싶다!
member %>% filter(class==3)

# 4,5,6반 학생들의 데이터 추출
# member[which(member$class==4|member$class==5|member$class==6),]
member %>% filter(class==4|class==5|class==6)

# 3반만 빼고 출력하고 싶다!
member %>% filter(class!=3)

# 50점 이하 수포자 제거
member %>% filter(mat>50)

# 1반 수포자(50)만 보고 싶다
member %>% filter(mat<=50&class==1)

# 영어, 수학 점수 50점 이하 추출
member %>% filter(mat<=50 & eng<=50)

# 2,4,6 추출
member %>% filter(class==2|class==4|class==6)
member %>% filter(class %in% c(2,4,6))
member %>% filter(class %in% seq(2,6,2))

# 3반 학생들의 수학 총점과 평균?
class3 <- member %>% filter(class==3)

sum(class3$mat)
mean(class3$mat)

# 6반 학생들의 영어 총점과 평균?
class6 <- member %>% filter(class==6)

sum(class6$eng)
mean(class6$eng)

sum((member %>% filter(class==6))$eng)
mean((member %>% filter(class==6))$eng)

# 특정 변수만 추출

# 영어점수만 추출
member %>% select(eng)
# SELECT eng FROM member;

# 수학과 영어 점수 추출
member %>% select(mat, eng)
# SELECT mat, eng FROM member;

# 국어만 빼고 추출
member %>% select(-kor)

# 3반 학생들의 국어점수만 추출
member %>% filter(class==3) %>% select(kor)

# 앞에서 10개만 선택
head(member,10)
member%>%head(10)

# 수학점수 12개만 추출
member%>% select(mat) %>% head(12)

# 3반 학생들의 영어와 수학점수를 5개만 추출
member %>% filter(class==3) %>%select(eng, mat) %>% head(5)

# ---------------------------------------
# 국어 성적이 낮은 순으로 출력
member %>% arrange(kor) # 오름차순

# 국어 성적이 높은 순으로 출력
member %>% arrange(desc(kor)) # 내림차순

# 국어, 영어 점수의 오름차순
# SELECT * FROM member
# ORDER BY kor, eng;
member %>% arrange(kor, eng)

# SELECT * FROM member
# ORDER BY kordesc, eng desc;
member %>% arrange(desc(kor), desc(eng))
member %>% arrange(desc(kor,eng))

# 3반 학생들의 국어, 영어, 수학, class를 구하고 영어점수가 50점 이상, 수학점수가 70점 이상인 학생들의 데이터를
# 국어, 수학, 영어 내림차순으로 정렬해서 3개만 출력
member %>% filter(class==3 & eng>=50 & mat>=70) %>% select(kor, eng, mat, class) %>% arrange(desc(kor,mat,eng)) %>% head(3)

# 학생들의 총점 추가
member <- member %>% mutate(total=kor+eng+mat)
member

# 학생들의 평균 추가
member <- member %>% mutate(avg=(kor+eng+mat)%/%3)
member

# 총점은 제거
member <- member %>% select(-total)
member

# 영어 점수의 합계
member %>% summarise(sum_eng=sum(eng))

# 반별 영어점수의 평균
# SELECT class, avg(sal), avg_eng
# FROM member
# group by class
m<-member %>% group_by(class) %>% summarise(avg_eng=mean(eng))
m

# 저장
write.csv(m, file = "avg.csv", row.names = F, fileEncoding = "UTF-8")
getwd()

# 반복문
n<-c(1:10)
n

for (i in n){
    print(i*10)
}

# 짝수번째 값만 *10한 결과를 출력
for (i in n){
  if(i%%2 == 0){
    print(i*10)
  }else{
    print(i)
  }
}

for(i in n){
  if(i%%2 ==0)print(i*10)
}

# 구구단 3단 출력
for (i in n){
  cat(" 3 * ",i," = ",3*i,"\n")
}

# 반복문 while(조건){문장}
i=0
while(i<10){
  i<-i+1
  print(i)
}

# 구구단 3단 출력
i<-0
while(i<9){
  i<-i+1
  cat(" 3 * ",i," = ",3*i,"\n")
}

# do~ while()
# repeat{탈출조건}
cnt<-1
repeat{
  print(cnt)
  cnt<-cnt+1
  if(cnt>15)break
}

i<-0
repeat{
  i<-i+1
  cat(" 3 * ",i," = ",3*i,"\n")
  if(i==9)break
}

# 1부터 100사이의 정수중 2의 배수를 출력
# 단 3의 배수는 제외 , repeat 문 사용
i<-0
repeat{
  i<-i+1
  if(i%%2==0 & i%%3!=0){
    print(i)
  }
  if(i==100)break
}

i<-0
repeat{
  i<-i+1
  if(i%%2==0){
    if(i%%3==0)next
    print(i)
  }
  if(i==100)break
}


#문제 

#다음 client dataframe 을 대상으로 조건에 맞게 처리하세요 
name<-c("aaa","bbb","ccc","ddd")
gender<-c("F","M","M","F")
price<-c(72,54,65,23)
client<-data.frame(name,gender,price) 
client
#name  gender   price   
#aaa   F        72
#bbb   M        54
#ccc   M        65
#ddd   F        23

# price 가 65만원이상인 고객은 BEST 미만인 고객은 NORMAL
# result에 넣고 client객체의 컬럼으로 추가 
result<-ifelse(client$price>=65,"BEST","NORMAL")
client$result<-result
client

#gender M ==> Male  F==> Female 형식으로 
# gender2 생성
client$gender2<-ifelse(client$gender == "M","Male","Female")
client

# mClient 에 남성 고객만 추출 
mClient<-client %>% filter(gender=="M")
mClient

# Fclient 에 여성 고개만 추출 
FClient<-client %>% filter(gender=="F")
FClient

# vip 에 result가 BEST인 고객인 여성고개만 추출해서 담기 
vip<- client%>%filter(gender=="F" & result=="BEST")
vip

# 총 매출과 평균매출액을 구하시오 
sum(client%>%select(price))
sum(client$price)
sum(client%>%select(price))/4
mean(client$price)


# 사용자 정의 함수
f1 <- function (){
  print("매개 변수 없는 함수")
}

# 실행
# 함수명()
f1()

# 매개변수가 있는 함수
f2 <- function(x){
  cat("x :", x, "\n")
}
f2(100)
f2(100+200)

f3<-function(data){
  print(data)
  print("이젠 겨울인가요?")
}
f3("Hello R World")

# f4(100,200) 두 값의 합을 출력하는 함수 만들기!
f4<-function(x,y){
#  cat("첫번째 입력한 값 :",x,"\n")
#  cat("두번째 입력한 값 :",y,"\n")
#  cat("두 값의 합 :",x+y,"\n")
   print(x+y)
}
f4(100,200)

# test2.csv 파일을 읽어 test 객체를 생성 !
test<-read.csv("test2.csv",header = T, sep = ",")
test
str(test)
dim(test)
head(test)
summary(test)

# A 컬럼의 빈도? 빈도를 볼때는 테이블함수 이용 !!
table(test$A)

# 최대값, 최소값 출력
max(table(test$A))
min(table(test$A))

# 3개 정보를 한꺼번에 출력해주는 함수 fa를 생성
fa<-function(){
  a<-table(test$A)
  cat("변수 A에 대한 빈도분석 결과 \n")
  print(a)
  cat("MAX =",max(a),"\n")
  cat("MIN =",min(a),"\n")
}
fa()



# 누적합 출력함수 hap을 만들고
# 1부터 200까지의 합은 xxx 입니다.
# 로 출력되도록 만들자!
hap<-function(x){
  t<-c(1:x)
  sum<-0
  for(i in t){
    sum<-sum+i
  }
  cat("1부터 ",x,"까지의 합은 ",sum," 입니다.")
}

hap2<-function(n){
  s<-sum(c(1:n))
  cat("1부터 ",n,"까지의 합은 ",s," 입니다.")
}
hap(100)
hap(200)
hap(500)
hap2(100)
hap2(200)
hap2(500)

# 팩토리얼 함수를 만들고 싶다.
fac<-function(n){
  result<-1
  f<-c(1:n)
  for(i in f){
    result<-result*i
  }
  print(result)
  cat(n,"! 값은",result," 입니다.")
}
fac(5) #5!

factorial(5) # 이미 내장되어있는 함수이나 위는 연습을 위해서.. ㅋ

# 피타고라스의 정리
pytha<-function(a,b){
  c<-sqrt(a^2+b^2)
  cat("밑변이 ",a,", 높이가 ",b," 인 직각삼각형의 빗변의 길이는 ",c," 입니다.")
}
pytha(3,4)

n1<-c(10,20,30,40,90,NA)
n1
mean(n1)
mean(n1, na.rm = T)

# na 여부와 상관 없이 평균을 구해주는
# na 함수를 만들고 싶다!
na<-function(x){
  m<-mean(x,na.rm=T)
  cat("평균값 :",round(m,2))
}
na(n1)

# R 내장함수
c(10,20,30)
seq(-2,2,0.2)
rep(1:3,3)
vec<-c(1:10)
min(vec)
max(vec)
mean(n1,na.rm=T)
sum(n1,na.rm=T)

# 정규분포를 따르는 20개 데이터를 생성하는데, 평균은 0, 표준편차는 1인 정규분포에서 추출한다.
x<-rnorm(20, mean = 0, sd = 1)
mean(x)
sd(x)

# 1부터 100까지 사이의 정수 20개를 랜덤으로 추출하고 싶다!
round(runif(20, min = 0, max = 100),0)

sample(0:100,20)

range(vec)
median(vec)
sum(vec)

# 데이터의 곱
prod(vec)
vec

abs(-5) # 절대값
sd(rnorm(10)) # 표준편차
table(vec) # 빈도
sqrt(16) # 제곱근

# 이산형 변수와 연속형 변수
# 이산형 변수 (정수형 변수)
# 연속형 변수 (실수형 변수)

# 이산형 변수의 시각화
# 막대 차트
install.packages("RSADBE")
library(RSADBE)

help("RSADBE")

data("Severity_Counts")
# 버그 측정 데이터셋 (RSADBE 패키지 내장 데이터)
str(Severity_Counts)
barplot(Severity_Counts)
barplot(Severity_Counts,ylim=c(0,12000))
barplot(Severity_Counts,ylim=c(0,12000),col=rainbow(10))
barplot(Severity_Counts,ylim=c(0,12000),col=rainbow(10),main = "소프트웨어 버그 측정결과", font.main=4)
barplot(Severity_Counts,xlab="Bug Count",xlim = c(0,12000), col=rainbow(10), horiz = T, main = "소프트웨어 버그 측정결과", font.main=4)
barplot(Severity_Counts,xlab="Bug Count",xlim = c(0,12000), col=rep(c(3,7),5), horiz = T, main = "소프트웨어 버그 측정결과", font.main=4)

# 1. 검정, 2. 빨강, 3. 초록, 4. 파랑, 5. 하늘색, 6. 자주색, 7. 노랑색 

# 5개의 소프트웨어 별로 발표전과 후 버그 측정결과를 3차원 배열 구조로 제공
data("Bug_Metrics_Software")
str(Bug_Metrics_Software)
dim(Bug_Metrics_Software)

# 1면(발표전), 2면(발표후)
par(mfrow=c(1,2)) # 1행 2열 로 그래프 보

barplot(Bug_Metrics_Software[,,1], 
        beside = T, 
        col=c("lightblue","mistyrose","lightcyan","lavender","cornsilk"),
        legend=c("JDT","PDE","Equinox","Lucene","mylyn"))
# 2면 그래프 출력
barplot(Bug_Metrics_Software[,,2], 
        beside = T, 
        col=c("lightblue","mistyrose","lightcyan","lavender","cornsilk"),
        legend=c("JDT","PDE","Equinox","Lucene","mylyn"))

# 점 차트 시각화
par(mfrow=c(1,1)) # 1행 1열 그래프 보기

dotchart(Severity_Counts,
         col=9:10,
         pch=1:2,
         labels=names(Severity_Counts),
         main="Dot Plot",
         cex=1.2)

# 사원 테이블의 데이터를 읽어와서
# 부서별 평균급여를 구하고
# 막대차트로 그려보세요.
library("dplyr")
emp<-read.csv('table.csv')
emp10<-emp%>%filter(DEPTNO==10)%>%select(SAL)
emp10
avg10<-sum(emp10)/3

emp20<-emp%>%filter(DEPTNO==20)%>%select(SAL)
emp20
avg20<-sum(emp20)/5

emp30<-emp%>%filter(DEPTNO==30)%>%select(SAL)
emp30
avg30<-sum(emp30)/6
barplot(c(avg10,avg20,avg30),ylim=c(0,3000),col=rainbow(3),legend.text = c("dep10","dep20","dep30"))


x<-aggregate(SAL~DEPTNO,emp,mean)
x
barplot(width=x$DEPTNO,height=x$SAL,ylim=c(0,3000),col=rainbow(3),legend.text = c("dep10","dep20","dep30"))

# 아래는 선생님 풀이
emp
# SELECT DEPTNO, AVG(SAL)
# FROM emp
# GROUP BY deptno;
library(dplyr)
emp_avg <- emp %>% group_by(DEPTNO) %>% summarise(avg=mean(SAL))
dim(emp_avg)
str(emp_avg)
barplot(emp_avg$avg,ylim=c(0,5000),col=rainbow(3),names.arg = emp_avg$DEPTNO, legend.text = emp_avg$DEPTNO)


# job별 평균 급여를 bar차트 그리기!
emp_avg2 <- emp %>% group_by(JOB) %>% summarise(avg=mean(SAL))
dim(emp_avg2)
str(emp_avg2)
barplot(emp_avg2$avg,ylim=c(0,5000),col=rainbow(5),names.arg = emp_avg2$JOB, legend.text = emp_avg2$JOB,
        main="JOB별 평균급여",
        xlab="JOB",
        ylab="평균급여"
        )

?barplot
# 파이 차트
data("Severity_Counts")
class(Severity_Counts) #"numeric"
Severity_Counts

par(mfrow=c(1,2))
pie(Severity_Counts[c(1,3,5,7,9)])
title("릴리즈 버그")

pie(Severity_Counts[c(2,4,6,8,10)])
title("릴리즈 후 버그")

#----------------------------------------------------------------
# job별 평균급여
emp_avg2
# 부서번호별 평균급여
emp_avg
# 1행 2열 pie 차트 그리기
par(mfrow=c(1,2))
pie(emp_avg2$avg,labels = round(emp_avg2$avg,2))
title("job별 평균급여")

pie(emp_avg$avg,labels = round(emp_avg$avg,2))
title("부서번호별 평균급여")

#----------------------------------------------------------------

GDP_RANKING<-read.csv("http://databank.worldbank.org/data/download/GDP.csv")
GDP_RANKING
str(GDP_RANKING)

# 불필요한 행과 열을 제거! (1,2,4,5 열만 필요, 1~5행은 불필요)
GDP_RANKING2<-GDP_RANKING[-c(1:4),c(1,2,4,5)]
head(GDP_RANKING2)

# 컬럼의 이름을 변경
names(GDP_RANKING2)<-c("CODE","RANK","NATION","GDP")
head(GDP_RANKING2)

# 상위 15개 국가만 잘라서 다시 데이터를 정제한다.
GDP_RANKING15<-head(GDP_RANKING2,15)
GDP_RANKING15
str(GDP_RANKING15)

gdp<-GDP_RANKING15$GDP
gdp

nation<-GDP_RANKING15$NATION
nation

# , 제거
library(stringr)

# ,를 만나면 공백으로 바꿔라!
gdp<-str_replace_all(gdp,',','')
gdp
gdp<-as.numeric(gdp)
gdp

GDP_RANKING15$GDP<-gdp
GDP_RANKING15

summary(GDP_RANKING15$GDP)

par(mfrow=c(1,1))
# 막대차트
barplot(GDP_RANKING15$GDP, col=rainbow(15), ylim = c(0,20000000), xlab = "국가",
        ylab = "GDP(달러)",
        names.arg=nation)

# 파이차트
pie(GDP_RANKING15$GDP, col=rainbow(15), labels = GDP_RANKING15$NATION)































