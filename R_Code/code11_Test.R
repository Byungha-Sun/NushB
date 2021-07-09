과자 <- c('새우깡','감자깡600','800양파깡','깡깡이')

과자

# 1)'깡'이 들어간 문자열을 찾아라.

grep('깡',과자,value=TRUE)


#2)숫자가 들어간 문자열을 찾아라.
grep('[0-9]',과자,value=TRUE)

#3)'새우'로 시작하는 문자열
grep('^새우',과자,value=TRUE)

#4) '깡'으로 끝나는 문자열을 찾아라
grep('깡$',과자,value=T)

#5)숫자로 시작하는 문자열을 찾아라
grep('^[0-9]',과자,value=T)

#6)숫자로 시작하지 않는 문자열을 찾아라.

library(stringr)

#1) '새우'를 '보리새우'로 교체하라
gsub('새우','보리새우',과자)
gsub('보리새우','새우',과자)


txt4 <- c('aa.txt','ba.txt','ab.txt','123.txt','cal123.txt')
str_replace(txt4,'a','z')

txt4 <- c('aa.txt','ba.txt','ab.txt','123.txt','cal123.txt')
str_replace_all(txt4,'a','z')


nchar('R 열공중입니다')  ##빈칸 포함

#2) 문자열 연결
paste('010','3333','7777',sep='-')

#3) 문자열 분리
strsplit('010-3333-7777','-')

#4) 연도만 잘라내기
substr('19821030',1,4)

#5) 특정기호로 분리하기
tel <- '010)2090-7929'
strsplit(tel,')')

계급 <- c('원사','하사','중사','하사','중사','원사','하사')
table(계급)

sort(table(계급),decreasing = T)

getwd()
# install.packages('wordcloud')

library(KoNLP)
library(wordcloud)
.libPaths()
useSejongDic()

txt1 <- '우리는 유관순 의사와 안중근 의사가 독립투사임을 반드시 기억합시다'

extractNoun(txt1)

#추가할 단어를 벡터로 생성
add_words <- c('유관순','안중근')

buildDictionary(user_dic = data.frame(add_words,rep('ncn',length(add_words))),replace_usr_dic=TRUE)


data1 <- readLines('좋아하는과일2.txt')
data1
data1 <- unique(data1)
data1

#단어가 저장된 파일 생성 후 불러오기

txt1 <- '우리는 강감찬과 정몽주 선생을 기억합시다'

extractNoun(txt1)


add_file <- readLines('mergefile.txt', encoding = 'UTF-8')
add_file
length(add_file)
buildDictionary(user_dic = data.frame(add_file,rep('ncn',length(add_file))),replace_usr_dic=TRUE)
