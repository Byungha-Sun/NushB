#------------------------------------------#
# R을 이용한 빅데이타 분석∙시각화 
#------------------------------------------#

#------------------------------------------#
# 기술통계, 추론(검정) 통계 - code12-1
#------------------------------------------#

#------------------------------------------#
# 1) 기술 통계-자료의 요약
#------------------------------------------#
## 기술통계량의 유형
#대표값 : 평균(mean), 합계(sum), 중위수(median), 최빈수(mode), 사분위수(quantile) 등
#산포도 : 분산(var), 표준편차(sd), 최소값(min), 최대값(max), 범위(range) 등
#비대칭도 : 왜도(skewness) - 0에 가까울수록 대칭, 첨도(kurtosis)  

# 데이타셋 목록 보기
data()

# 데이타셋 설명 보기
help(iris)


# irir 데이타셋 사용 
data(iris)
head(iris)
summary(iris)
dim(iris)

table(iris$Species)

mean(iris$Sepal.Length) #평균
median(iris$Sepal.Length) #중앙값
sd(iris$Sepal.Length) #표준편차 
var(iris$Sepal.Length) #분산 

quantile(iris$Sepal.Length) #백분위수 
quantile(iris$Sepal.Length, 1/4) #1사분위수
quantile(iris$Sepal.Length, 0.25) #1사분위수
quantile(iris$Sepal.Length, 3/4) #3사분위수 
quantile(iris$Sepal.Length, 0.75) #3사분위수

max(iris$Sepal.Length) #최대값 
min(iris$Sepal.Length) #최소값 
head(sort(table(iris[,1]), decr=T)) #최빈값 
head(sort(table(iris[,1]), decr=T),1) #최빈값 

range(iris$Sepal.Length) #최소값~최대값 
diff(range(iris$Sepal.Length)) #최대값 - 최소값


#------------------------------------------#
# 2) 기술통계 - 질적 자료 요약
#------------------------------------------#
library(MASS)
data("survey")

# 데이타셋 설명 보기 
help(survey)

str(survey)
head(survey, 3)

#원그래프
smoke <- table(survey$Smoke)
smoke
pie(smoke)

#막대 그래프
barplot(smoke)

#분할표
table(survey$Sex, survey$Smoke)

#------------------------------------------#
# 3) 기술통계 - 양적 자료 요약
#------------------------------------------#

data(mtcars)
help(mtcars) #데이타셋 설명보기 

#히스토그램
hist(mtcars$mpg)

#줄기 잎 그림
stem(mtcars$hp)
mtcars$hp

#선그래프
install.packages("ggplot2")
library(ggplot2)

BOD #Biochemical Oxygen Demand
ggplot(BOD, aes(x=BOD$Time, y=BOD$demand)) + geom_line()

#산점도
ggplot(cars, aes(x=cars$dist, y=cars$speed)) + geom_point()


#------------------------------------
# 비대칭도 구하기
# - 분포의 기울어진 방향의 정도와 중심에 집중되는 정도를 나타내는 척도 
#------------------------------------
install.packages("moments")   
# 왜도/첨도를 위한 패키지
library(moments)

cost = iris$Petal.Length  

## 왜도 - 0에 가까워야 대칭, 0보다 작으면 왼쪽 꼬리, 크면 오른쪽 꼬리
skewness(iris$Sepal.Length)  # -0.297234

## 첨도 
kurtosis(iris$Sepal.Length)  # 2.674163     # 정규분포의 첨도 = 3


#------------------------------------
## 히스토그램으로 왜도/첨도 확인 
#------------------------------------
hist(iris$Sepal.Length)
hist(iris$Sepal.Length, freq = F)

## 1) 밀도분포곡선, 정규분포 곡선
lines(density(iris$Sepal.Length), col="blue")
x = seq(0, 8, 0.1)

curve(dnorm(x, mean(iris$Sepal.Length), sd(iris$Sepal.Length)), col='red', add = T) 

