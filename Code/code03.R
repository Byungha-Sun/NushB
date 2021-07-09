df_midterm <- data.frame(name=c('김지훈','이유진','박동현','홍길동'),
                         english=c(90,80,60,70),
                         math=c(50,60,100,20),
                         class=c(1,1,2,2),
                         stringsAsFactors=FALSE)
df_midterm

colnames(df_midterm)
colnames(df_midterm) <- c('name','eng','mat','class')
df_midterm

#### 집계함수  :  aggregate(집계할열~ 집계기준열)

##반 별 수학 평균
aggregate(mat~class, df_midterm, mean)

##반 별 영어와 수학 평균
aggregate(cbind(eng,mat)~class,df_midterm,mean)

help(aggregate)

###데이타프레임끼리 병합  :  merge()  함수

df_final <- data.frame(name=c('김지훈','이유진','박동현','홍길동'),
                        fenglish=c(80,60,90,80),
                        fmath=c(70,50,100,70),
                        fclass=c(1,1,2,2)
                        )

df_2 <- merge(df_midterm,df_final,by='name')
df_2

aggregate(cbind(mat,fmath)~fclass,df_2,mean)

##attach, detach

##attach(dataframe) : R이 객체를 찾는 경로를 추가해주는 함수
##detach(dataframe) L: 객체 검색 경로에서 데이타 프레임 제거

df_final <- data.frame(name=c('김지훈','이유진','박동현','홍길동'),
                       fenglish=c(80,60,90,80),
                       fmath=c(70,50,100,70),
                       fclass=c(1,1,2,2)   )

attach(df_midterm)
name
eng
mat
class

detach(df_midterm)
eng
mat


###Q1. sales 데이타 프레임 생성하기

sales <- data.frame(fruit = c('사과','딸기','수박'),
                    price= c(1800,1500,3000),
                    volume= c(24,38,13))
sales
summary(sales)
str(sales)
mean(sales$price)
mean(sales$volume)


##sales 데이타프레임 수정하기

ed_sales <- edit(sales)
ed_sales


############ 조건문   ################

x=10
if(x>5){
    print('x is large number')
}else{
    print('x is small number')
}

#2) if(조건) {실행문1} else {실행문2} 구조

x=4
if(x>5){
    print('x is a large number')
}else{
    print('x is not a large number')
}

#3) if(조건문) {실행문1} else if(조건2) {실행문2} else {실행문3} 구조

x <- 3

if(x>10){
    print('x는 10보다 큽니다.')
} else if(x>5){
    print('x는 5보다 크고 10보다 작습니다')
} else{
    print('x는 5보다 작습니다.')
}


#4) ifelse(조건문, 실행1, 실행2) 구조
x=4
ifelse(x %% 2 ==0, 'even','odd')

x=9
ifelse(x %% 2 !=0, 'odd','even')



##예제
# 어떤 회사에 직원들의 보너스를 지급하는데 직무유형(job_type)에 따라 A 직무사원은 100만원, B직무사원은 200만원 지급하고, 나머지 직무는 보너스를 지급하지 않는다고 한다. if 문을 통해 코드로 이를 표현하세요.


job_type= 'C'
bonus=0
if(job_type=='A'){
    bonus+100
}else if(job_type=='B'){
    bonus+200
}else{
    bonus+0
}
print(bonus)


### for 문

# 1~10 출력하기
for (i in 1:10){
    print(i)
}

# for 문 안에서 if문 사용(짝수만 프린트하기)

for (i in 1:10){
    if(i%%2 ==0){
        print(i)
    }
}

## 1부터 100까지의 합
sum=0
i=0
for (i in 1:100){
    sum=sum+i
}
print(sum)


###1부터 100까지 짝수의 합

#방법1)
sum=0
i=0
for (i in 1:100){
    if(i %%2==0){
        sum=sum+i
    }else{
        next
    }
}
print(sum)

#방법2)
sum=0
for (i in seq(from=0, to=100,by=2)){
    sum=sum+i
}
print(sum)



### While 문 사용하기  ###

#  1부터 10까지 출력
i=1
while(i<=10){
    print(i)
    i=i+1
}

# 1부터 100까지의 합
sum=0
i=1
while(i<=100){
    sum=sum+i
    i=i+1
}
print(sum)


#### repeat 문  ####
#1~10 출력하기

i=1
repeat{
    print(i)
    if(i<=10){
        break
    }
}

#1부터 100까지의 합 출력
i=1
sum=0
repeat{
    sum=sum+i
    if(i>=100){
        break
    }
    i=i+1
}
print(sum)


###break 문
###1부터 100까지의 합이 1000이 넘는 시점의 숫자를 구하시오

sum=0
for(i in 1:100){
    sum=sum+i
    if(sum>1000){
        break
    }
}
print(i)
print(sum)


###   continue(next)문  ###
#1부터 100까지의 합을 구하되, 홀수의 합만 구하시오

