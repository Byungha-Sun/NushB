#------------------------------------------#
# R을 이용한 빅데이타 분석∙시각화 
#------------------------------------------#

#------------------------------------------#
# 기술통계, 추론(검정) 통계 - code12-2
#------------------------------------------#

##################################
# 상관분석
##################################

#------------------------------------------#
# 상관분석    
#------------------------------------------#

## cars 데이터 - speed:속도, dist:제동거리
head(cars)

## 1단계) 산점도(scatter plot) 그리기 
plot(cars$speed, cars$dist)

## 해석)
## 자동차의 속도(speed)가 높아질수록 자동차의 제동거리(dist)는 증가하는 경향을 
## 볼 수 있다. --> 상관계수 

## 2단계)
## 상관계수 - 모수적 방법:Pearson, 비모수적 방법:Kendall과 Spearman
## cor(데이터명$변수명, 데이터명$변수명, method=c(“pearson”, 
##                                    “kendall”, “spearman”))
cor(cars$speed, cars$dist, method="pearson")
# 0.8068949
## 해석)
## 상관관계가 0.8068949으로
## 자동차의 속도와 제동거리 간에는 매우 높은 상관관계가 있다고 할 수 있다

## 3단계) 상관분석 - 두 양적 자료 간의 관련성(직선의 관계=선형의 관계)가 있는지를 검정 
## 1) 가설 설정
## 귀무가설 : 두 양적 자료 간에 관련성이 없다. 
## 대립가설 : 두 양적 자료 간에 관련성이 있다.
## cor.test(데이터명$변수명, 데이터명$변수명, method=c(“pearson”, “kendall”, “spearman”))

cor.test(cars$speed, cars$dist, method="pearson")

# p-value = 1.49e-12

## 해석) 
## 유의확률이 거의 0에 가까운 값이므로 유의수준 0.05에서 
## 자동차의 속도와 제동거리 간에는 통계적으로 유의한 양의 상관관계가 있다고 할 수 있다

#------------------------------------------#
# 산점 행렬도(scatter plot matrix)  
#------------------------------------------#
## 여러 개의 양적 자료에 대한 산점도를 하나의 그래프로 보여주는 것
## plot(data frame) 또는 pairs(data frame)

plot(iris[ , 1:4])

pairs(iris[ , 1:4])

#------------------------------------------#
# 상관계수 행렬  
#------------------------------------------#
## 여러 개의 양적 자료 간의 상관계수를 알아보기 위해서 cor() 함수 사용
## cor(data frame)
cor(iris[ , 1:4])
cor(iris[ , -5])


#------------------------------------------#
# 유용한 패키지들
#------------------------------------------#
## 1) Hmisc::rcorr() 
## rcorr() 함수
## rcorr(as.matrix(data frame), type=c(“pearson”,“spearman”))
## - 여러 개의 양적 자료에 대한 상관계수와 유의확률을 한 번에 구해준다. 
## - rcorr() 함수에 사용되는 데이터의 형태는 행렬(matrix)이어야 한다. 
## - as.matrix() 함수 사용 

install.packages("Hmisc") 
library(Hmisc) 

rcorr(as.matrix(iris[ , 1:4]), type="pearson")

## 2) psych::corr.test() 
## 상관계수와 유의확률을 한 번에 구해주는 함수
## corr.test() 함수는 데이터 프레임이 들어간다.
## corr.test(data frame, method=c(“pearson”, “spearman”, “kendall”))

install.packages("psych") 
library(psych) 

corr.test(iris[ , 1:4], method="pearson")


# 3) corrplot::corrplot()
# corrplot 패키지의 corrplot() 함수 - 산점  행렬도 작성
# 형식 : corr.test(dataframe)

install.packages("corrplot")
library(corrplot)

# i) 시각화 방법
result = cor(iris[ ,1:4])

corrplot(result, method="circle")
corrplot(result, method="square")
corrplot(result, method="ellipse")
corrplot(result, method="number")
corrplot(result, method="shade")
corrplot(result, method="color")
corrplot(result, method="pie")

# 4) corrgram::corrgram()
install.packages("corrgram")  
library(corrgram)

corrgram(iris[,-5])  
# 색상적용-동일색상으로 그룹화표시
corrgram(iris[,-5], upper.panel = panel.conf) 
# 상관계수 위쪽에 추가 
corrgram(iris[,-5], upper.panel = panel.ellipse)


