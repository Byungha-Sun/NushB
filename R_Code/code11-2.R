#------------------------------------------#
# 빅데이타 분석∙시각화 with R
#------------------------------------------#

#------------------------------------------#
# 텍스트 마이닝(분석) - code11
#------------------------------------------#

# --------------------------------------------------#
#  KoNLP 설치
# ------------------------------------------------- #

# 1. rtools 설치

# 2. java, rJava 설치 
# install.packages("multilinguer")
library(multilinguer)
# install_jdk()


# 3. KoNLP 의존성 패키지 설치
# install.packages(c("hash", "tau", "Sejong", "RSQLite", "devtools", "bit", "rex", "lazyeval", "htmlwidgets", "crosstalk", "promises", "later", "sessioninfo", "xopen", "bit64", "blob", "DBI", "memoise", "plogr", "covr", "DT", "rcmdcheck", "rversions"), type = "binary")

# 4. KoNLP의 github 버전 설치
# install.packages("remotes")
# remotes::install_github('haven-jeon/KoNLP', upgrade = "never", INSTALL_opts=c("--no-multiarch"))  

# install.packages('processx')
# 5. KoNLP 로딩하기
library(KoNLP)

# 6. 사전 설정하기 
useSejongDic() 

#------------------------------------------#
# KoNLP 패키지 설치 테스트
#------------------------------------------#

# 1. 텍스트 입력
text <- "R은 오픈소스로 통계, 기계학습, 금융, 생물정보학, 그래픽스에 이르는 
다양한 통계 패키지를 갖추고 있는 좋은 프로그램이다."

# 2. 명사 추출 - 사전에 등록되어있지 않는 명사들이 분리되서 출력
extractNoun(text)

# 3. 사전에 없는 명사는 사전에 등록하는 작업이 필요함.
buildDictionary(ext_dic = "sejong",
                user_dic = data.frame(c("기계학습","생물정보학",
                                        "다양한","오픈소스"),
                                      c("ncn")),replace_usr_dic=T)

# 4. 명사 추출 다시 실행
extractNoun(text)

#------------------------------------------#
# 단어를 추출하는 방법(strsplit vs extractNoun)
#------------------------------------------#
txt1 <- "Start R Programming."
txt1

# strsplit()을 이용한 단어 추출
strsplit(txt1, " ")

# KoNLP 패키지의 extractNoun() 함수하여 단어 추출 
txt2 <- "R 프로그래밍을 시작하세요"
txt2

# i) strsplit()을 이용한 단어 추출
strsplit(txt2, " ")

# ii) extractNoun() 함수하여 단어 추출
extractNoun(txt2)


#------------------------------------------#
# 비정형 데이타 가져오기
#------------------------------------------#
getwd()
setwd("c:/Rstudy/data")
txt1 <- readLines("구매후기.txt")
txt1

# encoding : utf-8
txt2 <- readLines("구매후기_UTF8.txt", encoding="UTF-8")
txt2

# 비정형 데이타 외부 파일로 쓰기
writeLines(txt1, con=file("c:/Rstudy/data/txt1.txt"))

#------------------------------------------#
# 텍스트 마이닝 - 힙합가사텍스트 마이닝
#------------------------------------------#

#------------------------------------------#
# Step 1) 텍스트 마이닝 준비하기
#------------------------------------------#

#1) 패키지 로드


#2) 사전 설정하기    


#3) 데이터 불러오기

 
# 4) 특수 문자 제거하기 – stringr 패키지의 str_replace_all() 이용
#install.packages("stringr")


#------------------------------------------#
# Step 2) 가장 많이 사용된 단어 알아보기
#------------------------------------------#

#1) 명사 추출하기 – KoNLP 패키지의 extractNoun() 함수 이용


# 2) 각 단어의 빈도 세기 및 데이타프레임으로 변환


# 3) 두 글자 이상으로 된 단어만 추출