## 2) Q-Q plot
qqnorm(iris$Sepal.Length, main='iris$Sepal.Length : Q-Q plot')
qqline(iris$Sepal.Length, col= 'red')  # 점의 분포가 대각선과 일치하면 정규분포이다.


## 3) 정규성 검정 테스트 : shapiro.test()
## 가설점정
## i) 귀무가설 : 정규분포와 차이가 없다.(정규분포이다.) 
##    대립가설 : 정규분포와 차이가 있다.(정규분포가 아니다.)
shapiro.test(iris$Sepal.Length)   # p-value = 0.01018 < 0.05 -> 정규분포가 아니다.


##############################################
# 추론 통계
##############################################

#----------------------------------------------
# 단일표본 t-test
#----------------------------------------------

# 1. 단일표본 t-test
# 문법: t.test(관측치, alternative = 판별 방향, mu=특정기준,conf.level = 신뢰수준)
# alternative - “greater”, “less”, “two.sided”(큰지/작은지/같은지)

## women 데이터는 미국 성인 여성 중에서 표본으로 뽑은 15명의 키(height)와 몸무게(weight)
women
colnames(women) <- c("height","weight")
women

## 가설1
##   귀무가설 : 미국 성인 여성의 평균 몸무게는 130 파운드이다(μ=130). 
##   대립가설 : 미국 성인 여성의 평균 몸무게는 130 파운드보다 많다(μ>130).

## 1단계) 정규성 검정-> shapiro.test() 함수 이용
## 귀무가설( H0) : 미국 성인 여성의 몸무게는 정규분포를 따른다. 
## 대립가설( H1) : 미국 성인 여성의 몸무게는 정규분포를 따르지 않는다.
mean(women$weight)

shapiro.test(women$weight)
#### Shapiro-Wilk normality test
####
#### data:  women$weight
#### W = 0.96036, p-value = 0.69865 --> 정규성을 따른다. 

## 2단계) 단일표본 t-test
## 귀무가설 : 미국 성인 여성의 평균 몸무게는 130 파운드이다(μ=130). 
## 대립가설 : 미국 성인 여성의 평균 몸무게는 130 파운드보다 많다(μ>130).
t.test(women$weight, mu=130, alternative="greater")
# t-test 해석)
# 1. 귀무가설(H0) : 미국 성인 여성의 평균 몸무게는 130 파운드이다(μ=130).
#    대립가설(H1) : 미국 성인 여성의 평균 몸무게는 130 파운드보다 많다(μ>130).
# 2. 유의수준 : a = 0.05(상위 5%)
# 3. 유의확률 : p-value = 0.05731
# 4. 0.05 < 0.05731 
# 5. 판정 : 귀무가설(Ho) 채택(= 대립가설(H1) 기각)
# 6. 결론 : 미국 성인 여성의 평균 몸무게는 130 파운드이다(μ=130)
 

## 가설2
##   귀무가설 : 미국 성인 여성의 평균 키는 70 인치이다(μ=70).  
##   대립가설 : 미국 성인 여성의 평균 키는 70 인치보다 작다(μ<70).

## 1단계) 정규성 검정-> shapiro.test() 함수 이용
##          귀무가설( H0) : 미국 성인 여성의 키는 정규분포를 따른다. 
##          대립가설( H1) : 미국 성인 여성의 키는 정규분포를 따르지 않는다.

shapiro.test(women$height) # p-value : 0.05731 > 0.05 --> 정규성만족 

t.test(women$height, mu=70, alternative="less")
# t-test 해석)
# 1. 귀무가설(H0) : 미국 성인 여성의 평균 키는 70 인치이다(μ=70). 
#    대립가설(H1) : 미국 성인 여성의 평균 키는 70 인치보다 작다(μ<70).
# 2. 유의수준 : a = 0.05(하위 5%)
# 3. 유의확률 : p-value = 0.000346
# 4. 0.05 > 0.000346 
# 5. 판정 : 대립가설(H1) 채택(= 귀무가설(H0) 기각)
# 6. 결론 : 미국 성인 여성의 평균 키는 70 인치보다 작다(μ<70)


