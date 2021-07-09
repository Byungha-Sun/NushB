library(dplyr)

#2)데이터프레임 생성
df_raw <- data.frame(var1=c(1,2,1),
                     var2=c(2,3,2))
df_raw

#3) 데이터프레임 복사본 만들기
df_new <- df_raw
df_new

#4) 변수명 바꾸기
#var2를 v2로 수정
df_new <- rename(df_new, v2=var2)
df_new

#참고 ) names() 또는 colnames()를 이용한 변수명 바꾸기
names(df_new) <- c('v1','v2')
names(df_new)
df_new

#1) 파생변수 생성 - 합계, 평균
#var_sum 파생변수 생성
df<- data.frame(var1=c(1,2,1),
                     var2=c(2,3,2))

df$var_sum <- df$var1+df$var2
df



##1) ggplot2 :: mpg 데이타셋에서 통합 연비 변수 만들기
## 통합연비(total) = (city + hwy)/2

#1)ggplot2의 mpg데이터를 데이터프레임 형태로 가져오기
mpg <- as.data.frame(ggplot2::mpg)
mpg
head(mpg,5)
class(mpg)

#2) 통합 연비 변수 생성 - 통합연비 : cty,hwy 두변수의 평균

mpg$total <- (mpg$cty + mpg$hwy)/2
head(mpg)

#3) 통합 연비 변수 평균 구하기
mean(mpg$total)

#4) 조건문(ifelse) 이용하여 파생변수 만들기

#1) 기준값 종하기 = 합격여부 판단하는 기준값 정하기
summary(mpg$total)
hist(mpg$total)

#2) 합격 판정 변수(test) 만들기, 20이상이면 pass,  그렇지 않으면 Fail

mpg$test <- ifelse(mpg$total>=20, 'pass','fail')
head(mpg,10)
tail(mpg,10)

#3) test 변수가 'fail'인 행 검색
mpg[mpg$test =='fail',]
subset(mpg,test=='fail')

qplot(mpg$test)
qplot(mpg$test,fill=mpg$test)

#tptal 을 기준으로 A(30이상,),B(20~29),C(20)미만

#1) 기준값 부여
mpg$grade <- ifelse(mpg$total >=30,'A',ifelse(mpg$total>=20,'B','C'))
subset(mpg,grade=='A')
table(mpg$grade)

#3) 원하는 범주 기준 만들기

#4)A(30이상),B(25~29), C(20~34), D(20미만만)

mpg$grade <- ifelse(mpg$total>=30,'A', ifelse(mpg$total)>=25,'B',
                    ifelse(mpg$total>=20,'C','D'))
getwd()                           

#외부파일 불러오기
exam <- read.csv('csv_exam.csv')
exam

#학생은 모두 몇명인가?
nrow(exam)

#2) filter(이용)
#1) exam에서 class가 1인 경우만 추출하여 출력
exam[exam$class==1,]
subset(exam,class==1)

#dplyr 의 filter 이용
exam %>% filter(class==1)

exam %>% filter(class!=3)

# 수학 점수가 50점을 초과한 경우

exam %>% filter(math>50)
exam %>% filter(math<50)

##영어점수가 80점 이하인 경우 몇명?
exam %>% filter(english<=80) %>% nrow()

#1) 1반이면서 수학 점수가 50점 이상인 경우

exam %>% filter(class==1 & math>=50)
exam %>% filter(class==2 & english>=80) %>% nrow()

#2) %in% 이용 - 1,3,5반에 해당되면 추출

exam %>% filter(class %in% c(1,3,5))


#3) 1반과 2반 추출

class1 <- exam %>% filter(class==1)
class2 <- exam %>% filter(class==2)
class1;class2


#4) 1반과 2반의 수학 평균

summary(class1)
summary(class2)


#quiz ) 1반이나 2반이면서 영어 점수가 80점 이상

exam %>% filter((class==1 | class==2) & english>=80) %>% nrow()

exam %>%
    filter(class %in% c(1,2) & english>=80) %>%
    tally()

##) audi 추출
mpg_audi <- mpg %>% 
    filter(manufacturer=='audi')
##) toyota 추출
mpg_toyota <- mpg %>% 
    filter(manufacturer=='toyota')
summary(mpg_audi$cty)
summary(mpg_toyota$cty)


##2) select()
#i) math 변수만 추출하기
exam %>% select(english)
exam %>% select(class,english,math)
exam %>% select(-math)

#3) maath, enlgish 제외한 변수 추출
exam %>% select(-math,-english)
exam %>% select(-c(math,english))

#4) 1반의 영어점수

exam %>% 
    filter(class==1) %>% 
    select(english)

#5) 데이타 일부만 출력하기

exam %>% select(id,math)

exam %>% 
    select(id,math) %>% 
    head(10)

########### arrange  = order by
########## filter = 행 정렬 (where)
exam %>% arrange(math)
exam %>% arrange(desc(math))

exam %>% arrange(class,math)
exam %>% arrange(class,desc(math))


#1) 수학점수는 내림차순으로 정렬하고 순위 매기기

exam %>% 
    select(id,math) %>% 
    arrange(desc(math)) %>% 
    mutate(rank=row_number()) %>% 
    head(10)

exam

exam <- exam %>% 
    mutate(total=math+english+science)
exam

exam <- exam %>% 
    mutate(mean=round((math+english+science)/3,1))
exam

