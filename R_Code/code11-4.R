#------------------------------------------#
# 빅데이타 분석∙시각화 with R
#------------------------------------------#

#------------------------------------------#
# 텍스트 마이닝(분석) - code11-3
#------------------------------------------#

#------------------------------------------#
# KoNLP 패키지의 딕셔너리에  사용자 단어 추가하기
#------------------------------------------#

library(KoNLP)
useSejongDic()

# 라이브러리 경로 확인
.libPaths()

# buildDictionary() 함수 : 딕셔너리에 사용자 단어 추가    
#1) 추가할 단어를 벡터로 만들어 추가하기
txt1 <- "우리는 유관순 의사와 안중근 의사가 독립투사임을 반드시 기억합시다"
extractNoun(txt1)

# 추가할 단어를 벡터로 생성
add_words <- c("유관순", "안중근")

# 사전에 사용자 단어 추가
buildDictionary(user_dic=data.frame(add_words, 
                          rep("ncn", length(add_words))),
                replace_usr_dic = TRUE)

# 단어 추가 후 다시 extractNoun() 수행
extractNoun(txt1)

# 2) 사전에 추가해야 할 내용이 많을 경우 
#    -> 추가할 단어를 파일에 저장한 후 함수 적용


# 단어가 저장된 파일 생성 후 불러오기
txt1 <- "우리는 강감찬과 정몽주 선생을 기억합시다"
extractNoun(txt1)

setwd("c:/RStudy/data")
add_file <- readLines("mergefile.txt")
add_file
length(add_file)

# 사전에 사용자 단어 추가
buildDictionary(user_dic = data.frame(add_file, 
                            rep("ncn", length(add_file))),
                replace_usr_dic = TRUE)

# 단어 추가 후 다시 extractNoun() 실행
extractNoun(txt1)

#------------------------------------------#
# KoNLP 패키지로 한글 분석하는 종합 정리 
#------------------------------------------#

#Step 1. 작업디렉토리 설정하고 필요한 패키지를 설치 및 구동합니다 
setwd("c:/RStudy/data")
#install.packages("wordcloud") 
#install.packages("stringr")

library(KoNLP)  
library(wordcloud)
library(stringr)

useSejongDic()

#Step 2. 분석할 파일을 불러옵니다
setwd("c:/RStudy/data")
data1 <- readLines("좋아하는과일2.txt") 
data1
length(data1) #8

#Step 3. 중복되는 리뷰를 제거해야 할 경우 아래 명령을 수행합니다. 
data1 <- unique(data1) 
data1
length(data1) #7

#Step 4. 특수 기호를 모두 제거합니다.
data1 <- str_replace_all(data1,"[^[:alpha:][:blank:]]","")
data1
class(data1)

#Step 5. 아래 과정이 불러온 리뷰 문장을 단어로 분리하는 과정입니다.
data2 <- extractNoun(data1)
data2
class(data2)

#Step 6. 한 줄 안에서 중복되는 단어를 제거해야 할 경우 아래의 명령을 수행합니다.
data2 <- lapply(data2, unique)
data2


#Step 7. 띄어 쓰기가 안되어 있는 긴 문장(단어)을 제거해야 할 경우 아래 명령을 수행합니다.
# 이 작업을 하는 명령어는 Filter( ) 함수인데 벡터로 데이터를 넣아야 합니다.
# 그래서 unlist( ) 함수로 list( ) 형태의 데이터를 벡터 형태로 변형해야 합니다.

data3 <- unlist(data2)
data3
#head(data3,5)

data4 <- Filter(function(x) {nchar(x) <= 10 &
                        nchar(x) > 1} , data3)
data4

#Step 8. 아래 과정이 필요 없는 단어들이나 기호를 제거하는 과정입니다.
data4 <- gsub("\\.","",data4)  # 마침표 제거
data4 <- gsub("\\' ","",data4) # 홑따옴표 제거
data4 <- gsub("\\^","",data4)  # 캐럿기호 제거
data4


#Step 9. 추출된 키워드를 임시로 확인하기 위해 집계해 봅니다.
wordcount <- table(data4) 
wordcount 
head(sort(wordcount, decreasing=T),20)

txt <- readLines("과일gsub.txt")
txt
length(txt)

cnt_txt <- length(txt)
cnt_txt

for( i in 1:cnt_txt) {
    data4 <- gsub((txt[i]),"",data4)     
}
data4

