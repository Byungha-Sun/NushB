plot(cars, type='p', main='cars')
plot(cars, type='l', main='cars')
plot(cars, type='b', main='cars')
plot(cars, type='h', main='cars')

x <- c(9,15,20,6)
label <- c('영업 1팀','영업 2팀','영업 3팀','영업 4팀')
pie(x, labels=label, main='부서별 영업 실적 1')
#기준선 변경- 기준선을 수직으로 변경

# install.packages('treemap')
library(treemap)

data("GNI2014")
head(GNI2014)
treemap(GNI2014,
        index=c('continent','iso3'),
        vSize='population',
        vColor='GNI',
        type='value',
        format.legend = list(scientific=FALSE,big.mark=' '))


st <- data.frame(state.x77)
symbols(st$Illiteracy, st$Murder,
        circles=st$Population,
        inches=0.3,
        fg='white',
        bg='lightgray',
        lwd=1.5,
        xlab='rate of Illiteracy',
        ylab ='crime(murder) rate',
        main='Illiteracy an Crime')

mosaicplot(~gear+vs, data=mtcars, color=TRUE, main='Gear and Vs')

mosaicplot(~gear+vs, data=mtcars,color=c('green','navy'),main='Gear and Vs')

#~gear+ vs  ~다음의 변수가 x축  + 다음이 y축

library(ggplot2)

#ggplot 그래프 그리기

#1) 데이타프레임, x축 displ, y축 hwy로 지정해 배경 생성

ggplot(data=mpg,aes(x=displ,y=hwy))

#2)배경에 산점도 추가
ggplot(data=mpg, aes(x=displ,y=hwy)) + geom_point()

#3)색상을 발가색으로 적용하여 산점도 그리기 
ggplot(data=mpg, aes(x=displ,y=hwy)) + geom_point(size=3, color='red')

#4)x축 범위 3~6으로 지정
ggplot(data=mpg, aes(x=displ,y=hwy)) + geom_point(size=3, color='red')+xlim(3,6)

#5)y축 범위 10~30으로 지정
ggplot(data=mpg, aes(x=displ,y=hwy)) + geom_point(size=3, color='red')+xlim(3,6)+ylim(10,30)


#geom_point 응용
getwd()
setwd('c:/Rstudy/data')
data1 <- read.csv('사원별판매현황_홍길동.csv')

geom_point()
gg3 + scale_x_discrete(limit=days)
gg3 <- ggplot(data1, aes(x=요일, y=실적)) + geom_point(shape=21, aes(size=실적),fill='red')
gg3 + scale_x_discrete(limit=days)

data2 <- read.csv('사원별판매현황_전체.csv')

days2 <- unique(data2$요일)
gg2 <- ggplot(data2,aes(x=요일,y=실적, group=이름,color=이름)) + geom_line(aes(linetype=이름),size=1) + geom_point(shape=22,aes(size=실적),fill='red')
gg2+ scale_x_discrete(limit=days2)


#구동방식(drv) 별 평균 고속도로 연비(hwy)구하기
library(dplyr)
df_mpg <- mpg %>% 
    group_by(drv) %>% 
    summarise(mean_hwy = mean(hwy))
df_mpg

#막대그래프 생성하기
ggplot(data=df_mpg, aes(x=drv,y=mean_hwy)) + geom_col()

#3 크기 순으로 정렬하기 : 기준변수 > 내림차순

ggplot(data=df_mpg, aes(x=reorder(drv,-mean_hwy),y=mean_hwy)) +geom_col()