## 2.윌콕슨 부호 순위 검정
##   - 하나의 모집단의 양적 자료에 대한 정규성 가정이 깨지고, 
##     표본의 크기가 작으면 단일 표본 T검정은 사용할 수 없다. 
##   -> 비모수적 방법인 Wilcoxon’s signed rank test 사용, wilcox.test()

## 형식 : wilcox.test(데이터명$변수명, mu=귀무가설의 모평균, alternative=대립가설)

## 예) 가설1
##      귀무가설 : 미국 성인 여성의 평균 몸무게는 130 파운드이다(μ=130). 
##      대립가설 : 미국 성인 여성의 평균 몸무게는 130 파운드보다 많다(μ>130).
wilcox.test(women$weight, mu=130, alternative="greater")

## Wilcoxon signed rank test

## data:  women$weight
## V = 85, p-value = 0.08441
## alternative hypothesis: true location is greater than 130

# wilcox.test 해석)
# 1.귀무가설 : 미국 성인 여성의 평균 몸무게는 130 파운드이다(μ=130). 
#   대립가설 : 미국 성인 여성의 평균 몸무게는 130 파운드보다 많다(μ>130).
# 2. 유의수준 : a = 0.05(상위 5%)
# 3. 유의확률 : p-value = 0.08441
# 4. 0.05 < 0.08441
# 5. 판정 : 귀무가설(Ho) 채택(= 대립가설(H1) 기각)
# 6. 결론 : 미국 성인 여성의 평균 몸무게는 130 파운드이다(μ=130).


#----------------------------------------------
# 독립표본 t-test  
#----------------------------------------------

## 정규성 가정이 만족 -> 독립표본 T검정 사용
## 정규성 가정이 깨지면 -> 비모수적 방법인 윌콕슨의 순위합 검정(Wilcoxon’s rank sum test)

## 형식 : t.test(group 1의 관측치, group2의 관측치, var.equal = TRUE, paired=FALSE)

## 예제) sleep 데이타셋  - 두 수면제의 효과를 측정하기 위해서 수집한 데이터
## extra는 수면이 증가한 양, group는 두 수면제를 다르게 먹은 집단, ID는 환자의 번호
sleep
head(sleep)
str(sleep)

## 1단계) 정규성 검정
##         귀무가설: 각 집단의 수면 증가량은 정규분포를 따른다. 
##         대립가설: 각 집단의 수면 증가량은 정규분포를 따르지 않는다.

## by(데이터명$변수명, 데이터명$변수명, shapiro.test)
## - 두 집단에 대한 가설검정을 하기 위해서는 by() 함수 사용
## - by() 함수에 들어가는 첫 번째 데이터는 양적 자료, 
##   두 번째 데이터는 집단을 의미하는 질적 자료

# i) group 마다 shapiro test 실시

# group == 1
sleep[sleep$group == 1, 1]
#subset(sleep, group == 1)

# group1과 group2의 shapiro test 
shapiro.test(sleep[sleep$group == 1, 1])
shapiro.test(sleep[sleep$group == 2, 1])

# ii) by 사용하여 한꺼번에 shapiro test 
by(sleep$extr, sleep$group, shapiro.test)

# result <- by(sleep$extr, sleep$group, shapiro.test)
# result[[1]]
# result[[2]]
# names(result[[1]])
# result[[1]]$p.value
# result[[2]]$p.value

## 해석) 
## 각각 유의확률이 0.4079, 0.3511 이므로 유의 수준 0.05에서 
## 각 집단의 수면 증가량(extra)는 정규분포를 따른다고 가정할 수 있다.


## 2단계) 등분산 검정(Test for equality of variance)
## var.test(양적 자료 ~ 질적 자료)

## 귀무가설 : 두 집단의 분산은 같다(등분산) 
## 대립가설 : 두 집단의 분산은 같지 않다(이분산)

var.test(sleep$extra ~ sleep$group)

## 해석)
## 유의확률(p-value) : 0.7427 > 유의수준 0.05
## 귀무가설 채택, 즉 두 집단의 분산은 통계적으로 볼 때 같다.
## --> 등분산이 가정된 독립표본 T 검정을 실시

