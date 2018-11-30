1+1

# 주석

a<-10

x=c(10,20,30)

mean(x)

mean(x=c(10,20,30))

mean(x<-c(10,20,30))

x<-20
y<-6
x+y
x-y
x*y
x/y
x^y
x**y

x%/%y #몫
x%%y #나머지

a
print(a)

dim(available.packages())

# session 정보 보기
sessionInfo()

# 스칼라 변수 : 단일 값을 저장할 수 있는 변수
# integer 100, 200, 300
# numeric 10.4, 20.3
# NA(Not Available) 데이터가 없음
# NULL : null 객체, 변수가 초기화 되지 않음

# 문자열
# 한개의 문자에 대한 데이터 타입 : char

# 'big_data'
# "big_data"

var1<-'big_data'
var2<-"big_data"

var1
var2

c<-NA #데이터가 없음
is.na(c) # c라는 변수가 데이터가 없는 변수가 맞아?

c<-NULL
c

x<-"Hello R World"
y<-"hello r world"
x
y

# boolean

TRUE & TRUE
TRUE & FALSE

TRUE & F
TRUE & T

# TRUE : 예약어
# T : 전역변수

FALSE<-TRUE # 예약어기 때문에 할당이 되지 않는다!
T<-FALSE # 변수기 때문에 할당이 가능하다!
T
TRUE & T

# 1. var1 변수에 10, var2 변수에 8, var3 변수에 TRUE 를 할당하고 콘솔에 출력

var1 <- 10
var2 <- 8
var3 <- TRUE
var1
var2
var3

# 2. var1, var2 의 산술연산결과를 출력

var1+var2
var1-var2
var1*var2
var1/var2
var1%/%var2
var1%%var2


# 성적 계산

# 홍길동의 국어, 영어, 수학 점수를 구해 총점과 평균을 내보려 한다.
hong<-c(80,70,20)
hong
names(hong)<-c("국어","영어","수학")
hong

# 평균
mean(hong)
# 합계
sum(hong)
#최대값
max(hong)
#최소값
min(hong)

# 패키지 : 다양한 함수들을 모아놓은 꾸러미

# ggplot2 패키지를 설치
sessionInfo()

install.packages("ggplot2")

sessionInfo()

# 패키지 로딩
library(ggplot2)
sessionInfo()

# 빈도 막대 그래프로 출력
qplot(hong)


gender<-factor("m",c("m","f")) # 범주형 자료이며 그중 명목형

gender1<-factor("m",c("m","f"),ordered=TRUE) # 범주형 중 순서형

# 팩터의 레벨 갯수
nlevels(gender)
# 팩터의 레벨 목록
levels(gender)
# 팩터인지 아닌지 알아보기
is.factor(gender)
# grade 에 학년 정보를 담고자 한다. 3 , 학년의 범위는 1~4 순서형 자료이다.
grade<-factor("3",c("1","2","3","4"),ordered = TRUE)
grade
# 레벨 갯수?
nlevels(grade)
# 목록
levels(grade)
# 팩터인지 아닌지?
is.factor(grade)

# 순서형으로 변환
gender2<-ordered(gender,levels=c("m","f"))
gender2

# vector : 일반적인 언어에서의 배열
# c(), seq(), rep() 등의 함수로 입력가능
# names() : 컬럼의 이름을 부여할 수 있는 함수
# 동일한 자료형을 갖는 1차원 배열의 구조

x<-c(1,2,3,4,5)
x
class(x)

# 3번째 데이터 출력
x[3]

# 컬럼의 이름을 부여
names(x)<-c("kim","Lee","park","choi","hong")
x

# 3만 빼고 출력
x[-3]

# 자바문법
# for(int i=1;i<=x.length;i++){
#    if(i!=3)
#       System.out.println(i)
# }

# 2번부터 4번까지만 출력
x[2:4]

# 길이
length(x)

# 행 또는 열의 수를 반환 (대소문자 주의!)
NROW(x)

# 1부터 20까지의 값을 y 변수에 할당하고 y를 출력!
y<-c(1:20)
# y 출력
y
# y의 평균을 출력
mean(y)

#seq(시작값,끝값,증가값)
x<-seq(1,20,2)
x
#rep(시작값:끝값,반복횟수)
k<-rep(1:3,3)
k