# 위 작업을 하고 나서 삭제된 공백이나 1글자 이하의 글자를 제거하기 위해 아래 명령을 
# 수행합니다.
data4 <- Filter(function(x) 
  {nchar(x) <= 10 & nchar(x) > 1}, data4)
data4

#Step 10. 최종 결과를 집계하여 워드 클라우드로 시각화 합니다.
wordcount <- table(data4) 
wordcount 
head(sort(wordcount, decreasing=T),10)
class(wordcount)
str(wordcount)
names(wordcount)

# 워드클라이드
palete <- brewer.pal(9,"Set3") 

set.seed(1000)
wordcloud(names(wordcount),
          freq=wordcount,
          scale=c(5,1),
          rot.per=0.5,
          min.freq=1,
          random.order=F,
          random.color=T,
          colors=palete)

#------------------------------------------#
# 제주 여행지 추천 키워드 분석하기 
#------------------------------------------#
#Step 1. 필요한 패키지 설치 및 실행
setwd("c:/Rstudy/data") 
getwd()
#install.packages("KoNLP") 
#install.packages("wordcloud") 
#install.packages("stringr")	# <- 패키지를 설치합니다

library(KoNLP)  
library(wordcloud)
library(stringr)      # 패키지를 로딩합니다

#Step 2. 사전 관련 작업
useSejongDic() 

# 위 사전에 제주도 관광지명이 정확하게 안 들어 있기 때문에 아래와 같이 수동으로 추가합니다.
mergeUserDic(data.frame(
  readLines("제주도여행지.txt"), "ncn"))

#Step 3. 분석할 파일을 불러와서 txt 변수에 저장합니다.
txt <- readLines("jeju.txt")  # 인코딩 오류 날 경우 encoding=”UTF-8” 사용하세요
head(txt,5)  # 반드시 잘 불러왔는지 확인 하세요

#Step 4.중복되는 행 제거하기
txt2 <- unique(txt)

#Step 5. 명사만 추출합니다
place1 <- extractNoun(txt2)
head(place1,5)

place2 <- lapply(place1, unique) # 1 줄안에서 중복되는 단어 제거하기 

#Step 6. 불용어를 찾기 위해서 현재 상태의 단어 중 많이 언급된 순서로 100개 출력확인
wordcount <- table(unlist(place2)) 
head(sort(wordcount, decreasing=T),100)

#Step 7. 불용어 제거하기
cdata <- unlist(place2) 
place3 <- str_replace_all(cdata,"[^[:alpha:][:blank:] ]","")
place3 
place3 <- gsub("랜드","", place3)
place3 <- gsub("폭포","", place3)
place3 <- gsub("주도","", place3)
place3 <- gsub("이곳","", place3)
place3 <- gsub("구석","", place3)
place3 <- gsub("생각","", place3)

place3 <- gsub("애월","애월읍", place3)
place3 <- gsub("정상","수월봉", place3)
place3 <- gsub("에코","에코랜드", place3) 
place3 <- gsub("퍼시픽","퍼시픽랜드", place3) 

place3 <- gsub(paste(c("성산","일출"),collapse='|'), "성산일출봉", place3)
place3 <- gsub(paste(c("한라","한라산"),collapse='|'), "한라산", place3)
place3 <- gsub(paste(c("산방","산방산"),collapse='|'), "산방산", place3)
place3 <- gsub(paste(c("녹차","오설록"),collapse='|'), "오설록", place3)
place3 <- gsub(paste(c("천지","지연","천지연폭포"),collapse='|'), "천지연폭포", place3)
place3 <- gsub(paste(c("주상","절리","주상절리"),collapse='|'), "주상절리", place3)
place3 <- gsub(paste(c("만장","만장굴"),collapse='|'), "만장굴", place3)

wordcount2 <- table(place3 ) 
head(sort(wordcount2, decreasing=T),100)

#불용어가 많을 경우 아래와 같이 제거합니다
txt <- readLines("제주도여행코스gsub.txt")
txt

cnt_txt <- length(txt)
cnt_txt

for( i in 1:cnt_txt) {
    place3 <-gsub((txt[i]),"",place3)     
}

place4 <- Filter(function(x) {nchar(x) >= 2 & nchar(x) <= 10} ,place3)

