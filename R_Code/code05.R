#####------------------------------------############
#####        ########
#####------------------------------------############

#### 학생들의 좋아하는 '선호 계절' 조사

favorite <- c('WINTER','SUMMER','FALL','SUMMER','WINTER','SPRING',
              'SUMMER','FALL','SUMMER','SPRING','WINTER','FALL')

###favorite의 내용 출력
favorite

table(favorite)

#비율 출력
round(table(favorite)/length(favorite),3)

##막대 그래프 작성
ds <- table(favorite)
ds

# x축-계절이름, y축 - 선호빈도
barplot(ds,main='favorite season')

#추가 1) 도수분포표 데이타 순서의 정렬
# i)인덱스를 이용한 내림차순 정렬
ds
class(ds)
ds.new <- ds[c(3,4,1,2)]  ### Index Number
barplot(ds.new,main='favorite season')
ds.new

## ii) sort() 함수를 이용한 내림차순 정렬
ds
ds.new <- sort(ds,decreasing = TRUE)
ds.new
barplot(ds.new,main='Favorite Seasons')

##3) 원그래프 작성
ds
pie(ds,main='favorite season')



#####------------------------------------############
#####    숫자로 표현된 범주형 자료 탐색    ########
#####------------------------------------############

#외관상으로는 숫자(1,2,3) 이지만 연산이나 대소 비교의 의미가 없다.

#학생 15명의 선호 색상을 조사한 자료
#1=초록, 2=빨강, 3=파랑

favorite.color <- c(2,1,3,1,2,2,1,3,1,2,1,1,3,1,2)

#도수분포표
ds <- table(favorite.color)
ds

#막대그래프 작성
barplot(ds,main='favorite color')

##색을 지정하여 막대그래프, 원그래ㅡㅍ 작성
colors <- c('green','red','blue')
##이름을 green,red,blue로 변경
names(ds) <- colors
names
ds

#색 지정 막대그래프
barplot(ds,main='favorite color',col=colors)
#색 지정 원그래프
pie(ds,main='favorite color',col=colors)

#####------------------------------------############
#####     단일변수 범주형 자료의 탐색    ########
#####------------------------------------############

####막대그래프 : diamonds 데이타 셋 사용  ####

library(ggplot2)
data(diamonds)
table(diamonds$cut)
head(diamonds,2)
dim(diamonds)


###막대그래프####
barplot(table(diamonds$cut))
barplot(table(diamonds$cut),col=rainbow(5))

###그래프에 제목 
barplot(table(diamonds$cut),col=rainbow(5),main='Diamonds Quality',xlab='Quality',ylab='Frequency')

## ylim : y축의 최솟값과 최대값을 수정
barplot(table(diamonds$cut),col=rainbow(5),main='Diamonds Quality', xlab='Quality', ylab='Frequency', ylim=c(0,25000))

##가로 막대그래프로 변경 - horiz=TRUE
##-x축과 y축이 변경되므로 ylab,ylim은 xlab, xlim으로 변경

barplot(table(diamonds$cut),col=rainbow(5),main='Diamonds Quality',xlab='Frequency',xlim=c(0,25000),horiz=TRUE)


###막대그래프-ggplot2 패키지에 있는 ggplot() 함수와 geom_bar() 함수

ggplot(data=diamonds,mapping=aes(x=cut)) +geom_bar()

##원그래프 - ggplot2 패키지 이용
ggplot(data=diamonds,aes(x='',fill=cut))+geom_bar(width=1)+coord_polar('y')



#####------------------------------------############
#####           백분율 구하기                ########
#####------------------------------------############
####prop.table() 함수 - 0~1사이의 값을 반환
#백분율로 나타내기 위해서는 prop.table()*100

prop.table(table(diamonds$cut))
prop.table(table(diamonds$cut))*100
prop.table(table(diamonds$color))*100
prop.table(table(diamonds$clarity))*100


##반올림은 round() 함수를 사용
# 소수점 첫번째 자리까지 반올림

round(prop.table(table(diamonds$cut))*100,1)




#####------------------------------------############
#####        ########
#####------------------------------------############

# install.packages("descr")

library(descr)
library(readxl)