j<-rep(1:10,each=3)
j

?rep

# 벡터 데이터 처리 함수
x<-c(1,3,5)
y<-c(3,5,7)
x
y

identical(x,y) # 동일 객체인지 여부

# 교집합
intersect(x,y)

# 합집합
union(x,y)

# 차집합
setdiff(x,y)
setdiff(y,x)

# 연산자
# 산술연산자

# value %in% x
1 %in% c(1,2,3)

a<-c(1,2,3)

a+3

v1<-c(33,-5,20:33,12,-2:3)
v1

# 3,4,5, 9,10,11,12, -3,-2,-1,0,1,2,3
v2<-c(3:5,9:12,-3:3)
v2

v3<-c("홍길동","이순신","유관순")
v3

v4<-c(33,12,5,7,"4")
v4

sum(v4)
is.vector(v4)
class(v4)

# 형변환
num<-as.numeric(v4)
num
sum(num)
mode(num)

# 3명의 국어 영어 수학 과학 사회 점수
# hong    90 80 20 80 90
# sejong 100 10 80 90 90
# jang    80 10 30 60 70
# 3개의 벡터를 생성하고 컬럼명을 지정하라!
hong<-c(90,80,20,80,90)
names(hong)<-c("국어","영어","수학","과학","사회")
hong
sejong<-c(100,10,80,90,90)
names(sejong)<-c("국어","영어","수학","과학","사회")
sejong
jang<-c(80,10,30,60,70)
names(jang)<-c("국어","영어","수학","과학","사회")
jang
# 각 학생의 총점과 평균을 구해 출력
sum(hong)
sum(sejong)
sum(jang)
mean(hong)
mean(sejong)
mean(jang)

# list : 서로다른 데이터 구조를 갖는다
# key, value

varList<-NULL

# 1차원 리스트
varList<-list("lee","이순신",c(95,100),"hong","홍길동",85)
varList[3]
varList[2]

#key:value
num2<-list(first=c(1:5),second=c(6:10))
num2
num2$first
num2$second

member1<-list(name="홍길동",age=18,addrs="한양",gender="남자",htype="apt")
member1

# list에서 원소접근 변수$키
# 홍길동의 나이를 출력해보고
member1$age
# 그 나이를 25세로 변경
member1$age<-25
member1

# 뽀로로 정보를 갖는 member2 list 를 만들고
# name, age, addrs, gender, htype
member2<-list(name="뽀로로",age=10,addrs="뽀롱뽀롱동산",gender="남자",htype="단독주택")
member2

# 뽀로로의 이름을 변경 => 핑크퐁
member2$name<-"핑크퐁"
member2

# id=pinkpong
member2$id<-"pinkpong"
member2

member2$pw<-1234
member2

# 원소제거
member2$age<-NULL
member2

# list data 처리 함수

a<-list(c(1:5))
b<-list(6:10)
a
b

# 최소값
x1<-lapply(c(a,b),min) # list로 결과를 반환
x1

# 최대값
x2<-lapply(c(a,b),max)
x2

# 벡터로 넘기려면
x3<-sapply(c(a,b),max)
x3

# 문제
# 1) vec1 벡터변수를 만들고 "R 문자가 5회 반복되도록 출력
vec1<-rep("R",5)
vec1
# 2) vec2 벡터변수에 1~10까지 3간격으로 연속된 정수를 담고 출력
vec2<-seq(1,10,3)
vec2
# 3) vec3 에 1~10까지 3간격으로 연속된 정수가 3회 반복되도록 담고 출력
vec3<-rep(seq(1,10,3),3)
vec3
# 4) vec4 에 vec2~vec3 가 모두 포함되는 벡터를 만드세요.
vec4<-c(vec2,vec3)
vec4
# 5) 25~-15까지 5간간격으로 벡터생성 (단 seq() 함수를 이용)
seq(25,-15,-5)

# 6) vec4에서 홀수번째 값들만 선택하여 vec5에 할당하시오(인덱스이용)
vec5<-vec4[seq(1,length(vec4),2)]
vec5

# 다차원 리스트
multi_list<-list(c1=list(1,2,3),
                 c2=list(10,20,30),
                 c3=list(100,200,300))