wordcount3 <- table(place4) 
head(sort(wordcount3, decreasing=T),30)
#Sys.sleep(3)

# Step 8. 추출된 단어들을 워드 클라우드로 시각화 하기
plot.new()
palete <- brewer.pal(7,"Set1") 
wordcloud(names(wordcount3),
          freq=wordcount3,
          scale=c(5,1),
          rot.per=0.25,min.freq=4,
          random.order=F,
          random.color=T,
          colors=palete)

#참고 : Step 9. wordcloud2 ( ) 패키지로 시각화 하기
#install.packages("wordcloud2")
library(wordcloud2)
wordcount4 <- head(sort(wordcount3, 
                        decreasing=T),100)
wordcloud2(wordcount4,gridSize=1,size=0.5,
           shape="star")

# 빅데이터 분석실무 실기시험 응시하신 분들은 아래 과정을 추가로 진행하세요.

# 아래 과정으로 생성된 본인의수험번호.csv 파일을 실기 과제물_1 로 제출해야 합니다.
# 아래의 파일들은 모두 작업 디렉토리에 저장됩니다

getwd()  #  작업 디렉토리 확인하기
setwd("c:/Rstudy/data")
data11 <- head(sort(wordcount3, decreasing=T),40)
write.csv(data11 , '본인의수험번호.csv')

#아래 과정으로 생성된 본인의 수험번호.png 파일을 실기 과제물_2 로 제출해야 합니다. 
# RStudio에서는 Export-Save as Images.. 메뉴 사용 
savePlot('본인의수험번호.png' , type='png')

#글자색 지정하기
palete <- brewer.pal(9, "Blues")[5:9] 
set.seed(1234)
wordcloud(names(wordcount3),
          freq=wordcount3,
          scale=c(5,1),
          rot.per=0.25,
          min.freq=4,
          random.order=F,
          random.color=T,
          colors=palete)

#Sys.sleep(3)
palete <- brewer.pal(9, "Greens")[5:9] 
set.seed(1234)
wordcloud(names(wordcount3),
          freq=wordcount3,
          scale=c(5,1),
          rot.per=0.25,min.freq=4,
          random.order=F,
          random.color=T,
          colors=palete)



# 상위 100개 추출
wordcount <- table(unlist(txt5)) 
top100 <- head(sort(wordcount, decreasing=T),200)

wordcloud2(top100, fontFamily='Noto Sans CJK KR Bold', color='skyblue', minRotation=0, maxRotation=0)
Sys.sleep(3)

# or a vector of colors. vector must be same length than input data
wordcloud2(top100, size=1.0, color=rep_len( c("green","blue"), nrow(top100) ) )
Sys.sleep(3)

# Gives a proposed palette
wordcloud2(top100, size=1.0, color='random-dark')
Sys.sleep(3)

# Change the background color
wordcloud2(top100, size=1.0, color='random-light', backgroundColor="black")
Sys.sleep(3)

# Change the shape: 'circle’(default), ‘cardioid’, ‘diamond’ (alias of square), ‘triangle-forward’, ‘triangle’, ‘pentagon’, and ‘star’
wordcloud2(top100, size = 0.7, shape = 'star')

#---------------------------------------------#
# 영어 텍스트 분석하기 - tm( ) 패키지 사용하기
#---------------------------------------------#
#Step 1. 작업 디렉토리 지정
setwd("c:/Rstudy/data")

#Step 2.필요한 패키지를 설치합니다. 
# install.packages("wordcloud")
library("wordcloud")

# install.packages("tm")
library("tm")

#Step 3.데이터를 불러 옵니다.
data1 <- readLines("tm_test11.txt")
data1

#Step 4. Corpus (말뭉치) 형태로 변환합니다.
corp1 <- VCorpus(VectorSource(data1))
corp1                                

inspect(corp1) # corpus 안의 내용 살펴보기

# Step 5. tm 패키지가 분석 할 수 있는 Term-Document 형식의 Matrix 로 변환합니다.
tdm <- TermDocumentMatrix(corp1)
tdm

#Step 6. 일반적으로 사용되는 Matrix 로 변환합니다.
m <- as.matrix(tdm)
m

#Step 7. 불용어와 기호, 공백등을 제거합니다.
corp2 <- tm_map(corp1,stripWhitespace) # 여러 개의 공백을 하나의 공백으로 변환합니다
corp2 <- tm_map(corp2,tolower) # 대문자가 있을 경우 소문자로 변환합니다

