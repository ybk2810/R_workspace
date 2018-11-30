# 멜론에서 가사 추출하기
install.packages("xml2")
install.packages("rvest")

library(xml2)
library(rvest)

url <- "https://music.naver.com/lyric/index.nhn?trackId=22205276"
url

song <- read_html(url)
song

download.file(url,destfile = "song.html", quiet = T)

song <- read_html("song.html")
song

songNode <- html_node(song,"#lyricText")
songNode

Lyrics <- html_text(songNode)
Lyrics


# ---------------------------------------------------------------------
# 
kbreport <- read_html("http://www.kbreport.com/player/detail/456")
kbreport
str(kbreport)

# 경기 : #p1 > div > div.scrollable > table > tbody > tr:nth-child(2) > td:nth-child(3)
# 전체 년도 경기수
play_cnt_nodes <- html_nodes(kbreport,'#p1 td:nth-child(3)')
play_cnt_nodes

play_cnt <- html_text(play_cnt_nodes)
play_cnt

play_cnt <- as.numeric(play_cnt)
play_cnt

# 연도값
# #p1 td:nth-child(1)


season_nodes <- html_nodes(kbreport,'#p1 td:nth-child(1)')

season <- html_text(season_nodes)
season
season <- as.numeric(season)
season

df <- data.frame(season, play_cnt)
df

# 간단한 시각화
plot(df$season,df$play_cnt)

# ops 가져오기
ops_nodes <- html_nodes(kbreport,'#p1 td:nth-child(17)')

ops <- html_text(ops_nodes)
ops
ops <- as.numeric(ops)
ops

# df에 추가
df$ops <- ops
df

# ------------------------------------------------------------------------
# 데이터 마이닝
# 대량의 데이터로 부터 과거에 알려져 있지 않은 유용한 정보를 발견하는 기술

install.packages("rJava")

update.packages("rJava")
install.packages(c("KoNLP","tm","wordcloud"))
library(rJava)
library(KoNLP)
library(NLP)
library(tm)
library(RColorBrewer)
library(wordcloud)

useSejongDic()

# 사전에 추가할 단어
mergeUserDic(data.frame("대한민국","ncn"))

txt <- readLines("815.txt")
txt

nouns <- sapply(txt,extractNoun, USE.NAMES = F)
nouns
str(nouns)

txt2 <- "아버지가 방에 빨리 빨리 들어가신다"
txt2

# 이 함수 하나로 사전의 단어와 비교하여 명사만 추출한다.
extractNoun(txt2)

# ---------------------------------------------------------------------
head(unlist(nouns),20)

# 위의 결과에서 의미없는 단어들을 분류
nouns <- unlist(nouns)

# 2글자 이상의 단어만 선별
# 한 것 음 별 해 등등..


nouns<-gsub("\\d+",'', nouns)
nouns<-gsub("위협",'', nouns)
nouns<-gsub(" ",'', nouns)
nouns<-gsub("",'', nouns)
nouns<-gsub("것",'', nouns)
nouns<-gsub("때문",'', nouns)

nouns[nchar(nouns)>=2]
# 파일저장
write(unlist(nouns),'new815.txt')

data<-read.table("new815.txt")
data
str(data)

nrow(data)
wordcount <- table(data)
wordcount

wordcount <- head(sort(wordcount,decreasing = T),50)

# 색상표
library(RColorBrewer)
pal <- brewer.pal(12,"Paired")
wordcloud(names(wordcount),
          freq=wordcount,
          colors=pal,
          min.freq = 3,
          rot.per = 0.1,
          random.order = F)


# ---------------------------------------------------------------------

# 오라클에 연결하기
# RJDBC
sessionInfo()

Sys.getenv()

install.packages("RJDBC")
library(RJDBC)

# 드라이버 클래스명과 driver 위치를 지정
drv <- JDBC("oracle.jdbc.driver.OracleDriver",
classPath <- "C:/app/acorn/product/11.2.0/dbhome_1/jdbc/lib/ojdbc6.jar")
# \\ 으로 쓰던지 / 로 써야 인식가능!
url <- "jdbc:oracle:thin:@192.168.0.206:1521:orcl"
username <- "scott"
password <- "tiger"

conn <- dbConnect(drv,url,username,password)
conn

d <- dbReadTable(conn,"DEPT")
d

str(d)

# 다른 테이블로 저장
dbWriteTable(conn,"DEPT89",d)

# d ==> db.csv 저장
write.csv(d, file="db.csv", fileEncoding = "UTF-8", row.names = F)

# 10 번
dept10 <- dbGetQuery(conn,"SELECT * FROM dept WHERE DEPTNO = 10")
dept10
str(d)

dbDisconnect(conn)

# 부서번호별 job별 평균급여를 구해

# df : dataFrame 객체를 생성

# 자신의 db에 dfxx라는 테이블 생성

# df.csv 파일생성

# 자원정리