data <- read_excel('sample1.xlsx')
head(data,3)

##거주지별(AREA) 빈도분석(그래프 제외외)
freq_test <- freq(data$AREA,plot=F)
freq_test

##거주지별 AREA 빈도부석 그래프 그리기
freq_test <- freq(data$AREA,plot=T)
freq_test

getwd()







#####------------------------------------############
#####   단일변수 연속형 자료의 탐색
#### 연속형 자료는 관측값들의 크기가 잇기 때문에 다양한 분석방법이 존재
###통계   ########
#####------------------------------------############

#####------------------------------------############
#####  1)평균과 중앙값, 절사평균      ########
#####------------------------------------############


weight <- c(60,62,64,65,68,69)
weight.heavy <- c(weight,120)
weight
weight.heavy

mean(weight)
mean(weight.heavy)
median(weight)
median(weight.heavy)
### 중앙값은 특이값(이상치)의 영향을 덜받는다.

mean(weight, trim=0.2)   ##절사평균 (상하위 20% 제외외)
mean(weight.heavy, trim=0.2)

### 절사값은 특이값을 제외하는 효과

##################--------------------------------------------################

# 2) 사분위수
mydata <- c(60,62,64,65,68,69,120)
quantile(mydata)

## 10% 단위로 구간을 나누어 계산
quantile(mydata,(0:10)/10)

summary(mydata)

#####------------------------------------############
##### 3) 산포 - 분산, 표준편차 ( 작을수록 좋다!!)       ########
#####------------------------------------############

mydata
var(mydata)       #분산 (자기값-평균)**2/ n
sd(mydata)        #표준편차 (분산에 루트씌운것)
range(mydata)     #값의 범위
diff(range(mydata))   #최대값, 최솟값의 차이이

#####------------------------------------############
#####  연속형 데이터 (변수 1개) 히스토그램 그리기########
#####------------------------------------############




head(cars,5)

dist <- cars[,2]  ##자동차 제동거리
dist
hist(dist,
     main='자동차 제동거리',
     xlab='제동거리',
     ylab='빈도수',
     ylim=c(0,20),
     border='black',
     col='green',
     las=1,            # x 축 글씨 방향 (0~3)
     breaks=5)     #막대 개수


###diamonds 데이타셋
h <- hist(diamonds$price)
h$breaks


## 구간을 새롭게 지정
hist(diamonds$price,breaks=4)


#####------------------------------------############
#####       상자그림                     ########
#####------------------------------------############

##자동차 젣종거리 (단위: 피트)
head(dist)
boxplot(dist,main='자동차 제동거리리')

b <- boxplot(dist,main='자동차 제동거리리')
b$out   ##(outliner 값 출력하기)

mean(dist)
median(dist)
var(dist)
quantile(dist)

# boxplot.stats() 함수이용
# $stats - 정상범위 자료의 4분위수에 해당하는 값들
# $n - 관측치 값들의 개수
# $out - 관측치의 수 -> 특이값 출력 boxplot.stats(out)

boxplot.stats(dist)

### 그룹이 있는 자료의 상자그림
boxplot(Petal.Length~Species,  ## 꽃 종류별로 꽃잎의 길이
        data=iris,
        main='품종별 꽃잎의 길이')

###diamonds 데이타셋
###range - 1.5일때 (기본)
boxplot(diamonds$price)
boxplot.stats(diamonds$price)
out <- boxplot.stats(diamonds$price)$out
length(out)

##range- 3일때 
boxplot(diamonds$price,main='다이아몬드 가격',range=3)

boxplot(diamonds$price,range=3)
b<- boxplot(diamonds$price,range=3)
length(b$out)

boxplot(diamonds$price~diamonds$cut)  ##(x 범주형, y 연속형)

install.packages('vioplot')
library(vioplot)

dist <- cars[,2]
vioplot(dist,col='blue')

#boxplot + violin plot 을 함께 그리기

par(mfrow=c(1,2))  #1행 2열 그래프
boxplot(dist)
vioplot(dist,col='blue')
par(mfrow=c(1,1))  #원래 상태 돌려놓기