##################################
# Quiz - 상관분석 
##################################
## 아버지와 아들 키의 상관분석 

# 데이타 읽어오기 - UsingR 패키지 
#install.packages("ggplot2")
library(ggplot2)
install.packages("UsingR")
library(UsingR)

# galton 데이터- 928개의 부모의 키와 아이의 키에 대한 자료
# 부모의 키 = 아빠의 키와 1.08*엄마의 키의 산술평균
head(galton)
dim(galton)

# 데이타 탐색
dim(galton)
str(galton)
summary(galton)

# 자료들의 분포 파악 
par(mfrow=c(1,2))
hist(galton$child,col="blue",breaks=100)  
hist(galton$parent,col="blue",breaks=100)
par(mfrow=c(1,1))

# 산점도 그리기 
plot(galton$child, galton$parent) 

# 표본공분산 계산 
cov(galton$child, galton$parent) 

# 표본상관계수 계산 
# method = c("pearson", "kendall", "spearman")
cor(galton$child, galton$parent) 

cor(galton$child, galton$parent, method = "pearson") 

# 상관 분석 
cor.test(galton$child, galton$parent, 
         method = "pearson")
#p-value < 2.2e-16

## 상관계수 유의성(상관분석) 검정 해석)
# 1) 귀무가설(H0) : 상관계수가 0이다.
#    대립가설(H1) : 상관계수가 0이 아니다.
# 2) 유의수준 = 0.05
# 3) 유의확률 :  p-value < 2.2e-16
# 4) 0.05 > 2.2e-16
# 5) 판단 : 귀무가설(H0) 기각(대립가설(H1) 채택)
# 6) 결론 : child와 parent 변수 간에는 매우 유의한 상관관계가 있다.


############################################
## 회귀분석 
############################################

## 1. 단순선형회귀분석

## 형식 : 회귀분석 결과물 = lm(종속변수 ~ 독립변수, data=데이터명) 
##        summary(회귀분석 결과물)

## cars 데이타셋

# 데이타 기초 분석
str(cars)
head(cars)

# plot 그리기
dev.off()  #plot창 초기화 
plot(dist~speed, data=cars)
cor(cars$dist, cars$speed)
cor.test(cars$dist, cars$speed)
# 단순회귀분석
rm(result)
data(cars)
result <- lm(cars$dist ~ cars$speed, 
             data=cars) 
result
summary(result)

# dist=3.932*speed-17.579

## 회귀분석의 결과의 해석
# 1) 회귀모형의 타당성 
# F통계량이 89.57이고, 유의확률이 1.49e-12이므로 자동차의 속력으로 자동차의 제동거리를   
# 설명하려는 회귀모형은 통계적으로 타당하고 판단
# 2) 독립변수(설명변수)의 유의성
# - 독립변수인 speed(속도)가 종속변수인 dist(제동거리)에 통계적으로 유의한 영향을 미치는가에   
# 대한 통계적 검정으로 유의확률이 1.49e-12이므로 독립변수인 speed(속도)가 종속변수인 
# dist(제동거리)에 통계적으로 유의한 영향을 미치는 것으로 판단
# 3) 회귀계수 
# -  독립변수의 회귀계수(Estimate)는 3.9324으로 추정되었으며, 이 값는 독립변수의 기본단위 1 
# 증가하면 종속변수는 약 3.9324 정도 증가한다는 뜻이다. 즉 자동차의 속도가 1 증가하면 제
# 동거리는 약 3.9324 정도 증가 한다는 의미이다.
# 4) R2(결정계수) 
# - R2  회귀모형의 설명력, 즉 독립변수가 종속변수를 설명하는 정도로서 0.6511로 나타났고, 
# 이것은 독립변수가 종속변수를 약 65.1% 정도 설명한다는 뜻이다. 즉 자동차의 속도가 자동차의 제동
# 거리를 약 65.1% 설명한다는 의미이다.

# 단순선형회귀모형 : dist = -17.5791 + 3.9324 * speed

# 예측 : 속도가 12이면 제동거리는?
# dist = -17.5791 + 3.9324 * 12
-17.5791 + 3.9324 * 12 # 29.6097

# 정확도 계산 
speed <- cars[,1]
speed

pred <- 3.932 * speed - 17.579
pred

compare <- cbind(pred, cars[,2], 
                 abs(pred-cars[,2]))