# 4) 자주 사용된 단어 빈도표 만들기 – 상위 20개 단어 추출

#------------------------------------------#
# Step 3) 워드 클라우드 만들기
#------------------------------------------#

# 1)  패키지 준비하기 – wordcloud 패키지의 wordcloud()

# 2) 단어 색상 목록 만들기


# 3) 난수 고정하기 
# - 매번 다른 모양의 클라우드 만들지 않으려면 
# - set.seed() 함수로 난수 고정


# 4) 워드 클라우드 만들기


#5) 단어 색상 바꾸기 


#plot.new()

#------------------------------------------#
# ggplot 그래프
#------------------------------------------#
library(ggplot2)
library(foreign)
library(dplyr)

top_10 <- df_word %>%
  arrange(desc(freq)) %>%
  head(10)
top_10 

df <- as.data.frame(top_10, 
                    stringAsFactors=F)

order <- arrange(df, freq)$word  # 빈도 순서 변수 생성
order

ggplot(data = df, aes(x = word, y = freq)) +  
  ylim(0, 90) +
  geom_col(fill=rainbow(10)) + 
  scale_x_discrete(limit = order) +              
  geom_text(aes(label = freq), hjust = +1, vjust= -0.75, size=4, col="red")

#------------------------------------------#
# treemap
#------------------------------------------#
#install.packages("treemap")
library(treemap)

# 최빈도 200 단어 만들기 
top_200 <- df_word %>%
  arrange(desc(freq)) %>%
  head(200)

top_200

mypal = brewer.pal(7,"Set3") # 팔레트 지정

treemap(
  dtf = top_200,
  title = '고빈도 단어 트리맵',
  index = c('word'),
  vSize = 'freq', 
  fontfamily.labels = 'NanumGothic',
  fontsize.labels = 14,
  palette = mypal,
  border.col = 'white')

#-----------------------------------
# wordcloud2 패키지 활용
#-----------------------------------
#install.packages("wordcloud2")
library(wordcloud2)

top_200 <- df_word %>%
  arrange(desc(freq)) %>%
  head(200)

top_200

wordcloud2(top_200,gridSize=1,size=0.5,
           shape="star", 
           color='random-light',
           backgroundColor="black")

wordcloud2(top_200, fontFamily='Noto Sans CJK KR Bold', 
           color='skyblue', minRotation=0, maxRotation=0)
#Sys.sleep(3)

# or a vector of colors. vector must be same length than input data
wordcloud2(top_200, size=1.0, 
           color=rep_len( c("green","blue"), nrow(top_200) ) )
#Sys.sleep(3)

# Gives a proposed palette
wordcloud2(top_200, size=1.0, color='random-dark')
#Sys.sleep(3)

wordcloud2(top_200, size = 0.7, shape = 'triangle-forward')
#Sys.sleep(3)

wordcloud2(
  data = top_200,
  size = 0.5, 
  fontFamily = 'NanumGothic',
  color = pal,
  backgroundColor = 'white',
  shape = 'circle', 
  ellipticity = 0.75, 
  minRotation = -pi / 4,
  maxRotation = pi / 4,
  shuffle = TRUE,
  rotateRatio = 0.25)

#---------------------------
# 색상 관련 함수 
#---------------------------
colors() # 색상이름 보기
# 모든 팔레트 보기
display.brewer.all() 
display.brewer.all(type="all")

# 타입별 팔레트 보기 
display.brewer.all(type="seq")
display.brewer.all(type="div")
display.brewer.all(type="qual")

# 모든 팔레트 정보 보기 
brewer.pal.info

# 특정 팔레트 정보 보기 
brewer.pal.info["Blues",]
brewer.pal.info["Blues",]$maxcolors
brewer.pal.info["Set1",]

# 팔레트 응용 예제 
mypalette<-brewer.pal(7,"Greens")
image(1:7,1,as.matrix(1:7),col=mypalette,xlab="Greens (sequential)",
      ylab="",xaxt="n",yaxt="n",bty="n")

