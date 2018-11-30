# 1부터 16까지 정수로 4행 4열
# 매트릭스를 생성
# 행 우선 
# y
y<-matrix(c(1:16),nrow=4,ncol=4,byrow=TRUE)
y

# 열 이름 : 1열
# 행 이름 : 1행
rownames(y)<-c("1행","2행","3행","4행")
colnames(y)<-c("1열","2열","3열","4열")
y

# 행기준으로 합계
x1<-apply(y,1,sum)
x1
# 열기준으로 합계
x2<-apply(y,2,sum)
x2
# 행기준으로 평균
x3<-apply(y,1,mean)
x3

# 사용자 정의 함수
f<-function(x){
    print("사용자 정의 함수")
   }
f(1)
x4<-c(1:10)
x4
f(x4)

# apply 함수 적용
apply(y,1,f)

# Array : 동일 데이터 타입을 갖는 다차원 배열 (1차원 : vector , 2차원 : matrix)
d<-c(1:12)
d
mode(d); class(d)

arr<-array(d,c(3,2,2)) # 3행, 2열, 2면
arr

# 1면만 조회하고 싶다
arr[,,1]

# 2면만 조회
arr[,,2]

# 2행1열1면의 값
arr[2,1,1]

# 데이터에는 정형데이터와 비정형 데이터가 있다!

# Data Frame : 서로다른 데이터 타입을 갖는 컬럼, 리스트보다 더 활용 범위가 넓다.
# -> DBMS 의 테이블 구조를 가지고 있다.
# -> excel 의 스프레드시트와도 같은 개념.

# 데이터 타입 : SCALA , STRING, BOOLEAN , FACTOR , VECTOR , LIST , Matrix , ARRAY , DATA FRAME
no<-c(1,2,3)
name<-c("hong","lee","kim")
pay<-c(150,250,300)
vemp<-data.frame(No=no,NAME=name,PAY=pay) # 컬럼명을 지정!
vemp

# vemp2
# EMPNO ENAME     SAL
# ----- --------  ---
# 1111  반장      385
# 2222  지혀니    400
# 3333  리리      400
# 4444  용대전사  400
no<-c(1111,2222,3333,4444)
name<-c("반장","지혀니","리리","용대전사")
money<-c(385,400,400,400)
vemp2<-data.frame(EMPNO=no,ENAME=name,SAL=money)
vemp2
T<-TRUE
m<-matrix(c(1,"hong",150,2,"lee",250,3,"kim",350),3,by=T)
m

memp<-data.frame(m)
memp
memp$X1

# 시험 성적 처리

# name      kor     mat
# 홍길동    100     20
# 이순신    80      70
# 유관순    90      80
# 둘리      80      50
# 고길동    80      90
# member 변수에 입력

member<-matrix(c("홍길동",100,20,"이순신",80,70,"유관순",90,80,"둘리",80,50,"고길동",80,90),5,by=T)
member
colnames(member)<-c("name","kor","mat")
member
member<-data.frame(member)
member

name<-c("홍길동","이순신","유관순","둘리","고길동")
kor<-c(100,80,90,80,80)
mat<-c(20,70,80,50,90)
member<-data.frame(name=name,kor=kor,mat=mat)
member
# 국어 평균점수
mean(member$kor)
# 수학 평균점수
mean(member$mat)
# 수학 꼴지의 점수
min(member$mat)

# 현재의 workspace를 보여준다!
getwd()

# csv 파일을 이용한 객체 생성
# csv() 함수는 기본값 : header=T
csvemp<-read.csv('table.csv',header = T)
csvemp

txtemp<-read.table('table.txt',header = T, sep="\t")
txtemp

# 직원들의 월급의 합계
sum(txtemp$SAL)
# 평균급여
mean(txtemp$SAL)
# 급여 최대값
max(txtemp$SAL)
class(txtemp)