## 3단계) 가설1
## 귀무가설 : 두 집단 간의 수면시간에는 차이가 없다(m1=m2) 
## 대립가설 : A집단이 B집단보다 수면시간이 많다(m1>m2)

t.test(sleep$extra ~ sleep$group, 
       alternative="greater", 
       var.equal=TRUE)

# t-test 해석)
## 1. 귀무가설 : 두 집단 간의 수면시간에는 차이가 없다(m1=m2) 
##    대립가설 : A집단이 B집단 보다 수면시간이 많다(m1>m2)
# 2. 유의수준 : a = 0.05(상위 5%)
# 3. 유의확률 : p-value = 0.9604
# 4. 0.05 < 0.9604 
# 5. 판정 : 귀무가설(Ho) 채택(= 대립가설(H1) 기각)
# 6. 결론 : 두 집단 간의 수면시간에는 통계적으로 유의한 차이가 없다.

## 4단계) 가설2
## 귀무가설 : 두 집단 간의 수면시간에는 차이가 없다(m1=m2) 
## 대립가설 : A집단이 B집단 보다 수면시간이 적다(m1<m2)

t.test(sleep$extra ~ sleep$group, 
       alternative="less",
       var.equal=TRUE)

# t-test 해석)
## 1. 귀무가설 : 두 집단 간의 수면시간에는 차이가 없다(m1=m2) 
##    대립가설 : A집단이 B집단보다 수면시간이 많다(m1>m2)
# 2. 유의수준 : a = 0.05(하위 5%)
# 3. 유의확률 : p-value = 0.03959
# 4. 0.05 > 0.03959 
# 5. 판정 : 귀무가설(Ho) 기각(= 대립가설(H1) 채택)
# 6. 결론 : A집단은 B집단보다 수면시간이 통계적으로 유의하게 작다고 할수 있다.


## 5단계) 가설3
## 귀무가설 : 두 집단 간의 수면시간에는 차이가 없다. 
## 대립가설 : 두 집단 간의 수면시간은 다르다.

t.test(sleep$extra ~ sleep$group, 
       alternative="two.sided", var.equal=TRUE)

# t-test 해석)
## 1. 귀무가설 : 두 집단 간의 수면시간에는 차이가 없다 
##    대립가설 : 두 집단 간의 수면시간은 다르다.
# 2. 유의수준 : a = 0.05
# 3. 유의확률 : p-value = 0.07919
# 4. 0.05 < 0.07919 
# 5. 판정 : 귀무가설(Ho) 채택(= 대립가설(H1) 기각)
# 6. 결론 :  두 집단 간의 수면시간에는 통계적으로 유의 한 차이는 없다고 할 수 있다.

#---------------------------------------------------
# 윌콕슨의 순위합 검정(Wilcoxon’s rank sum test)
#---------------------------------------------------
 
## 두 집단의 양적 자료에 대해 각각 정규성 가정이 깨지면 사용하는 검정 

## 형식 : wilcox.test(양적 자료 ~ 질적 자료, alternative=“greater”)

wilcox.test(sleep$extra ~ sleep$group, alternative="greater", exact=F) 

## 해석) 유의확률이 0.9708로 유의수준 0.05에서 귀무가설을 기각할 수 없다. 
## 즉 두 집단 간의 수면시간에는 통계적으로 유의한 차이는 없다고 할 수 있다.

#-----------------------------------------------------
# 대응표본 t-test(paired sample t-test)
#-----------------------------------------------------

## 1) 사전과 사후 간의 차이 데이터에 대한 정규성 가정이 만족 
##     -> 대응 표본 T검정(paired t-test)
## 2) 정규성 가정이 만족하지 않으면 
##     -> 비모수적 방법인 윌콕슨의 부호 순위 검정
##        (Wilcoxon’s signed rank test) 실시

## 형식 : t.test(사전, 사후, alternative=“less”, paired=TRUE)

