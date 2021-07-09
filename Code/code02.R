###벡터 생성 1 - C() 사용

v1<-c(3,10,12)
v1

v2<-c('kim','lee','park')
v2

v3<-c(TRUE,FALSE,FALSE,FALSE)
v3

v4<-c(3,'kim')
v4

class(v1)
class(v2)
class(v3)
class(V4)

#####벡터들을 합쳐서 새로운 벡터 생성

v1<-c(1,3,5)
v2<-c(10,30,50)
v3<-c(v1,v2)


#### 벡터의 인덱싱(indexing)

v3[1]
v3[6]

v3[2,5]
v3[c(2,5)]


v3

v4 <- v3[c(1,3,5)]

##벡터생성 2- ' start : end ' 사용

v1 <- 1:5
v1
v2 <- 5:1
v2
v3 <- 1:1
v3

v3 <- -3.3:5
v3
v4 <- 5:-3.3
v4

v1 <- seq(from=1, to=5, by=0.5)
v1

v5 <- seq(from=5, to=1, by=0.5) ##Error

v1 <- rep('a',times=5)
v1

v2 <- rep('a',each=5)
v2

v3 <- rep(c('a','b'),times=3)
v3

v4 <- rep(c('a','b'), each=3)
v4

v5 <- rep(c('a','b'),times=3,each=2)
v5

v6 <- rep(c('a','b'),times=c(5,3))
v6

v1 <- c(27,35,47,41)
length(v1)
NROW(v1)

##Quiz - v1 벡터에서 마지막 원소 추출

v2=v1[length(v1)]
v2

v1[4]
v1[-c(1,2,3)]
v1[length(v1)]

names(v1) <- c('kim','lee','park','choi')
names(v1)

v1
v1['kim']

v1[c('lee','choi')]


##  벡터명[ 선택하고자 하는 위치]
weight <- c(57,81,65,49,72)
weight

length(weight)
weight[1]

weight[c(1,4,5)]
weight[2:4]
weight[1]
weight[2]
weight[3:5]

weight[-2]
weight[-c(1,4,5)]

##논리연산자 적용하여 추출

weight
logical_idx <- c(F,F,F,T,F)
weight[logical_idx]

weight>50

weight[weight>50]

weight>50 & weight<70

##벡터의 수정/추가/삭제

v1 <- 1:10
v1

v1[3] <- 99
v1

##두개 동시에 바꾸기

v1[c(5,7)] <- c(500,700)
v1

#8번째에서 마지막 까지 0으로 변경

v1[c(8:length(v1))] <- 0
v1

###추가
v2 <- 1:5
v2

#맨 앞에 0을 추가
v2 <- c(0,v2)
v2

#앞에 -2,-1을 추가
v2 <- c(c(-2,1),v2)
v2

#맨 뒤에 6을 추가

v2 <- c(v2,6)
v2

##뒤에 7부터 10까지 추가

v2 <- c(v2,7:10)
v2

v1 <- c('a','b','c')
v2 <- c('1','2')
append(v1,v2)
append(v1,v2,2)   ##2번째 요소 뒤에 벡터

v1 <- 1:10
v1[c(1,3,5,7)]

##맨 마지막 요소 제외하고 선택

v1[-c(length(v1))]

##v2에서 2번쨰와 4번째 제외한 요소 가져오기

v2 <- c('a','b','c','d')
v2[-c(2,4)]
v2 <- v2[-c(2,4)]
v2
v2 <- c('a','b','c','d')

logical_idx= c(T,F,T,F)
v2[logical_idx]
v2 <- v2[logical_idx]
v2

## 벡터의 산술연산

x <- c(1,2,3,4,5)
x
x+1
x-1
x*2
x/2
x%/%2  ##정수형 몫
x%%2   ##나머지
x**2

###벡터의 비교 연산

c(1,2,3) == c(1,2,100)
c(1,2,3) != c(1,2,100)
c(1,2,3) >= c(1,2,100)
c(1,2,3,4,5,6) >= c(1,2,3)
c(1,2,3)>= c(1,2,3,4,5,6)  ###숫자 적은 놈이 한번 더 돈다!

### 요소가 포함되었는지 연산 -  %in%

'a' %in% c('a','b','c')
'd' %in% c('a','b','c')


###벡터의 연산 - 합집합, 교집합, 차집합

v1 <- c('a','b','c')
v2 <- c('a','d')

union(v1,v2)
intersect(v1,v2)
setdiff(v1,v2)
setdiff(v2,v1)

v1 <- c('a','b','c')
v3 <- c('c','b','a')
setequal(v1,v3)

v1 <- 1:10
v1>5
all(v1>5)
any(v1>5)


