#1) 기술 통계, 추론(검정) - 자료의 요약

## 기술통계량의 유형
#대표값:평균,합계,중위수,최빈수,사분위수
#산포도: 분산, 표준편차,최소값,최대값, 범위

data(package='MASS')

data(iris)
head(iris)
summary(iris)
dim(iris)

table(iris$Species)
summary(iris$Sepal.Length)
sd(iris$Sepal.Length) #표준편차
var(iris$Sepal.Length) #분산

quantile(iris$Sepal.Length)
quantile(iris$Sepal.Length,0.25)

head(sort(table(iris[,1]),decr=T),1)

# install.packages('moments')
library(moments)

cost=iris$Petal.Length
skewness(iris$Sepal.Length)
kurtosis(iris$Sepal.Length)


##히스토그램으로 왜도/첨도 확인
hist(iris$Sepal.Length)

## Q-Q Plot
qqnorm(iris$Sepal.Length,main='iris')
qqline(iris$Sepal.Length,col='red')

#shapiro.test

shapiro.test(iris$Sepal.Length)


#1. 단일표본  t-test
#문법: t.test(관측치, alternative=판별 방향, mu=특정기준, conf.level=신뢰수준)
#alternative - 'greater','less','two.sided' (큰지/작은지/같은지)

#women 데이터는 미국 성인 여성 중에서 표본으로 뽑은 15명의 키(height)와 몸무게(weight)
women 
#표본 크기 : 15개 이므로 정규성 검사를 먼저 해야함 
# 그러므로 shapiro.test를 거쳐야함

colnames(women) <- c('height','weight')
head(women)

#가설 1
## 귀무가설 : 미국 성인 여성의 평균 몸무게는 130 파운드이다(u=130).
## 대립가설 : 미국 성인 여성의 평균 몸무게는 130 파운드보다 높다(u>130).

## 1 단계) 정규성 검정 -> shpiro.test() 함수 이용
shapiro.test(women$weight)
#p-value = 0.6986 > 0.05 이므로 정규분포

## 2 단계) t-test
t.test(women$weight,mu=125,alternative = 'greater')


#가설2)
#귀무가설 : 미국 성인 여성의 평균 키는 70인치이다 (u=70)
#대립 가설: 미국 성인 여성의 평균 키는 70인치보다 작다
shapiro.test(women$height)
t.test(women$height,mu=70,alternative = 'less')



sleep
str(sleep)

#1단계 정규성 검정
#2단계 등분산 검정

