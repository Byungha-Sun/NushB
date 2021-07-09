#------------------------------------------#
# 빅데이타 분석/시각화 with R
#------------------------------------------#

#------------------------------------------#
# 다중변수 자료의 탐색 - code06
#------------------------------------------#

#------------------------------------------#
# 1. 산점도  
#------------------------------------------#
#------------------------------------------#
# 1) 두 변수 사이의 산점도 : plot() 
#------------------------------------------#

# mtcars 데이타 셋을 이용한 산점도
head(mtcars, 5)

wt <- mtcars$wt                   # 중량 자료
mpg <- mtcars$mpg                # 연비 자료

# 중량-연비 산점도
plot(wt, mpg,                    # 2개 변수(x축, y축)   
     main="중량-연비 그래프",    # 제목
     xlab="중량",                # x축 레이블
     ylab="연비(MPG)",           # y축 레이블
     col="red",                  # point의 color
     pch=11)                     # point의 종류 

#------------------------------------------#
# 2) 여러 변수 사이의 산점도 : pairs() 
#------------------------------------------#
colnames(mtcars)
vars <- c("mpg","disp","drat","wt")    # 대상 변수 선택  
target <- mtcars[,vars]
head(target)

pairs(target,                          # 대상 데이터     
      main="Multi Plots") 

# iris 데이타셋으로 여러 변수 사이의 산점도 그리기
head(iris)
pairs(iris[, 1:4])
plot(iris[, 1:4])    # 위와 동일

#----------------------------------------------#
# 3) 그룹 정보가 있는 두 변수의 산점도  : plot() 
#----------------------------------------------#
iris.2 <- iris[,3:4]                # 변수 선택
head(iris.2)

iris[,5]
str(iris$Species)

point <- as.numeric(iris$Species)   # 점의 모양
point                               # point 내용 출력

color <- c("red","green","blue")    # 점의 컬러 지정

plot(iris.2, 
     main="Iris plot",
     pch=c(point),
     col=color[point]) 

plot(iris.2, 
     main="Iris plot") 
# 그래프 해석 
## - 그룹의 정보 시각화
## - 두 변수간의 관계 시각화

#------------------------------------------#
# 2. 선 그래프  
#------------------------------------------#

#------------------------------------------#
# 어느 학급의 월별 지각성 통계 
#------------------------------------------#

month = 1:12                             # 월 자료
late  = c(5,8,7,9,4,6,12,13,8,6,6,4)     # 지각생 수

# 선 그래프 그리기
plot(month,                              # x data
     late,                               # y data
     main="지각생 통계",                 # 제목 
     type= "l",                          # 그래프의 종류 선택(알파벳) 
     lty=1,                              # 선의 종류(line type) 선택
     lwd=1,                              # 선의 굵기 선택
     xlab="Month",                       # x축 레이블
     ylab="Late cnt"                     # y축 레이블
)

# type 변경
plot(month,                              # x data
     late,                               # y data
     main="지각생 통계",                 # 제목 
     type= "b",                          # 그래프의 종류 선택(알파벳) 
     lty=1,                              # 선의 종류(line type) 선택
     lwd=1,                              # 선의 굵기 선택
     xlab="Month",                       # x축 레이블
     ylab="Late cnt"                     # y축 레이블
)

plot(month,                              # x data
     late,                               # y data
     main="지각생 통계",                 # 제목 
     type= "s",                          # 그래프의 종류 선택(알파벳) 
     lty=1,                              # 선의 종류(line type) 선택
     lwd=1,                              # 선의 굵기 선택
     xlab="Month",                       # x축 레이블
     ylab="Late cnt"                     # y축 레이블
)

plot(month,                              # x data
     late,                               # y data
     main="지각생 통계",                 # 제목 
     type= "o",                          # 그래프의 종류 선택(알파벳) 
     lty=1,                              # 선의 종류(line type) 선택
     lwd=1,                              # 선의 굵기 선택
     xlab="Month",                       # x축 레이블
     ylab="Late cnt"                     # y축 레이블
)


#------------------------------------------#
# 복수의 선 그래프 그리기
#------------------------------------------#

# 월 자료와 지각생 수 입력
month = 1:12  
late1  = c(5,8,7,9,4,6,12,13,8,6,6,4)
late2  = c(4,6,5,8,7,8,10,11,6,5,7,3)

# 복수의 선 그래프 그리기 
plot(month,                                # x data
     late1,                                # y data
     main="Late Students",
     type= "b",                            # 그래프의 종류 선택(알파벳) 
     lty=1,                                # 선의 종류(line type) 선택
     col="red",                            # 선의 색깔 선택          
     xlab="Month ",                        # x축 레이블
     ylab="Late cnt",                      # y축 레이블
     ylim=c(1, 15)                         # y축 값의 (하한, 상한)
)

lines(month,                               # x data
      late2,                               # y data
      type = "b",                          # 선의 종류(line type) 선택
      col = "blue")                        # 선의 색깔 선택


#------------------------------------------#
# 3. 상관분석과 상관계수
#------------------------------------------#

#------------------------------------------#
# 음주정도와 혈중알콜농도에 대한 상관분석
#------------------------------------------#
beers <- c(5,2,9,8,3,7,3,5,3,5)                 # 음주 정도 자료 
bal <- c(0.1,0.03,0.19,0.12,0.04,0.0095,0.07,   # 혈중 알콜 농도 자료
         0.06,0.02,0.05)
length(beers)

# 데이터프레임 생성
tbl <- data.frame(beers, bal)                  
tbl  

# 두 변수 간의 산점도
#plot(bal~beers, data=tbl)                        
plot(tbl$beer, tbl$bal)