#------------------------------------------#
# KoNLP 패키지의 딕셔너리에  사용자 단어 추가하기
#------------------------------------------#

# buildDictionary() 함수 : 딕셔너리에 사용자 단어 추가    
#1) 추가할 단어를 벡터로 만들어 추가하기
txt1 <- "우리는 유관순 의사와 안중근 의사가 독립투사임을 반드시 기억합시다"


# 추가할 단어를 벡터로 생성


# 사전에 사용자 단어 추가


# 단어 추가 후 다시 extractNoun() 수행


# 2) 사전에 추가해야 할 내용이 많을 경우 
#    -> 추가할 단어를 파일에 저장한 후 함수 적용
setwd("c:/RStudy/data")

# 단어가 저장된 파일 생성 후 불러오기
txt1 <- "우리는 강감찬과 정몽주 선생을 기억합시다"




# 사전에 사용자 단어 추가


# 단어 추가 후 다시 extractNoun() 실행





# --------------------------------------------------------------------#
# 네이버 OPEN API를 활용한 워드클라우드    
#---------------------------------------------------------------------#

# R에서 Open API 네이버 뉴스 검색
install.packages("RCurl")
install.packages("XML")
library(RCurl)
library(XML)

#serachUrl<-"https://openapi.naver.com/v1/search/news.xml"   #뉴스 검색 
serachUrl<-"https://openapi.naver.com/v1/search/blog.xml"  #블로그 검색 

Client_ID<-"d6vBHPaK1CIgYRFI6brJ"
Client_Secret<-"6VLGDJbnkX"

# 검색키워드 설정 
query<-URLencode(iconv("가천대학교", "euc-kr", "UTF-8"))

# 검색 건수 설정 
url<-paste(serachUrl, "?query=", query, "&display=100", sep="")
url

doc <- getURL(url,
              httpheader=c('Content-Type'="application/xml",
                           'X-Naver-Client-Id'=Client_ID,
                           'X-Naver-Client-Secret'=Client_Secret))

doc2<-htmlParse(doc, encoding="UTF-8")

text<-xpathApply(doc2, "//item/description", xmlValue)
text

# 크롤링한 파일 저장하기 
write.table(text, "가천대학교.txt", sep=",",
            row.names=FALSE, quote=FALSE, na="NA")


## 워드 클라우드 그리기 
#install.packages("KoNLP")
#install.packages("RColorBrewer")
#install.packages("wordcloud")
library(KoNLP)
library(RColorBrewer)
library(wordcloud)

#useSejongDic()
useNIADic()

# 파일 불러오기 
#text <- readLines("가천대학교.txt")

# 명사 추출하기 
noun<-sapply(text, extractNoun, USE.NAMES=F)
noun

# 불용어 제거하기 
noun2<-unlist(noun)
noun2 <- gsub("\\.","",noun2) #.
noun2 <- gsub("\\#","",noun2) # 
noun2 <- gsub("\\/","",noun2) # /
noun2 <- gsub("\\-","",noun2) #.
noun2 <- gsub(" ","",noun2) # 공백
noun2 <- gsub("\\'","",noun2) #'
noun2 <- gsub("\\^","",noun2) #^
noun2 <- gsub("\\d+","", noun2) ##  <--- 모든 숫자 없애기
noun2 <- gsub("가천대학교","",noun2)
noun2 <- gsub("^ㅎ","",noun2)
noun2 <- gsub("[\\<b\\>]" , "", noun2)
noun2 <- gsub("quot" , "", noun2)  
noun2 <- gsub("는" , "", noun2)
noun2<-Filter(function(x){nchar(x)>=2 & nchar(x) <= 10 }, noun2)

# 빈도수 세기 
word_count<-table(noun2)
word_count
head(sort(word_count, decreasing=T), 30)