## 집단별 violin plot
vioplot(Petal.Length~Species,
        data=iris,
        main='품종별 꽃잎의 길이',
        col='purple') ####다시 강조!! (x축 범주형, y축 연속형)

##7) 커널밀도추정(kde) 그래프 : plot(density())
###density : 커널 밀도 추정
###rug : 그래프의 x축에 데이터를 1차원으로 표시

dist <- cars[,2]
density(dist)
plot(density(dist))
rug(dist)


##히스토그램 + 커널밀도추정 곡선
hist(dist, freq=FALSE)
lines(density(dist))

##커널밀도추정 곡선 + rug
plot(density(dist))
rug(jitter(dist))
##jitter : 데이터가 중첩되는 경우가 많다면 사용

######------------------------------------
#기술통계량(요약통계량)


####-----------------------------------

head(diamonds)
# i)평균 - mean()함수
v1 <- c(70,90,60,50,NA)
mean(v1)
mean(v1,na.rm=TRUE) ##결측치 제거한 평균
sum(v1, na.rm=T)/length(v1)
mean(diamonds$price)

# 결측치 제거한 평균
mean(diamonds$price, na.rm=TRUE)


#절사평균
mean(diamonds$price, trim=0.05)

#ii) 중위수
# -양적 자료를 정렬한 후에 데이터의 개수를 반으로 나눈게 하는 값으로 양적 자료의 중심
# - 평균과 다르게 이상하게 크거나 이상하게 작은 값에 영향을 덜 받는 특징이 있다.

median(diamonds$price)
quantile(diamonds$price, 0.5)


## iii) 최빈수(Mode)
# - 동일한 값이 가장 많은 값으로 양적 자료의 중심을 알려준다.
# - 최빈수는 다른 값과 다르게 두 개 이상이 나올 수 있다.
table(diamonds$price)
which.max(table(diamonds$price))
index=which.max(table(diamonds$price))
index
table(diamonds$price[index])

# iv) 범위(range) : 최대값(Max) - 최소값(Min)

range(diamonds$price)

diff(range(diamonds$price))
max(diamonds$price)-min(diamonds$price)


## v) 분산(Variance)

#- 각 자료에서 평균을 뺀 값, 즉 편차(deviation)

sd(diamonds$price)
sqrt(var(diamonds$price))



##하나의 함수로 6개의 기술통계량 구하기
#최소값, 제1사분위수,중위수,평균값, 제3사분위수,최대값

summary(diamonds$price)

hist(diamonds$price)







####    Quiz
library(readxl)
exdata1 <- read_xlsx('sample1.xlsx')
exdata1
head(exdata1,3)


stem(exdata1$AGE)

hist(exdata1$AGE,
     xlim=c(0,60))

barplot(exdata1$SEX)
exdata1

###########2)


colors <- c('pink','blue')
ds <- table(exdata1$SEX)
barplot(table(exdata1$SEX),
        main='Barplot',
        xlab='SEX',
        ylab='FREQUENCY',
        col=colors)
names(ds) <- c('Female','Male')

barplot(ds,
        main='Barplot',
        xlab='SEX',
        ylab='FREQUENCY',
        col=colors)


#정답
cnt_sex <- table(exdata1$SEX)
barplot(cnt_sex)

barplot(cnt_sex,ylim=c(0,8),
        main='Barplot',
        xlab='SEX',
        ylab='FREQUENCY',
        names=c('FEMALE','MALE'),
        col=c('Pink','Navy'))




# ii) ggplot2의 qplot()
qplot(exdata1$SEX)
qplot(exdata1$SEX,
      fill=exdata1$SEX)

#iii) descr패키지의 freq()함수이용
library(descr)
freq(exdata1$SEX,
     plot=T,
     main='성별 Barplot')


#5) 상자 그림 (box plot) - 분포 및 이상치 확인하는  그래프
boxplot(exdata1$Y17_CNT,exdata1$Y16_CNT)
boxplot(exdata1$Y17_CNT,exdata1$Y16_CNT,
        ylim=c(0,60),
        main='boxplot',
        names=c('17년건수','16년건수'),
        col=c('green','yellow'))


##### 네이버 뉴스 검색하기