## 1단계) 자료 만들기 
id = 1:10 
before <- c(12.9, 13.5, 12.8, 15.6, 17.2, 19.2, 12.6, 15.3, 14.4, 11.3) 
after <- c(12.7, 13.6, 12.0, 15.2, 16.8, 20.0, 12.0, 15.9, 16.0, 11.0) 
result <- data.frame(id, before, after) 
result

## 2 단계) 정규성 검정
result$diff <- result$after - result$before
shapiro.test(result$diff)

## Shapiro-Wilk normality test

## data:  result$diff
## W = 0.89581, p-value = 0.197

## 해석) 
## 유의확률이 0.197로 나타나 유의수준 0.05에서 귀무가설을 기각할 수 없다. 
## 즉 diff 데이터는 정규성 가정을 만족한다. 
## --> 정규성 가정이 만족함으로 대응표본 T검정 실시 

## 3 단계) 대응표본 T검정
## 귀무가설 : 훈련을 받기 전과 훈련을 받은 후의 달리기 기록은 같다.
## 대립가설 : 훈련을 받기 전의 달리기 기록이 훈련 받은 후보다 더 짧다.)

t.test(result$before, result$after, alternative="less", paired=TRUE)

# t-test 해석)
## 1. 귀무가설 : 훈련을 받기 전과 훈련을 받은 후의 달리기 기록은 같다). 
##    대립가설 : 훈련을 받기 전의 달리기 기록이 훈련 받은 후보다 더 짧다
# 2. 유의수준 : a = 0.05(상위 5%)
# 3. 유의확률 : p-value = 0.4345
# 4. 0.05 < 0.4345 
# 5. 판정 : 귀무가설(Ho) 채택(= 대립가설(H1) 기각)
# 6. 결론 : 훈련을 하기 전과 훈련을 한 후 의 달리기 기록에 통계적으로 유의한 차이는 없다고 할 수 있다. 
##   즉 달리기 기록을 단 축시키는 데에 사용했던 훈련은 통계적으로 효과가 없었다고 할 수 있다.


#----------------------------------------------
# 윌콕슨의 부호 순위 검정
#----------------------------------------------
## 귀무가설 : 훈련을 받기 전과 훈련을 받은 후의 달리기 기록은 같다.
## 대립가설 : 훈련을 받기 전의 달리기 기록이 훈련 받은 후보다 더 짧다.

wilcox.test(result$before, result$after, alternative="less", 
            paired=TRUE, exact=F)

## 해석
## 유의확률이 0.5809로 나타나 유의수준 0.05에서 훈련을 하기 전과 
## 훈련을 한 후의 달 리기 기록에 통계적으로 유의한 차이는 없다고 할 수 있다. ## 즉 달리기 기록을 단축시 키는 데에 사용했던 훈련은 통계적으로 효과가 없었다고 할 수 있다.


#-------------------------------------------------------#
# 추가) 모집단이 세 개 이상 : 일원분산분석(one-way ANOVA) 
#-------------------------------------------------------#

## 일원분산분석(one-way ANOVA) 

# 데이타 읽어오기 
InsectSprays

# 회귀분석 lm()과 anova() 함수를 사용한 분석 
# 1)
ow <- lm(InsectSprays$count~InsectSprays$spray, data=InsectSprays)
anova(ow)
summary(ow)

# 2) 
oneway.test(InsectSprays$count~InsectSprays$spray, data=InsectSprays, 
            var.equal=TRUE)


#  일원분산분석 해석) 
# 1. 귀무가설(H0) : 각 살충제의 효과는 같다.
#    대립가설(H1) : 적어도 한개의 살충제는 효과가 다르다. 
# 2. 유의 수준 : 0.05
# 3. 유의 확률 : p-value = 2.2e-16
# 4. 0.05 > 2.2e-16
# 5. 판정 : 귀무가설(Ho) 기각 (= 대립가설(H1) 채택 )
# 6. 결론 : 일원분산분석으로 나이 차이를 검정한 결과, 살춫제의 효과는 서로 다르다.