# 워드 클라우드 그리기 
dev.off()
palete<-brewer.pal(8,"Dark2")
wordcloud(names(word_count), freq=word_count, scale=c(8,0.4), min.freq=3,
          random.order=F, rot.per=0.2, colors=palete)


# wordcloud2() 그리기 
#install.packages("wordcloud2")
library(wordcloud2)

wordcount2 <- head(sort(word_count, decreasing=T), 150)
wordcloud2(wordcount2,gridSize=1, fontFamily = "맑은 고딕", size=0.8,shape="circle",            color='random-light', backgroundColor="black")

wordcloud2(wordcount2,gridSize=1,size=0.8,shape="circle", fontFamily = "맑은 고딕")

wordcloud2(wordcount2, fontFamily='Noto Sans CJK KR Bold', color='skyblue', minRotation=0, maxRotation=0)
Sys.sleep(3)

# or a vector of colors. vector must be same length than input data
wordcloud2(wordcount2, size=1.0, color=rep_len( c("green","blue"), nrow(wordcount2) ) )
Sys.sleep(3)

# Gives a proposed palette
wordcloud2(wordcount2, size=1.0, color='random-dark')
Sys.sleep(3)

# Change the background color
wordcloud2(wordcount2, size=1.0, color='random-light', backgroundColor="black")
Sys.sleep(3)

# Change the shape: 'circle’(default), ‘cardioid’, ‘diamond’ (alias of square), ‘triangle-forward’, ‘triangle’, ‘pentagon’, and ‘star’
wordcloud2(wordcount2, size = 0.7, shape = 'star')

# --------------------------------------------------------------------#
# 네이버 OPEN API를 활용한 워드클라우드 - 1000건 데이타 가져오기    
#---------------------------------------------------------------------#
#install.packages("RCurl")
#install.packages("XML")
library(RCurl)
library(XML)

serachUrl<-"https://openapi.naver.com/v1/search/news.xml" #뉴스 검색 
#serachUrl<-"https://openapi.naver.com/v1/search/blog.xml" #블로그 검색 

Client_ID<-"d6vBHPaK1CIgYRFI6brJ"
Client_Secret<-"6VLGDJbnkX"

# url로 소스 가져오기 
get_api_result <- function(keyword, display, start) {
  
  query<-URLencode(iconv(keyword, "euc-kr", "UTF-8"))
  url<-paste(serachUrl, "?query=", query, "&display=", display, 
             "&start=", start, sep="")
  
  doc <- getURL(url,
                httpheader=c('Content-Type'="application/xml",
                             'X-Naver-Client-Id'=Client_ID,
                             'X-Naver-Client-Secret'=Client_Secret))
  doc2<-htmlParse(doc, encoding="UTF-8")
  return(doc2)
}

# 100건 단위로get_api_result 함수 호출하기 
call_and_print <- function(keyword, page){
  doc_rtn <- get_api_result(keyword, 100, page)
  text_rtn <- xpathApply(doc_rtn, "//item/description", xmlValue)
  #print(text_rtn)
  write.table(text_rtn, file="크롤링전체결과.txt", 
              append = T, sep=',', row.names=F, col.names=F )
}

# 1000건 - 크롤링을 원하는 건수 가져오기  
call_total <- function(total_cnt) {
  for(i in seq(from=1, to = total_cnt, by = 100)) {
    call_and_print(keyword, i)
  }
}

display = 0
start = 0
keyword <- "가천대학교"

# 크롤링 원하는 총 건수 입력하기
call_total(300)

# 크롤링 전체 결과 파일 -> "크롤링전체결과.txt"에 저장됨
write.table(text, "가천대학교.txt", sep=",",
            row.names=FALSE, quote=FALSE, na="NA")

#-----------------------------------
# 워드 클라우드 그리기 
#-----------------------------------
#install.packages("KoNLP")
#install.packages("RColorBrewer")
#install.packages("wordcloud")
library(KoNLP)
library(RColorBrewer)
library(wordcloud)