# c2의 값을 확인하고 싶다!
multi_list$c2

# 과일과 산지를 묶은 리스트를 만들고 싶다
# multi_fruit
# 사과는 대구, 오렌지는 캘리포니아, 딸기는 논산, 망고는 필리핀
multi_fruit<-list("사과"="대구","오렌지"="캘리포니아","딸기"="논산","망고"="필리핀")
multi_fruit

# 딸기
multi_fruit$딸기

# 망고
multi_fruit$망고

# matrix : 동일 데이터 타입을 갖는 2차원 배열
m1<-matrix(c(1:5))
m1

m2<-matrix(c(1:9),nrow=3)
m2

m3<-matrix(c(1:9),nrow=3,byrow=TRUE)
m3


# m4
#  1 2 3 4 5
#  6 7 8 9 10
# 11       15
# 16       20
# 21       25
m4<-matrix(c(1:25),nrow=5,byrow=TRUE)
m4
# m5
# 1  6 11 16  21
# 2  7 12 17  22
# 3  6 11 16  21
# 4  6 11 16  21
# 5  6 11 16  21
a<-seq(1,25,5)
m5<-matrix(c(a,a+1,a+2,a+3,a+4),nrow=5,byrow=TRUE)
m5

x1<-c(5,4,50:52)
x2<-c(30,5,6:8)

# 두개의 벡터를 하나로 묶는것
mr<-rbind(x1,x2)
mr

# 열끼리 묶기
mc<-cbind(x1,x2)
mc

# 10개의 데이터를 2행으로 생성
# 10~19
m3<-matrix(10:19,2)
m3

# 자료의 객체 type 보기
mode(m3) # [1] "numeric"
class(m3) # [1] "matrix"

# 벡터 4개를 만들고 함수를 사용해서 매트릭스를 생성하고자 한다.

# 100 80 60
# 50  30 10
# 1   2  3
# 95  85 75
vec1<-c(100,80,60)
vec2<-c(50,30,10)
vec3<-c(1,2,3)
vec4<-c(95,85,75)

mr<-rbind(vec1,vec2,vec3,vec4);m4
mr2<-matrix(c(100,80,60,50,30,10,1,2,3,95,85,75),nrow=4,byrow=TRUE)
# 2행2열만 출력
mr2[2,2]

# 라인복사 : shift+alt+아래방향키
# 라인이동 : alt+방향키

# 2행만 출력
mr2[2,]
class(mr2[2,])

# 2열만 출력
mr2[,2]

# 3행 2열의 요소값만 출력
mr2[3,2]

# 3행만 출력
mr2[3,]

# 3행만 제외하고 출력
mr2[-3,]

#2,3행과 1,2열만 출력
mr2[2:3,1:2]
mr2[c(2,3),c(1,2)]

#1,2행과 2,3열만 출력
mr2[1:2,2:3]

x<-matrix(c(1:9),nrow=3,ncol=3)
x

# 데이터의 갯수
length(x)

# 열의 수
ncol(x)

# 행의 수
nrow(x)

# 열의 이름 부여하기
colnames(x)<-c("one","two","three")

# 행의 이름 부여하기
rownames(x)<-c("p1","p2","p3")

x

# 행의 합계
# lapply는 list로 리턴
# sapply는 vector로 리턴
# 형식) apply(변수,행/열,함수명)

# 열의 합계
apply(x,1,max) # 행 단위 최대값
apply(x,2,min) # 열 단위 최소값

# x 매트릭스에서 행단위 합계는?
apply(x,1,sum)

# 1부터 2500까지 값을 갖는 50행 50열 매트릭스 y를 만들고
y<-matrix(c(1:2500),50,byrow=TRUE)
y

# 행 갯수 출력
nrow(y)
# 열 갯수 출력
ncol(y)
# y 20행 25열값 출력
y[20,25]
# 행의 이름 p1~p50
rownames(y)<-c(paste0("p", c(1:50)))

# 열의 이름 q1~q50
colnames(y)<-colnames(y, do.NULL = FALSE, prefix = "q")

# 각 사람별 평균과 합계를 출력(행기준)
apply(y,1,mean)
apply(y,1,sum)

y