csvemp<-read.csv('table.csv',header = F)
csvemp
# 첫 줄만 제거
csvemp<-csvemp[-1,]
csvemp
csvemp$V6

# 순서형 데이터
pay<-ordered(csvemp$V6,c(1:5000))
class(pay)
pay

# 순서형인지 여부를 리턴하고 싶을때
is.ordered(pay)
pay<-as.numeric(pay)
mean(pay)

# emp dataframe 객체를 생성하세요
name<-c("EMPNO","ENAME","JOB","MGR","HIREDATE","SAL","COMM","DEPTNO")
emp<-read.csv('emp2.csv', header = F, col.names = name)
emp

# 벡터로 데이터 프레임 만들기

# 상품      가격      판매수량
# 딸기      5000      300
# 사과      3000      800
# 배        4000      1000
# 키위      2000      3000

product<-c("딸기","사과","배","키위")
price<-c(5000,3000,4000,2000)
count<-c(300,800,1000,3000)

# f : dataFrame

f<-data.frame("상품"=product,"가격"=price,"판매수량"=count)
f
# 총 판매 수량 ? 
sum(f$판매수량)
# 과일들의 평균가격 ? 
mean(f$가격)

name<-c("최수종","하희라","최민수","강다니엘","황민현")
age<-c(55,53,49,23,24)
gender<-c(1,2,1,1,1) # 남자1 여자2
job<-c("배우","배우","배우","아이돌","아이돌")
sat<-c(4,5,5,5,5)
grade<-c("C","C","A","A","A")
total<-c(300.4,500.3,600.7,800.3,900.5)
user<-data.frame(name,age,gender,job,sat,grade,total)
user

# 성별 히스토그램
hist(user$gender)

# 산점도
plot(user$sat)
plot(user$sat~user$name)


r1<-c(100,80,90)
r2<-c(90,80,75)
r3<-c(86,78,95)

Data<-data.frame(r1,r2,r3)

# 열단위 최소값 출력 (apply)
apply(Data,2,min)
# 행단위 최소값 출력 (apply)
apply(Data,1,min)

# 평균

# 분산 : 흩어진 정도를 계산한 지표 -> 자료가 평균을 중심으로 얼마나 퍼져있는지 나타내는 대표적 수
apply(Data,1,var) # 분산

apply(Data,2,sd) # 표준편차

# Data, 행 기준으로 평균을 구하고 싶다
apply(Data,1,mean)

# 서브셋 만들기
x<-1:5
y<-6:10
x
y
df<-data.frame(x,y)
df

# x가 3 이상인 데이터
x1<-subset(df,x>=3)
x1

# y1은 y가 8 이하인 레코드만 대상으로 한 서브셋으로 출력
y1<-subset(df,y<=8)
y1

# x가 2 이상 or y가 6 이하인 xy 서브셋
xy<-subset(df,x>=2|y<=6)
xy

height<-data.frame(id=c(1,2),h=c(180,175))
weight<-data.frame(id=c(1,2),w=c(80,75))
height
weight

# 병합
user<-merge(height,weight,by.x = "id",by.y="id")
user

# I/O
# 간단간단한 입력들을 할때 사용 -> 바로 R에 저장되어 사용 용도가 있음.
x<-scan()
x
sum(x)

y<-scan(what = "")
y

df=data.frame() # 빈 데이터 프레임
df
df=edit(df)
df

sum(df$qty)

# 네이버 환율에서 10월 데이터를 dataframe으로 만들고
# 10월 달러 환율 평균과 분산을 구하려고 한다.

# df1 : 텍스트파일에서 읽기
# df2 : 에디터로 입력

df1<-read.table('df1.txt', header = FALSE, sep = "\t")
df1
class(df1$V2)

mean(as.double(gsub(",","",df1$V2)))
var(as.double(gsub(",","",df1$V2)))