# (예측값, 실제값, 예측값-실제값 차이) 
compare

# plot과 선형회귀모형 그리기 
plot(dist~speed, data=cars)
abline(coef(result), col="red")

## ggplot2
library(ggplot2)
ggplot(data=cars, aes(x=dist, y=speed)) +
    geom_count() +
    geom_smooth(method="lm")

# 회귀분석의 가정
par(mfrow=c(2,2))
plot(result)
par(mfrow=c(1,1))


# 회귀모델 성능평가 - MSE, RMSE..
summary(result)$r.squared           # 결정계수 R^2  0.6510794
mean(summary(result)$resid^2)       # MSE 227.0704
sqrt(mean(summary(result)$resid^2)) # RMSE 15.06886
n <- dim(cars)[1]           # n = 50
AIC(result)/n                       # 8.383137

###########################################
## 2. 다중회귀분석
###########################################
# 독립변수 k개로 종속변수 1개를 설명하는 것
# 형식 : 회귀분석 결과물 = lm(종속변수 ~ 독립변수1 + 독립변수2 + ... + 독립 변수k, data=데이터명) 
#         summary(회귀분석 결과물)

## attitude 데이타셋
head(attitude)
str(attitude)
result = lm(rating ~ complaints + privileges + learning + raises + critical + advance,
            data=attitude) 
summary(result)

# 다중회귀분석의 결과의 중요한 해석 
# 1) 회귀모형의 타당성
# -  F통계량이 10.5이고, 유의확률이 1.24e-05이므로 complaints, privileges, learning, raises, critical, 
# advance라는 6개의 독립변수로 rating이라는 종속변수를 설명하는 회귀모형은 통계적으로 타당 하고 
# 판단 
# 2) 독립변수의 유의성 
# - complaints라는 독립변수만이 rating이라는 종속변수에 통계적으로 유의한 영향을 미치는 것으로 나타났다
# (유의확률이 0.00090임). 
# 3) 회귀계수 
# -  다른 독립변수들이 고정되었을 때에 complaints의 기본단위가 1 증가하면 rating이라는 종속변수는 약 
# 0.61319 정도 증가한다.
# 4) R2(결정계수)
# - R2은 회귀모형의 설명력, 6개의 독립변수가 rating이라는 종속변수를 약 73.3%(0.7326) 설명하는 것으로 나타났다
# 5) Adjusted R2 (수정된 결정계수) 
# -  R2 은 종속변수를 설명할 수 있는 독립변수의 개수 가 증가할수록 커지는 경향을 보인다. 이때 종속변수에 유의한 영향을 
# 주는 독립변수가 들어오면 R2 가 증가하고, 유의하지 않은 독립변수가 들어오면 R2 가 증가하지 않도록 조정한 것으로 수정
# 된 결정계수라고 한다. 다중회귀분석에서는 회귀모형의 설명력은 수정된 결정계수로 보는 것이 더 바람직하다. 여기서는
# 0.6628이므로 6개의 독립변수들이 rating이라는 종속변수를 약 66.3% 정 도 설명한다고 할 수 있다

# 3. 다중회귀분석의 고려사항 – 변수 선택, 다중공선성
# 1) 변수 선택 : step() 함수 
# 형식 :  단계선택 결과물 = step(회귀분석 결과물, direction=c(“both”, “forward”, “backward”)) 
# summary(단계선택 결과물)

output = step(result, direction="both") 
summary(output)


### 수정된 다중회귀분석 
result = lm(rating ~ complaints + learning, data = attitude)
summary(result)


# 2) 다중공선성 - car 패키지의  vif() 함수 사용
# 형식 :  vif(회귀분석 결과물) 

install.packages("car") 
library(car)

vif(result) 

## 해석)
## vif 값이 모두 10 미만으로 독립변수들 간의 다중공선성은 존재하지 않는다고 판단한다.


# 3) 표준화된 회귀계수  -  lm.beta 패키지의 lm.beta() 함수
# 여러 개의 독립변수들이 종속변수에게 통계적으로 유의한 영향을 줄 때에 어떤 독립변수가 영향력을 더 크게 주는지를 알고 싶으면 표준화된 회귀계수를 보면 된다. 
# 표준화된 회귀계수의 절대값이 가장 큰 독립변수가 종속변수에게 가장 큰 영향을 주는 것이 된다. 

install.packages("lm.beta") 
library(lm.beta)

lm.beta(result) 