#----------------------------------
# Kruskal-Wallis 검정
#----------------------------------
## 1단계) 가설설정 
## 귀무가설 : 살충제의 종류(A~F)에 따라 살충효과는 없다. 
## 대립가설 : 살충제의 종류에 따라 살충효과가 있다.

## 형식 : kruskal.test(양적 자료 ~ 질적 자료, data=데이터명)

kruskal.test(count ~ spray, data=InsectSprays)

## 해석) 유의확률이 1.511e-1이므로  살충제의 종류에 따라  
##       통계적으로 유의한 살충 효과가 있다고 할 수 있다.

#----------------------------------------------
# 패키지를 활용한 비모수적 검정에서의 다중비교
#----------------------------------------------
install.packages("nparcomp") 
require(nparcomp)

## 결과물 = nparcomp(양적 자료 ~ 질적 자료, data=데이터명,type=“다중비교 방법”) 
## summary(결과물)

out = nparcomp(count ~ spray, data=InsectSprays, type="Tukey") 
summary(out)

## 해석)
## 모수적 방법과 동일한 결과로 (F, B, A) 살충제가 (E, D, C) 살충제보다 
## 살충 효과가 더 큰 것으로 나타났다.


#------------------------------------------#
# 교차분석(카이제곱검정)
#------------------------------------------#
## 두 질적 자료 간의 관련성이 있는지를 검정하는 통계분석 방법
## gmodels 패키지의  CrossTable() 함수 사용

install.packages("gmodels")
library(gmodels)

## 예제) infert 데이타
## 귀무가설 : 교육정도와 유산유무는 관련성이 없다. 
## 대립가설 : 교육정도와 유산유무는 관련성이 있다.

head(infert)

CrossTable(infert$education,  # 교육정도 
           infert$induced,    # 유산유무 
           expected = TRUE,   # 기댓값 출력 
           chisq=TRUE,        # 카이제곱 검정통계량 출력 
           fisher=TRUE)       # Fisher’s exact test(정확성 검정) 출력

## 해석)
## 카이제곱 16.5305이고, 유의확률이 0.002383898이므로 
## 교육정도와 유산유무에는 통계적으로 유의한 관련성이 있다고 할 수 있다.


#------------------------------------------#
# 정확성검정
#------------------------------------------#
## 카이제곱검정 결과에서 기대빈도가 5 이하인 셀이 20%를 넘어가면 
## Fisher의 정확성검정(Fisher’s exact test)을 사용한다.

fisher.test(table(infert$education, infert$induced))

## 해석)
## 유의확률이 0.00782이므로 교육정도와 유산유무에는 
## 통계적으로 유의한 관련성이 있다고 할 수 있다.



#------------------------------------------#
# 정규성 검정 : shapiro.test(), Q-Q plot
#------------------------------------------#
## 표본이 정규분포로 된 모집단에서 나온 것인지 아닌지를 검정하는 방법

# 1) shapiro.test()
shapiro.test(iris$Sepal.Length)

# 정규성 검정 해석)
# 1. 귀무가설(H0) : 모집단이 정규분포를 따른다.
#    대립가설(H1) : 모집단이 정규분포를 따르지 않는다..
# 2. 유의 수준 : 0.05
# 3. 유의 확률 : p-value = 0.01018
# 4. 0.05 > 0.01018
# 5. 판정 : 귀무가설(Ho) 기각(= 대립가설(H1) 채택)
# 6. 결론 : Sepal.Length는 모집단이 정규분포를 따르고 있지 않다.


# 2) Q-Q plotd으로 정규성 검정
## 데이타 크기가 크지 않다면 Q-Q plot이 정규성 검정에 가장 간단, 직관적
qqnorm(iris$Sepal.Length)
qqline(iris$Sepal.Length)

## QQplot의 점들이 기울기의 직선상에 놓이면 자료가 해당 분포를 
## 잘 따르거나 모집단 분포가 같다고 해석할 수 있다.
## 즉, 점들이 라인을 따라 잘 붙어있으면 정규성을 따른고 할 수 있다.

