head(mtcars,5)
wt <- mtcars$wt
mpg <- mtcars$mpg
wt
mpg

plot(wt,mpg,
     main='중량-연비 그래프',
     xlab='중량',
     ylab='연비(MPG)',
     col='red',
     pch=11)


## 여러 변수 사이의 산점도 : pairs()

library(ggplot2)

colnames(mtcars)
vars <- c('mpg','disp','drat','wt')
target <- mtcars[,vars]
target
head(target)

pairs(target,
      main='Multi Plots')


##iris 데이타셋으로 여러 변수 사이의 산점도 그리기
iris.2 <- iris[,3:4]
head(iris)
point <- as.numeric(iris$Species) #점의 모양
point
pairs(iris[,1:4])


##그룹 정보가 있는 두 변수의 산점도 : plot()

iris.2 <- iris[,3:4]
iris.2
head(iris.2)

str(iris$Species)  #structure
point <- as.numeric(iris$Species)
point

color <- c('red','green','blue')
plot(iris.2,
     main='Iris Plot',
     pch=c(point),
     col=color[point])

##그래프 해석
##-그룹의 정보 시각화
##- 두 변수간의 관계 시각화

month <- 1:12
late=c(5,8,7,9,4,6,12,13,8,6,6,4)
late

#선 그래프 그리기

plot(month,
     late,
     main='지각생통계',
     type='l', #그래프의 종류 선택(알파벳)
     lty=1, #선의 종류 (line type)
     lwt=1, #선의 굵기(line width)
     xlab='Month',
     ylab='Late cnt'
     )


##복수의 선 그래프 그리기
late2 <- c(4,6,5,8,7,8,10,11,6,5,7,3)

plot(month,
     late,
     main='Late Students',
     type='b',
     lty=1,
     col='red',
     xlab='Month',
     ylab='Late cnt',
     ylim=c(1,15))



lines(month,
      late2,
      type='b',
      col='blue')

#### 상관분석과 상관계수

### 음주정도와 혈중알콩농도에 대한 상관분석

beers <- c(5,2,9,8,3,7,3,5,3,5)
length(beers)
bal <- c(0.1,0.03,0.19,0.12,0.04,0.0095,0.07,0.06,0.02,0.05)
length(bal)

### 데이터 프레임 형성

tbl <- data.frame(beers,bal)
tbl

### 두 변수 산의 산점도
plot(tbl$beers,tbl$bal)

### 공분산 계산 (공분산이란? <- )

cov(tbl)
cov(beers,bal)


##상관계수 계산
cor(tbl)
cor(beers,bal)

##회귀식 도출 (상관계수에서 상관관계를 발견했을때만!)
##회귀는 무조건 둘다 연속적인 데이터!

res <- lm(bal~beers, data=tbl)
res  ##(y=ax+b 에서, Intercept = b, beers = a )
summary(res)


##회귀선 그리기
plot(bal~beers, data=tbl)
abline(res)

##결정계수 구하기
anova(res)
#sum sq 열에서 설명 한 것! (0.1012450) + 설명 못한것 (0.0.14499) 더해서 분모로, 그리고 분자에 설명한것 !
0.012450/(0.012450+0.014499)

###iris 4개 변수 간 상관성 분석

cor(iris[,1:4])
cor(iris$Petal.Length, iris$Petal.Width)


###보스턴 주택 가격 예측

install.packages('mlbench')
library(mlbench)

data('BostonHousing')  ##메모리에 올려주는것
data
head('BostonHousing')
dim(BostonHousing)
str(BostonHousing)


##관심있는 5개 컬럼만 추출하여 데이터 프레임 생성

myds <- BostonHousing[,c('crim','rm','dis','tax','medv')]
head(myds)


## grp 파생변수 추가

##주택가격 myds$medv 값에 따라 그룹 분류

summary(myds$medv)

grp <- c()
for (i in 1:nrow(myds)){
    if (myds$medv[i]>=25.0){
        grp[i] <- 'H'
    }else if (myds$medv[i]<=17.0){
        grp[i] <- 'L'
    }else{
        grp[i] <- 'M'
    }
}

grp
class(grp)

##문자벡터를 팩터 타입으로 변경 (왜? 숫자 세기 위해)
grp <- factor(grp)
str(grp)
grp <- factor(grp, levels=c('H','M','L')) #레벨의 순서 변경
grp


#myds 데이타프레임에 새로 생성한 grp 컬럼추가

myds <- data.frame(myds,grp)

## (3) Add new column
## ( 데이타셋 형태와 기본적인 내용 파악)

str(myds)
head(myds)


# 주택 가격 그룹별 분포 파악(개수세기)
table(myds$grp)

##histogram
#( 히스토그램에 의한 관측값의 분포 확인)

par(mfrow=c(2,3))  ##2x3 가상화면 분할할
for ( i in 1:5){
    hist(myds[,i], main=colnames(myds)[i],col='yellow')
}
par(mfrow=c(1,1))

par(mfrow=c(2,3))  ##2x3 가상화면 분할할
for ( i in 1:5){
    boxplot(myds[,i], main=colnames(myds)[i],col='yellow')
}
par(mfrow=c(1,1))

##6) boxplot by group
#(그룹과 관측값 분포의 확인)
boxplot(myds$crim,main='1인당 범죄율')

boxplot(myds$crim~myds$grp, main='1인당 범죄율율')
boxplot(myds$rm~myds$grp, main='방의수')
boxplot(myds$dis~myds$grp, main='직업센터까지의 거리리')
boxplot(myds$tax~myds$grp, main='재산세')


#scatter plot (다중 산점도를 통한 변수 간 상관관계의 확인)

pairs(myds[,-c(5,6)])
myds
#8) scatter plot with group
#(그룹정보를 포함한 변수 간 상관관계 확인)

point <- as.integer(myds$grp) #점의 모양 지정
color <- c('red','green','blue') #색 지정
pairs(myds[,-6],pch=point, col=color[point])



##(9) correlation coefficient (변수 간 상관계수 확인)

cor(myds[,-6])
cor(myds$rm,myds$medv)

##상관계수 시각화
#psych 패키치 설치 및 로드
# install.packages('psych')
library(psych)

pairs.panels(myds[,-6])

#(10) 선형 회귀 분석

lm <- lm(medv~rm, data=myds)
summary(lm)         

#(11) 다중 회귀 분석

colnames(myds)
lm <- lm(medv~crim+rm+dis+tax,data=myds)
summary(lm)

##dis 가 관계가 없으므로 삭제!
lm <- lm(medv~crim+rm+tax,data=myds)
summary(lm)


###plot
plot(medv~rm, data=myds)
abline(lm)

#예측 : rm=12 일 경우
medv = -34.671 + 9.102 *12
medv

#신뢰구간
confint(lm)

#잔차 확인
plot(lm)  #(Q-Q plot이 일직선에 가까워야함!)

par(mfrow=c(2,2))
plot(lm)
par(mfrow=c(1,1))

myds$rm

##여러 개 예측하기

df <- data.frame(rm=c(5,6,7))
predict(lm,df)
