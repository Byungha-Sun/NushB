library(KoNLP)
library(stringr)
library(wordcloud)
useSejongDic()

data1 <- readLines('좋아하는과일2.txt')
data1

#1) 중복 값 처리
data1 <- unique(data1)
data1
length(data1)
#2) 특수기호 제거 (replace_all)

data1 <- str_replace_all(data1,'[^[:alnum:][:blank:]]','')
data1
str(data1)

#3)문장을 단어로 구분 (extractNoun)
data2 <- extractNoun(data1)
data2
str(data2)

#4)한 줄에서 중복되는 단어 제거 (lapply)
data3 <- lapply(data2,unique)
data3

#5) Filter 함수 적용해야 하므로 (unlist)
data4 <- unlist(data3)
data4

#6) 불용어 처리 -- 글자수가 1보다 크고 20보다 작은걸로
# Filter 함수 

data5 <- Filter(function(x){nchar(x)>1 & nchar(x)<=20},data4)
data5

#7) 필요없는 단어 수작업으로 제거(gsub)

data5 <- gsub('\\^','',data5)
data5 <- gsub('\\.','',data5)
data5 <- gsub("\\'",'',data5)
# data5 <- gsub('\\ㅋ','',data5)
# data5 <- gsub('\\ㅎ','',data5)
data5

#8)불용어 제거 (미리 만들어놓은 텍스트 파일로)

wordcount <- table(data5)
wordcount
head(sort(wordcount,decreasing = T))

txt <- readLines('nouse_word.txt')
txt
cnt_txt <- length(txt)

for(i in 1:cnt_txt){
    data5 <- gsub((txt[i]),'',data5)
}

data5


#9) "" 제거하기
data5 <- Filter(function(x){nchar(x)>1 & nchar(x)<=20},data5)
data5

wordcount <- sort(table(data5),decreasing = T)
wordcount

#10) wordcloud 그리기

set.seed(1000)
palete <- brewer.pal(9,'Set3')
wordcloud(names(wordcount),
          freq=wordcount,
          scale=c(5,1),
          rot.per=0.5,
          min.freq = 1,
          random.order = F,
          random.color = T,
          colors = palete)




##########제주 여행지
mergeUserDic(data.frame(readLines('제주도여행지.txt'),'ncn'))
data1 <- readLines('jeju.txt')
data1

head(data1,5)

data1 <- unique(data1)

data1 <- extractNoun(data1)

data2 <- lapply(data1,unique)
data2

wordcount <- table(unlist(data2))
wordcount   