#### 숫자벡터 내장함수 - 합계, 최솟값, 최대값, 평균, 중앙값, 사분위수

v1 <- 1:10
v1

sum(v1)
min(v1)
max(v1)
mean(v1)
median(v1)  ##(5+6)/2
sum(v1)/length(v1)

quantile(v1)
quantile(v1,0.25)
quantile(v1,0.5)
quantile(v1,0.75)
quantile(v1,0.01)

######벡터안의 원소들의 문자수 출력  #####

v1 <- c('a','abc','abcd','abcdef')
nchar(v1)

##비교) 벡터의 길이 (=원소의 개수) : length()

length(v1)


###문자열 합치기

paste('hello','R')
paste0('hello','R')

paste('hello','R',sep='')
paste('hello','R',sep=' ')
paste('hello','R',sep='/')

v1 <- c('a','abc','abcd','abcdef')
paste(v1,'ok')
paste0(v1,'ok')
paste(v1,'ok',sep='! ')


###문자열 자르기

s1 <- strsplit('Hello/R', split='/')
strsplit('Hello/R','WSER/rE','rrwr/wr', split='/')
mode(s1)


### 대문자/소문자 변환

toupper('Hello')

v1 <- c('a','ab','abc','abcdef')
toupper(v1)

tolower('HELLO')
tolower(v1)

###논리형 벡터

v1 <- c(TRUE,FALSE,F,T,F)
mode(v1)

##not 연산자
!v1
v1
as.numeric(v1)
sum(as.numeric(v1))  ##TRUE 개수

#1) 6명의 혈액형 데이터를 bt라는 벡터에 저장한다.

bt=c('A','O','AB','B','O','B')
bt
mode(bt)
str(bt)

#2) bt라는 벡터를 요인(factor)로 변환해 본다.
bt_factor= as.factor(bt)
bt_factor
mode(bt_factor) #문자로 출력되나 데이타 타입은 숫자
str(bt_factor)

as.character(bt_factor)  #levels 값으로 변환
as.numeric(bt_factor)  ##levels에 매칭된 

##3) 레벨 확인 및 변경 : levels()
levels(bt_factor)
levels(bt_factor) <- c('A형','B형','O형','AB형')
bt_factor

head(mtcars,2)

#mtcars 데이타 셋 복사하기
mymtcars <- mtcars

substr('950616',3,4)

v1 <- c('a','abc','abcd','abcdef')
substr(v1,1,2)
v1

st<-strsplit('Hello/R',split='/')
st
st[1]
st[[1]][1]
st[[1]]
st[[1]][2]


m1 <- matrix(1:9,ncol=3)
m1[1,1]
m1[3,2]
m1[1:2,] (1~2행, 모든열)
m1[-3,]
m1[c(1,3),c(1,3)]

m2 <- matrix(1:9, ncol=3,byrow=TRUE)
m2

v1 <- 1:3
v2 <- 4:6

##행단위로 묶어 배열 생성

m1 <- rbind(v1,v2)
m1

#열 단위로 묶어 배열 생성

m2 <- cbind(v1,v2)
m2

x <- matrix(c(1:9),nrow=3)
x
x+2
x-2
x*2
x-x
x%*%x

t(x)

nrow(x) #배열의 행의 수
ncol(x) #배열의 열의 수
dim(x) #배열의 차원 수


####배열을 생성하는 방법

x <- array(1:12,dim=c(2,2,3))
x

x[,,3]
x[1,2,3]

x[1,2,2]
x[2,1,3]
class(x)

(x <- array(1:12,dim=c(2,6)))


### 배열에서 유용한 함수

x <- array(1:12,c(3,4))
x

##각 행의 평균 1- 행, 2- 열

apply(x,1,mean)
apply(x,2,mean)


## sample 함수 : 벡터냐 배열에서 샘플 추출
sample(10)

x <- array(1:15,c(3,5))
x

sample(x,5) ##x에서 5개 추출

#seed() - 코드의 재현성
set.seed(1) 
sample(x,5)

help(sample)

x <- sample(c(0,1),100,replace=TRUE)
mean(x)
x


####list(리스트)

#name이 'foo'이고 height가 70인 리스트 x를 생성
(x <- list(name='foo',height=70))
x$name
x$height



#@ 스칼라 값이 아닌 벡터 저장 가능

(x <- list(name='foo', height=c(1,3,5)))
x$height
x[[2]][2]


###리스트 안에 리스트 중첩 가능

list(a=list(val=c(1,2,3)),
     b=list(val=c(1,2,3,4)))

####리스트의 활용예제

v1 <- (10,20,10,20,20,30,30,40,50,100)

