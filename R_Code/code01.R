#install.packages('dplyr')
#install.packages('ggplot2')

library(dplyr)
library(ggplot2)

tips <- read.csv("https://raw.githubusercontent.com/mwaskom/seaborn-data/master/tips.csv")
tips
str(tips)
head(tips,10)
summary(tips)
ggplot(tips,aes(size)) + geom_histogram()

tips %>% ggplot(aes(size)) + geom_histogram()

tips %>% ggplot(aes(total_bill,tip)) + geom_point()

tips %>% ggplot(aes(total_bill,tip)) + geom_point()


###### -------------------------------------------------#################

####      1장 R 기초 문법과 자료구조       ################

##########     ----------------------------         ##################

a <- 10
b <- 10
a;b

c=d <- 10
c;d

### 변수 만들기
a<-10
a

is.integer(a)
is.numeric(a)

##정수로 입력받는 방법 2가지
#1)
a<- as.integer(1)
a
is.integer(a)

a<-2L
a

is.integer(a)

a=3
b=2
d=3.5
a+b
is.integer(a+b)
is.numeric(a+b)

a-b
a*b
a/b
a+b+c
c



str4 <- c("a","b","c")
str4
is.vector(str4)
is.character(str4)

str5 <- c('Hello!','World','is','good!')
str5

a<-TRUE
b<-FALSE
is.logical`(a)





1+2
1-2
2*3
1/2

1%/%2  ###정수형 몫
6%%4   ####나머지 구하는 연산자
2^3    ####지수승
factorial(3)
factorial(4)

round(5.33,0) ###소수점 0째자리 까지 반올림(정수로 만들어라!!)
round(5.33,1)

trunc(5.3)
trunc(5.232425295)
trunc(5.9)

ceiling(4.3)  ###    4.3보다 큰 정수 중 가장 가까운 정수
floor(4.3)  #### 4.3보다 작은 정수 중 가장 가까운 정수


###비교 연산자 : >, >=, < , <=, ==, !=

10<20
10>20
100==100
'파이썬' =='파이썬'
'파이썬' !='R'
'파이썬'<'R'

TRUE&TRUE
TRUE&FALSE
FALSE&FALSE
FALSE&FALSE

TRUE | FALSE   ### ' | ' = or

!FALSE  ###  " ! " not 연산자
!TRUE

TRUE+TRUE   ####TRUE : 1, FALSE : 0
TRUE+FALSE

#####    결측치 - NA, NULL, NaN

one<-80
two<-90
three<-75
four<-NA

sum=one+two+three+four
sum

is.na(four)

x<-1009
a
y<-200
yemp<-x
x<-y


a<-100
b<-2.7
c<-'Korea'
d<-FALSE
a;b;c;d

is.numeric(a)
is.integer(a)
is.numeric(b)
is.character(c)
is.logical(d)

class(a)
class(b)
class(c)
class(d)

x=10
as.numeric(x)
as.integer(x)

Sys.Date()

## format 함수

format(Sys.Date(), format='%m/%d/%Y')
##mm/dd/yyyy
format(Sys.Date(), format='%Y-%m-%d')

format(Sys.Date(),'%a')

## 크리스마스까지 며칠 남았나?
> difftime(as.Date('2020-12-25',
                   +                  format='%Y-%m-%d'),Sys.Date())


difftime(as.Date(Sys.Date(),'1995-06-16',format='%Y-%m-%d'))

         