df2<-data.frame()
df2
df2<-edit(df2)
df2
df2$USDKRW
mean(as.double(gsub(",","",df2$USDKRW)))
var(as.double(gsub(",","",df2$USDKRW)))

# 컬럼명이 없는 파일 불러오기
student<-read.table(file = "student.txt")
student

# 컬럼명이 있는 파일 불러오기 (헤더가 있다)
student1<-read.table(file = "student1.txt", header = T)
student1

# 구분자가 존재한다면
student2<-read.table(file = "student2.txt", header = T, sep = ";")
student2

# NA를 - 로 대신 사용하여 자료를 입력했었다면 처리방법
student3<-read.table(file = "student3.txt", header = T, na.strings = c("&","-"))
student3

# student2 객체에서 키의 평균?
mean(student2$키)

# student3 객체에서 키의 평균?
# -> 결측치가 있으니까, 결측치를 제외한 키의 평균?
mean(student3$키)
mean(student3$키,na.rm = TRUE)

# 결측치를 제외한 몸무게의 평균?
mean(student3$몸무게)
mean(student3$몸무게,na.rm = TRUE)

# student4.txt
student4<-read.table(file.choose(), header = T, sep = ",", na.strings = "-")
student4

# xlsx
Sys.getenv() # 환경변수 설정한 목록 출력
# Sys.setenv(JAVA_HOME = 'C:\Program Files\Java\jdk1.8.0_171') # 자바 설치경로 환경변수 설정법 ( 만약 되어있지 않다는 가정 하에)

# R에서 엑셀파일을 읽으려면 패키지를 설치해야 한다.
install.packages("rjava")
install.packages("xlsx")

# 설치를 했으면 읽어와야지!
library(rJava)
library(xlsx)

studentex<-read.xlsx(file.choose(),sheetIndex = 1, encoding = "UTF-8")
studentex

# csv형태로 저장하기!
write.csv(studentex, file="df_st.csv")

# Rdata 형태로도 저장 가능하다!
save(studentex, file = "st.rda")

# 제거
rm(studentex)

# Rdata 읽기
load("st.rda")
studentex

str(studentex)

dim(studentex)

# emp2.csv 파일을 읽어와
# emp 라는 dataframe 을 생성
emp<-read.csv(file = "emp2.csv", header = FALSE)
emp

# 구조 확인
str(emp)

# 몇행 몇열?
dim(emp)

head(emp, 3)

tail(emp, 4)

View(emp)

summary(emp)

boxplot(emp$V6)

# emp.dra로 저장하고 싶다.
save(emp, file = "emp.dra")

# emp 제거
rm(emp)

# emp 불러오기
load("emp.dra")
emp

# xls , xlsx
install.packages("readxl")
library(readxl)

member<-read_xls("emp3.xls", sheet = 2)
# name kor eng mat  추가 
colnames(member)

#처음 12개 데이터 출력 
head(member,12)

# 마지막 10개 데이터 출력
tail(member,10)

# 요약정보
summary(member)

# 수학점수는 boxplot 그리기 
boxplot(member$mat)

# 수학점수: 최소, 최대 , 제1사분위값, 중위수, 3사분위수값 
summary(member$mat)

# 각 점수를 이용해서 행/열 방향으로 max값 구하기 
apply(member[,-1], 1, max)
apply(member[,-1], 2, max)

# 평균을 구하기(소수점2자리까지 표현) 
round(apply(member[,-1],2,mean),2)

# 각 점수의 평균, 분산 표준편차 구하기 

member$total<-member$kor+member$eng+member$mat
member

mean(member$kor)
mean(member$eng)
mean(member$mat)

var(member$kor)
var(member$eng)
var(member$mat)

sd(member$kor)
sd(member$eng)
sd(member$mat)

#avg변수 추가  
member$avg<-apply(member[,2:4],1,mean)
member

# memberrdata.csv 파일로 저장하기 
write.csv(member, file="memberrdata.csv")