drv <- JDBC("oracle.jdbc.driver.OracleDriver",
classPath <- "C:/app/acorn/product/11.2.0/dbhome_1/jdbc/lib/ojdbc6.jar")
url <- "jdbc:oracle:thin:@192.168.0.118:1521:orcl"
url <- "jdbc:oracle:thin:@localhost:1521:orcl"
username <- "scott"
password <- "tiger"

conn <- dbConnect(drv,url,username,password)
conn

emp <- dbReadTable(conn,"EMP")
emp

df <- dbGetQuery(conn, "SELECT DEPTNO, JOB, AVG(SAL) avgsal FROM emp GROUP by deptno, job")
df

str(df)

dbWriteTable(conn,"df89",df)

write.csv(df, file="df.csv", fileEncoding = "UTF-8", row.names = F)

dbDisconnect(conn)

# -------------------------------------------------------------------------------------
# hw1.
# iris
# db에 저장
# df2 : data.frame
# 꽃의 빈도 : pie
# -------------------------------------------------------------------------------------
library(psych)
head(iris)

drv <- JDBC("oracle.jdbc.driver.OracleDriver",
            classPath <- "C:/app/acorn/product/11.2.0/dbhome_1/jdbc/lib/ojdbc6.jar")
url <- "jdbc:oracle:thin:@192.168.0.118:1521:orcl"
url <- "jdbc:oracle:thin:@localhost:1521:orcl"
username <- "scott"
password <- "tiger"

conn <- dbConnect(drv,url,username,password)
conn
df2<-as.data.frame(iris)

names(df2)<-c("SepalLength","SepalWidth","PetalLength","PetalWidth","Species")

dbWriteTable(conn,"df2",df2)
pie(table(df2$Species))



# Mysql db에 연결하기
drv <- JDBC("com.mysql.jdbc.Driver",
            "C:/libs/mysql-connector-java-5.1.47-bin.jar")
url <- "jdbc:mysql://192.168.0.206/testdb"
username <- "scott"
password <- "tiger"

conn2 <- dbConnect(drv,url,username,password)
conn2

k <- dbGetQuery(conn2,"SELECT * FROM dept ")
k

#-----------------------------------------------------------------------------------------
# 인터넷 기사 혹은 노래가사를 구해서 data.txt 파일을 생성
# 텍스트 마이닝) 상위 빈도 20개만 구해서 워드 클라우드를 그려보자!

mmac <- readLines("mmac.txt")
mmac

nouns2 <- sapply(mmac,extractNoun, USE.NAMES = F)
nouns2
str(nouns2)

extractNoun(mmac)

head(unlist(nouns2),20)

nouns2 <- unlist(nouns2)

nouns2[nchar(nouns2)>=2]



write(unlist(nouns2),'newmmac.txt')

data2<-read.table("newmmac.txt")
data2
str(data2)

nrow(data2)
wordcount2 <- table(data2)
wordcount2

wordcount2 <- head(sort(wordcount2,decreasing = T),20)

library(RColorBrewer)
pal <- brewer.pal(12,"Paired")
wordcloud(names(wordcount2),
          freq=wordcount,
          colors=pal,
          min.freq = 3,
          rot.per = 0.1,
          random.order = F)

word_df2 <- data.frame(wordcount2)
word_df2
library(dplyr)
word_df2 <- word_df2 %>% arrange(desc(word_df2$Freq))
word_df2


topword2 <- head(word_df2,10)

pie(topword2$Freq, topword2$data2,
    col=rainbow(10),radius=1)

# 빈도수 백분율 적용
ptc2 <- round(topword2$Freq/sum(topword2$Freq)*100,1)
ptc2


# 단어랑 백분율을 하나로 합친다
# 우리 21.6%
lab <- paste(topword2$data2,"\n",ptc2,"%")

pie(topword2$Freq, col=rainbow(10),
    cex=0.8, main="어디에도 가사", labels=lab)

# 모양내기
par(new=T)
pie(topword2$Freq,
    radius = 0.6,
    col = "white",
    labels = NA, border = NA)



#-----------------------------------------------------------------------------------------
# 상위 10개 토픽 추출
str(wordcount)
word_df <- data.frame(wordcount)
word_df

# 정렬
library(dplyr)
word_df <- word_df %>% arrange(desc(word_df$Freq))
word_df

# 한 ???

topword <- head(word_df,11)

topword <- topword[-1,]
topword

pie(topword$Freq, topword$data,
    col=rainbow(10),radius=1)

# 빈도수 백분율 적용
ptc <- round(topword$Freq/sum(topword$Freq)*100,1)
ptc


# 단어랑 백분율을 하나로 합친다
# 우리 21.6%
lab <- paste(topword$data,"\n",ptc,"%")

pie(topword$Freq, col=rainbow(10),
    cex=0.8, main="8.15 경축사", labels=lab)

# 모양내기
par(new=T)
pie(topword$Freq,
    radius = 0.6,
    col = "white",
    labels = NA, border = NA)




