# 공분산 계산
cov(tbl)
cov(beers, bal)

# 상관계수 계산
cor(tbl)
cor(beers, bal)  

# 회귀식 도출
res <- lm(bal~beers, data=tbl)                  
res
summary(res)

# 결정계수 구하기
anova(res)
0.012450/(0.012450+0.014499)

# 회귀선 그리기
plot(bal~beers, data=tbl)  
abline(res)                                    


#------------------------------------------#
# iris 4개 변수 간 상관성 분석  
#------------------------------------------#
cor(iris[,1:4]) 
cor(iris$Petal.Length, iris$Petal.Width)



#---------------------------------------------------#
# 데이타 탐색(EDA) 실습 : 보스톤 주택가격 예측
#---------------------------------------------------#
# BostonHousing 데이타셋 
## mlbench 패키지에서 제공
## medv(주택가격)이 목표 변수(종속 변수)

#---------------------------------------------------#
# (1) Prepare Data
#     (분석 대상이 되는 데이타셋 준비)
#---------------------------------------------------#
#install.packages("mlbench")
library(mlbench)

data("BostonHousing")
head(BostonHousing)
dim(BostonHousing)
str(BostonHousing)

# 관심있는 5개 컬럼만 추출하여 데이타프레임 생성
myds <- BostonHousing[,c("crim","rm","dis","tax","medv")]

#---------------------------------------------------#
# (2) Add new column 
#     (grp 파생변수 추가)
#---------------------------------------------------#

# 주택가격 myds$medv 값에 따라 그룹 분류
summary(myds$medv)

grp <- c()
nrow(myds)
for (i in 1:nrow(myds)) {                   
    if (myds$medv[i] >= 25.0) {
        grp[i] <- "H"
    } else if (myds$medv[i] <= 17.0) {
        grp[i] <- "L"
    } else {
        grp[i] <- "M"
    }
}

grp
class(grp)

# 문자벡터를 팩터 타입으로 변경
grp <- factor(grp)  
str(grp)
grp <- factor(grp, levels=c("H","M","L"))   # 레벨의 순서 변경 H,L,M -> H,M,L

# myds 데이타프레임에 새로 생성한 grp 컬럼추가
myds <- data.frame(myds, grp)               

#---------------------------------------------------#
# (3) Add new column 
#     (데이타셋 형태와 기본적인 내용 파악)
#---------------------------------------------------#
str(myds)  
head(myds)

# 주택 가격 그룹별 분포 파악(개수 세기)
table(myds$grp) 

#---------------------------------------------------#
# (4) histogram
#     (히스토그램에 의한 관측값의 분포 확인)
#---------------------------------------------------#
par(mfrow=c(2,3))   # 2x3 가상화면 분할
for(i in 1:5) {
    hist(myds[,i], main=colnames(myds)[i], col="yellow")
}

par(mfrow=c(1,1))   # 2x3 가상화면 분할 해제                      

#---------------------------------------------------#
# (5) boxplot 
#     (상자 그림에 의한 관측값의 분포 확인)
#---------------------------------------------------#
par(mfrow=c(2,3))    # 2x3 가상화면 분할                          
for(i in 1:5) {
    boxplot(myds[,i], main=colnames(myds)[i])
}
par(mfrow=c(1,1))    # 2x3 가상화면 분할 해제

#---------------------------------------------------#
# (6) boxplot by group
#     (그룹별 관측값 분포의 확인)
#---------------------------------------------------#
boxplot(myds$crim, main="1인당 범죄율")

boxplot(myds$crim~myds$grp, main="1인당 범죄율")
boxplot(myds$rm~myds$grp, main="방의  수")
boxplot(myds$dis~myds$grp, main="직업센터까지의 거리")
boxplot(myds$tax~myds$grp, main="제산세")

#---------------------------------------------------#
# (7) scatter plot 
#     (다중 산점도를 통한 변수 간 상관관계의 확인)
#---------------------------------------------------#
pairs(myds[,-6])

#---------------------------------------------------#
# (8) scatter plot with group
#     (그룹정보를 포함한 변수 간 상관관계 확인)
#---------------------------------------------------#
point <- as.integer(myds$grp)                 # 점의 모양 지정
color <- c("red","green","blue")              # 점의 색 지정   
pairs(myds[,-6], pch=point, col=color[point])

#---------------------------------------------------#
# (9) correlation coefficient
#     (변수 간 상관계수 확인) 
#---------------------------------------------------#
cor(myds[,-6])
cor(myds$rm, myds$medv)

# 상관계수 시각화 
# psych 패키지 설치 및 로드
#install.packages("psych")
library(psych)

pairs.panels(myds[,-6]) 

#---------------------------------------------------#
# (10) 선형 회귀 분석
#---------------------------------------------------#
lm <- lm(medv~rm, data=myds)                  
summary(lm)

# 선형회귀식 
# medv = -34.671 + 9.102 * rm

# 회귀선 그리기
plot(medv~rm, data=myds)  
abline(lm) 

# 예측 : rm=12 일 경우 
medv = -34.671 + 9.102 * 12
medv

# 예측 : rm=6, 6, 7일 경우 
df <- data.frame(rm = c(5, 6, 7)) 
predict(lm, df)

# 신뢰구간
confint(lm)

# 잔차 확인
plot(lm) 

par(mfrow = c(2,2))
plot(lm) 
par(mfrow = c(1,1)) 

myds$rm


#---------------------------------------------------#
# (11) 다중 회귀 분석
#---------------------------------------------------#
colnames(myds)
lm <- lm(medv~crim+rm+dis+tax, data=myds) 
summary(lm)

lm <- lm(medv~crim+rm+tax, data=myds) 
summary(lm)