#useSejongDic()
useNIADic()

# 파일 불러오기 
#text <- readLines("가천대학교.txt")
head(text)
txt <- str_replace_all(text, "\\W", " ")  # \\W : 단어가 아닌 것 
txt <- str_replace_all(txt, "b", "") 
txt <- str_replace_all(txt, "quot", "") 
txt
class(txt)
# 명사 추출하기
txt2 <- extractNoun(txt)
noun <-sapply(txt2, extractNoun, USE.NAMES=F)
head(noun)

# 불용어 제거하기 

text2 <- str_replace_all(text,"[^[:alpha:][:blank:]]","")
noun2<-unlist(noun)
noun2 <- gsub("\\.","",noun2) #.
noun2 <- gsub("\\#","",noun2) # 
noun2 <- gsub("\\/","",noun2) # /
noun2 <- gsub("\\-","",noun2) #.
noun2 <- gsub(" ","",noun2) # 공백
noun2 <- gsub("\\'","",noun2) #'
noun2 <- gsub("\\^","",noun2) #^
noun2 <- gsub("\\d+","", noun2) ##  <--- 모든 숫자 없애기
noun2 <- gsub("가천대학교","",noun2)
noun2 <- gsub("^ㅎ","",noun2)
noun2 <- gsub("[\\<b\\>]" , "", noun2)
noun2 <- gsub("quot" , "", noun2)  
noun2 <- gsub("는" , "", noun2)
noun2 <- gsub("대학" , "", noun2)
noun2<-Filter(function(x){nchar(x)>=2 & nchar(x) <= 10 }, noun2)

# 빈도수 세기 
word_count<-table(noun2)
word_count
head(sort(word_count, decreasing=T), 30)

# 워드 클라우드 그리기 
palete<-brewer.pal(8,"Dark2")
wordcloud(names(word_count), freq=word_count, scale=c(7,0.4), min.freq=3,
          random.order=F, rot.per=0.2, colors=palete)

# wordcloud2() 그리기 
#install.packages("wordcloud2")
library(wordcloud2)

wordcloud2(word_count)

wordcloud2(word_count, shape = 'star')

wordcloud2(word_count, minRotation = pi/4, maxRotation = pi/4, rotateRatio = 1.0)

wordcloud2(word_count,gridSize=1, fontFamily = "맑은 고딕", size=0.8,shape="circle",            color='random-light', backgroundColor="black")
Sys.sleep(3)
wordcloud2(word_count,gridSize=1,size=0.8,shape="circle", fontFamily = "맑은 고딕")
Sys.sleep(3)
wordcloud2(word_count, fontFamily='Noto Sans CJK KR Bold', color='skyblue', minRotation=0, maxRotation=0)


# or a vector of colors. vector must be same length than input data
wordcloud2(word_count, size=1.0, color=rep_len( c("green","blue"), nrow(wordcount2) ) )
Sys.sleep(3)

# Gives a proposed palette
wordcloud2(word_count, size=1.0, color='random-dark')
Sys.sleep(3)

# Change the background color
wordcloud2(word_count, size=1.0, color='random-light', backgroundColor="black")
Sys.sleep(3)

# Change the shape: 'circle’(default), ‘cardioid’, ‘diamond’ (alias of square), ‘triangle-forward’, ‘triangle’, ‘pentagon’, and ‘star’
wordcloud2(word_count, size = 0.7, shape = 'star')

pal = brewer.pal(11,"Spectral")
wordcloud2(
  data = word_count,
  size = 0.9, 
  fontFamily = 'NanumGothic',
  color = pal,
  backgroundColor = 'white',
  shape = 'circle', 
  ellipticity = 0.75, 
  minRotation = -pi / 4,
  maxRotation = pi / 4,
  shuffle = TRUE,
  rotateRatio = 0.25)