corp2 <- tm_map(corp2,removeNumbers) # 숫자를 제거합니다
corp2 <- tm_map(corp2,removePunctuation)  # 마침표,콤마,세미콜론,콜론 등의 문자 제거
corp2 <- tm_map(corp2,PlainTextDocument)  
stopwords('en')
sword2 <- c(stopwords('en'),"and","but","not")# 기본 불용어 외 불용어로 쓸 단어 추가하기
corp2 <- tm_map(corp2,removeWords,sword2) # 불용어 제거하기 (전치사 , 관사 등)

#Step 8. 불용어나 공백 등이 제거된 후 다시 Term-Document Matrix 를 생성 후 확인합니다
tdm2 <- TermDocumentMatrix(corp2)
tdm2

m2 <- as.matrix(tdm2)
m2


colnames(m2) <- c(1:4)
m2

#Step 9. 추가로 발견된 불용어 제거하기
slist <- readLines("stopword_list.txt") # 불용어 리스트를 불러 옵니다
sword3 <- c(stopwords('en'),slist) # 기본 불용어 외 불용어로 쓸 단어 추가하기
corp2 <- tm_map(corp2,removeWords,sword3)
tdm2 <- TermDocumentMatrix(corp2)
tdm2

m2 <- as.matrix(tdm2)
colnames(m2) <- c(1:4)
m2


#Step 10. 추출된 단어를 빈도별로 집계하기
freq1 <- sort(rowSums(m2),decreasing=T)
head(freq1,20)

freq2 <- sort(colSums(m2),decreasing=T)
head(freq2,20)

#tdm 활용

findFreqTerms(tdm2,2)  #2) 2번 이상 조회
findAssocs(tdm2,"apple",0.5) #3) 3번 이상 조회
#apple과 50% 관련이 있는 단어
findAssocs(tdm2,"apple",0.6)

# Step 11. 집계된 내용을 워드 클라우드로 표현합니다.
library(RColorBrewer) 
palete <- brewer.pal(7,"Set3")
wordcloud(names(freq1) , freq=freq1 , scale=c(5,1) , min.freq=1 , rot.per=0.5 , 
          colors=palete , random.order=F , random.color=T)


#------------------------------------------#
# 도널드 트럼프 미국 대통령 연설문 분석하기 - tm( ) 패키지 활용 
#------------------------------------------#
setwd("c:/Rstudy/data")

data1 <- readLines("trumph.txt")
head(data1,10)

corp1 <- VCorpus(VectorSource(data1)) # 말뭉치로 변환하기
corp1

inspect(head(corp1,5)) 

corp2 <- tm_map(corp1,stripWhitespace) # 여러개의 공백을 하나의 공백으로 변환합니다
corp2 <- tm_map(corp2,tolower) # 대문자가 있을 경우 소문자로 변환합니다
corp2 <- tm_map(corp2,removeNumbers) # 숫자를 제거합니다
corp2 <- tm_map(corp2,removePunctuation) # 마침표,콤마,세미콜론,콜론 등 문자 제거합니다
corp2 <- tm_map(corp2,PlainTextDocument)  
stopword2 <- c(stopwords('en'),"and","but") # 기본 불용어 외에 불용어로 쓸 단어 추가하기
corp2 <- tm_map(corp2,removeWords,stopword2) # 불용어 제거하기 (전치사 , 관사 등)

corp3 <- TermDocumentMatrix(corp2,control=list(wordLengths=c(1,Inf)))
corp3

findFreqTerms(corp3,10) 
findAssocs(corp3,"america",0.5) 

corp4 <- as.matrix(corp3)
head(corp4,5)

freq1 <- sort(rowSums(corp4),decreasing=T)
head(freq1,5)

library(RColorBrewer) 
palete <- brewer.pal(7,"Set3")
wordcloud(names(freq1),freq=freq1,scale=c(5,1),min.freq=3,colors=palete,random.order=F,
          random.color=T)


#tdm 확인
t(m2)

#두 행렬을 곱하여 인접행렬을 생성
adjmatrix <- m2%*% t(m2)
adjmatrix

#igraph
library(igraph)
g1 <- graph.adjacency(adjmatrix,
                      weighted=T,
                      mode='undirected')
g1
plot(g1)

4015.2/(4015.2-3162.7) 
0