exam %>% mutate(test= ifelse(science>=60,'pass','fail'))


exam %>% 
    arrange(desc(total)) %>% 
    mutate(rank=row_number()) %>%

    
    ##1)  집단별로 요약하기
    
exam %>% 
    group_by(class) %>% 
    summarise(mean_math=mean(math))

exam <- exam %>%
    group_by(class) %>% 
    summarise(mean_math=mean(math),
              median_math=median(math),
              sum_math=sum(math),
              n=n())
exam <- as.data.frame(exam)          
exam
plot(exam)

exam2 <- exam %>% 
    group_by(class) %>% 
    summarise(mean_math=mean(math),
              sum_math=sum(math),
              median_math=median(math),
              n=n()) %>% 
    arrange(desc(mean_math)) %>% 
    mutate(group_rank=row_number())


## 각 집단별로 다시 집단 나누기 - 1차집단, 2차집단

mpg %>% 
    group_by(manufacturer,drv) %>% 
    summarise(mean_cty=mean(cty)) %>% 
    head(5)


##Q) mpg에서 회사별로(manufacturer)로 'suv'자동차(class)의 도시(cty) 및 고속도록(hwy) 통합연비 평균을 구해 내림차순으로 정렬하고 1~5위 까지 출력하기

mpg

exam3 <- mpg %>% 
    group_by(manufacturer) %>% 
    filter(class=='suv') %>%
    mutate(average=(hwy+cty)/2) %>%
    summarise(mean_average=mean(average)) %>% 
    arrange(desc(mean_average)) %>% 
    head(5) %>% 
    mutate(rank=row_number())
View(exam3)
    

# 문제2) exam3에서 반별 남학생들의 3과목 평균을 구하여 1~3위 반을 출력

exam3 <- read.csv('csv_exam3.csv', stringsAsFactors = F)

exam

exam %>% group_by(class) %>%
    mutate(avg=math+english+science) %>% 
    summarise(mean_avg=mean(avg)) %>% 
    head(3) %>% 
    arrange(desc(mean_avg))
                       

# test1 <- data.frame(c(1,2,3,4,5),
#                    midterm=c(60,80,70,95,80)
# test2 <- data.frame(id=c(1,2,3,4,5),
#                     fri))

#i)학생 1~5번 시험 데이터 생성
group_a <-  data.frame(id=c(1,2,3,4,5),
                       test=c(60,80,70,90,85))
group_b <- data.frame(id=c(6,7,8,9,10),
                      test=c(70,83,65,95,80))
group_a


group_all <-  bind_rows(group_a,group_b)
group_all            

#중복값 제거 - distinct()

distinct(mtcars,cyl)
distinct(mtcars,gear)
distinct(mtcars,cyl,gear)  ##조합이 유일한 것

#데이터 샘플 추출하기

sample_n(mtcars,5)
dim(mtcars)

#데이터에서 확률로 추출하기
sample_frac(mtcars,0.2)

# install.packages('gapminder')
library(gapminder)

gapminder=as.data.frame(gapminder)
head(gapminder)

#1) gapminder 에서 나라, 측정년도, 평균수명을 추출하시오.
gapminder %>% 
    select(country,year,lifeExp)

#2) gapminder에서 크로아티아에 대한 정보만 추출
gapminder %>%
    filter(country=='Colombia')

#3) gapminder에서 인구의 평균을 추출하시오.
gapminder %>% 
    group_by(country) %>% 
    summarise(pop_avg=mean(pop))
summarise(gapminder,avg=mean(pop))

#4) gapminder 에서 대륙별 평균 인구를 추출하시오.
gapminder %>% 
    group_by(continent) %>% 
    summarise(pop_avg=mean(pop))

#5) gapminder에서 대륙별, 국가별 평균 인구를 추출하시오
gapminder %>% 
    group_by(continent,country) %>% 
    summarise(pop_avg=mean(pop))


###reshape 패키지
# install.packages('reshape2')
library(reshape2)

head(airquality)

melt_test <- melt(airquality)
head(melt_test)
melt_test
tail(melt_test)
nrow(melt_test)

##월과 일에 따른 오존 확인하기
#- 형식 : melt(데이터 세트, id.var='기준열', measure.vars='변환열')

melt_test2 <- melt(airquality,
                   id.vars=c('Month','Day'),
                   measure.vars = 'Ozone',
                   na.rm=T)
head(melt_test2)
nrow(melt_test2)

melt_test3 <- melt(airquality,
                   id.vars=c('Month'),
                   measure.vars = c('Wind','Temp'),
                   na.rm=T)
melt_test3
head(melt_test3)

#변수명 소문자로 통일하기
names(airquality)
names(airquality) <- tolower(names(airquality))
head(airquality)

aq_melt <- melt(airquality,
                id.vars=c('month','day'),
                na.rm=T)
head(aq_melt)
nrow(aq_melt)

aq_dcast <- dcast(aq_melt,month+day~variable)
head(aq_dcast)
nrow(aq_dcast)

#View 창으로 확인하기
a <- acast(aq_melt,day~month~variable)
class(a)


acast(aq_melt,month~variable,mean)

date1 <- as.Date('2020-08-19')
date1
date2 <- Sys.Date()
date2

date3 <- as.Date('2018-06-03')
date2-date3

# install.packages('lubridate')
library(lubridate)
date3 <- now()
date3
year(date3)
day(date3)
ymd('2020-08-19')+days(10000)