sum=0
for(i in 1:100){
    if(i%%2==0)next
    sum=sum+i
}
print(sum)


###   구구단 만들기

for(i in 2:9){
    print(paste(2,'x',i,'=',2*i))
}

for(i in 2:9){
    for(j in 1:9){
        print(paste(i,'x',j,'=',i*j))
    }
}


#### IRIS 예제  #####

norow <- nrow(iris)
mylabel <- c()
for (i in 1:norow){
    if (iris$Petal.Length[i] <= 1.6){
        mylabel[i] <- 'S'
    } else if(iris$Petal.Length[i]>=5.1){
        mylabel[i] <- 'L'
    }else{
        mylabel[i] <- 'M'
    }
}
print(mylabel)

newdf <- data.frame(iris$Petal.Length,mylabel)
head(newdf)
tail(newdf)


##수치형 내장 함수

score=c(60,78,83,74,100,80,90,85,70)
length(score)

#1)sort() 함수로 관측치 정렬하기
sort(score)

##decreasing=TRUE 옵션으로 내림차순 정렬
sort(score,decreasing = TRUE)

##최솟값, 최댓값, 중앙값계산하기

min(score)
max(score)
median(score)


quantile(score)
quantile(score,0.25)
quantile(score,0.5)
quantile(score,0.75)
quantile(score,0.1)

summary(score)
x <- boxplot(score)

##이상치가 포함된 boxplot
score=c(60,78,83,74,100,90,85,200)
x <- boxplot(score)
x


x$out


socre=c(60,78,83,74,100,80,90,85,70)
hist=socre
hist(score,breaks=seq(50,100,10), right=TRUE)
#breaks 옵션으로 구간 지정, 50~100, 10간격

hist(score,breaks=seq(50,100,5),right=TRUE)

###7) 평균과 분산, 표준편차 계산

mean(score)
sum(score)/length(score)
var(score)
sd(score)  ## 아마도 표준편차?``
sqrt(var(score)) ## 루트 씌우기


###평균과 표준편차를 이용한 표준화
mean_s=mean(score)
sd_s=sd(score)

###표준점수 계산 가능
score
(score-mean_s)/sd_S


###scale() 함수를 활용한 표준화

scale(score)


str1 <- c('Hello!', 'World','is', 'good!')
str1

##1) 문자열 합치기 : paste()
paste(str1, collapse = ',')

##2) 문자열 분리하기 : strsplit()
str2 <- strsplit(str1,'-')
str2
##3) 문자열의 수 : nchar()
nchar(str2)
str3= '19950616'

substr(str3,1,4)  ## 1부터 4까지 가져와!
substr(str3,5,6)

### 조건에 맞는 데이터 위치 찾기
##- which(),which.max(),which.min() 함수

score <- c(76,84,69,50,95,60,82,71,88,84)
which(score==69)
which(score>=85)
max(score)
which.max(score)
which.min(score)
min(score)


#60점 이하의 점수를 61점으로 조정
score<=60
idx <- which(score<=60)
idx
score[idx] =61
score


#80점 이상인 값들을 추출하여 저장

idx <- which(score>=80)
idx
score_high <- score[idx]
score_high


###Quiz
##꽃잎의 길이가 5.0보다 큰 값만 추출하여 저장

head(iris,5)
idx <- which(iris$Petal.Length>5.0)
idx
big <- iris[idx,]
big
nrow(big)

### 사용자 정의 함수 생성

myf_1 <- function(a){
    b <- a^3
    return(b)
}
myf_1(3)


myf_2 <- function(a,b){
    c <- a*b
    return(c)
} 
myf_2(125,27)


myf_2(myf_1(5),myf_1(3))



### 두 수를 입력받아 큰 수를 내보내는 함수 작성

myf_3 <- function(a,b){
    max <- a
    if(b>a){
        max=b
    }
    return(max)
}
myf_3(25,253)


### 사용자 정의 함수 : 매개변수에 초기값 설정하기

mysum <- function(x,y,z=0){
    result <- x+y+z
    return(result)
}
mysum(1,2,3)
mysum(1,2)


## 함수가 반환하는 결과값이 여러 개일때의 처리.
##-여러개의 결과값을 list로 하나로 묶고 반환

myf_4 <- function(x,y){
    val_sum=x+y
    val_mul=x*y
    return(list(sum=val_sum,mul=val_mul))
}

myf_4(10,20)

result <- myf_4(10,20)
s <- result$sum
m <- result$mul
m
s

print(paste(10,'+',20,'=',s))

###   사용자 정의 함수 저장 및 호출

#1) 'mysum.R'을 저장
mysum <- function(x,y,z=0){
    result <- x+y+z
    return(result)
}

#2) 사용자 정의 함수를 실행하여 R에 함수를 등록
getwd()
setwd('c:\users\administrator\desktop\rstudy')
#3) 사용자 정의 함수 사용
source('mysum.R')
mysum(50,60,70)



#### 라이브러리 패스 정보 확인
.libPaths()