boxplot(v1)
out <- boxplot(v1)
out$out
is.list(out)
out Counter,friends

temp <- list(경기=c(28,34,22,-10),서울=(c(26,36,46 ))
                  )
$서울

result <- lapply(temp,mean)
result

result[1]
result[2]
result$경기
(x <- list(name='foo',height=c(1,3,5)))
x$name
x$height
x[[1]]


#### DATA FRAME  ######
## 형식 : data.frame(tag=value, stringAsFactors=TRUE) --문자인 경우 팩터로 변환할지 여부 (기본값은 팩터 변환)


##1) 변수만들기

english <- c(90,80,60,70) #영어 점수 변수 생성
english

math <- c(50,60,100,20)
math

###2) 데이타 프레임 만들기
df_midterm <- data.frame(english,math)
df_midterm
is.data.frame(df_midterm)
class(df_midterm)
str(df_midterm)

class <- c(1,1,2,2)

df_midterm <- data.frame(english,math,class)
df_midterm

mean(df_midterm$english)

##   4분석하기
mean(df_midterm$math)
median(df_midterm$english)

summary(df_midterm)

### 한번에 데이타 프레임 만들기!

df_midterm2 <- data.frame(name=c('김지훈','이유진','박동현','홍길동'),
                          english=c(90,80,60,70),
                          math=c(50,60,100,20),
                          class=c(1,1,2,2),
                          stringsAsFactors=TRUE)
df_midterm2
str(df_midterm2)
str(df_midterm2$name)


str(df_midterm2$name)

#### 데이타프레임 접근하기

df_midterm <- data.frame(name=c('김지훈','이유진','박동현','홍길동'),
                          english=c(90,80,60,70),
                          math=c(50,60,100,20),
                          class=c(1,1,2,2),
                          stringsAsFactors=FALSE)
df_midterm
str(df_midterm)
str(df_midterm$name)
as.factor(df_midterm$name)
str(df_midterm$name)
str(df_midterm)

summary(df_midterm)

boxplot(df_midterm$math)
boxplot(df_midterm$english)
boxplot(df_midterm[,-1])

##행의 개수 : nrow()
nrow(df_midterm)
NROW(df_midterm)

##열의 개수 : ncol()
ncol(df_midterm)
NCOL(df_midterm)

##행과 열 이름
##컬럼 이름 확인
names(df_midterm)
colnames(df_midterm)

###행 이름 확인
rownames(df_midterm)


#### 1) 데이타프레임명[행,열]

df_midterm[2:4,]
df_midterm[,1:3]
df_midterm[2:4,1:3]

df_midterm[df_midterm$math >=60,]

###데이타프레임명$컬럼명
df_midterm$math
str(df_midterm$math)

##2) subset(dataframe, condition,select)
subset(df_midterm,class==1,c(1:3))

##1) subset() 사용
subset(df_midterm,name %in% '홍길동')
subset(df_midterm,class==1)
subset(df_midterm,math>=70)
subset(df_midterm,class==2 & math>= 70)
subset(df_midterm,class==1 | class==2)


##2) 대골화 [] 사용
df_midterm[df_midterm$class==1,]
df_midterm[df_midterm$math>=70,]


####조건에 맞는 행 선택하는 예제

### 수학 평균 구하기

math_mean <- mean(df_midterm$math)
math_mean

df_midterm[df_midterm$math>=math_mean,]
subset(df_midterm,math>=math_mean)

##1반이면서 수학 평균 이상인 학생
df_midterm[df_midterm$math>=math_mean &class==1,]
subset(df_midterm,math>=math_mean & class==1)
subset(df_midterm,math>=mean(df_midterm$math) & class==1, name)


#수학평균 이상인 학생의 이름, 수학점수, 반 출력하기
df_midterm[df_midterm$math>=math_mean,c(1,3:4)]
subset(df_midterm,math>=math_mean,c(-2))

###컬럼 하나만 추출하면 벡터로 추출됨


##1)행 병합 함수 : rbind()
student <- c('이순신',90,90,1)
df_midterm2 <- rbind(df_midterm,student)
df_midterm2


##2)열 병합 함수 : cbind()
kor <- c(90,86,63,96)
cbind(df_midterm,kor)

install.packages('sqldf')
library(sqldf)

##sql 사용
sqldf('select * from df_midterm')
sqldf('select * from df_midterm
      where name = "홍길동"')
sqldf('select name from df_midterm where math>=60')
sqldf('select class, avg(math) from df_midterm group by class')

5e-2
Sys.time()

drink <- c('콜라','사이다','환타','핫식스', '몬스터')
drink
drink[-c(1,2)]

v2 <- c(1,2,3,4)
v2[-c(2,4)]
