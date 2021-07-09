getwd()
setwd('c:/Rstudy/data')

#1) 데이타 읽어오기

exam <- read.csv('csv_exam.csv')


#2) 데이타 파악하기
head(exam)
head(exam,10)

tail(exam)
exam

View(exam)
dim(exam)
str(exam)
summary(exam)


head(iris)
str(iris)
summary(iris)



####  MPG 데이타 파악하기

library(ggplot2)

#1) ggplot2의 mpg 데이터를 데이터프레임 형태로 가져오기

mpg <- as.data.frame(ggplot2::mpg)  ##(::) library와 똑같은 역할!

class(mpg)

#3) mpg 데이타 파악하기

?mpg
head(mpg)
tail(mpg)
View(mpg)
dim(mpg)
str(mpg)
summary(mpg)


##데이타 핸들링

data('diamonds')

nrow(diamonds)
ncol(diamonds)
row.names(diamonds)
rownames(diamonds)
colnames(diamonds)
names(diamonds)
dim(diamonds)
str(diamonds)
summary(diamonds)

##데이타 열 추출하기
diamonds[,1]
class(diamonds[0,1])

#2) 두 개 이상의 열 추출
diamonds[,1:3]
diamonds[,c(1,3,4)]

#2-3) 컬럼의 변수명을 알고 있는 경우
diamonds[,c('x','y','z')]

#2-4) 특정한 문자가 컬럼이름에 들어간 컬럼 추출

colnames(diamonds)
diamonds[,grep('a',colnames(diamonds))]


#2-5) 컬럼이름 중 일부의 문자 추출

substr(colnames(diamonds),start=1,stop=2)

#2-6) 컬럼이름 중 일부 문자 추출것과 일치한 컬럼 찾기

# diamonds[, substr(colnames(diamonds),start=1,stop=1)]
diamonds[,substr(colnames(diamonds),start=1,stop=2)=='co']


#3) 행 추출하기
#cut이 good인 것만 추출하기

diamonds[diamonds$cut =='Good',]
subset(diamonds,cut =='Good' )

#가격이 1000달러 이상인 다이아몬드만

diamonds[diamonds$price>=10000,]

#sort() 함수

age=c(32,27,40,15)
sort(age)
sort(age,decreasing = TRUE)


##order() 함수

order(age)
age[order(age)]

#diamonds의 price 변수를 이용하여 오름차순 또는 내림차순

order(diamonds$price)
diamonds[order(diamonds$price),]


diamonds[order(diamonds$cut,diamonds$price),]

diamonds[order(diamonds$cut,diamonds$price,decreasing=TRUE),]

#하나는 오름차순 하나는 내림차순으로 정렬하기

diamonds <- as.data.frame(diamonds)
diamonds[order(diamonds$x,-diamonds$y),]


install.packages('data.table')
library(data.table)

##범주형 데이터 떄는 data.table 함수 사용!
#setorder 함수

diamonds_dt = as.data.table(diamonds)
setorder(diamonds_dt, cut, -color)
diamonds_dt


## merge() 함수를 이용
# 4가지 join 방법 : inner join, outer join(full join, left join, right join)

df3=data.frame(id=1:3,
               gender=c('M',"M",'F'))
df4=data.frame(id=c(1,2,4,5),
               age=c(10,20,40,50))


merge(df3,df4,by='id',all=TRUE)


##left 조인
merge(df3,df4,by='id',all.x=TRUE)




##############   데이터 가공      ################


library(dplyr)

# df %>%
#     select ~ %>% 
#     filter ~ %>% 
#     group_by %>% 
#     summarize


