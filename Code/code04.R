## 여러 문자로 구성된 변수 생성
x <- c('a','b','c','d','a')
x

##빈도 그래프 출력
qplot(x)
qplot(x,fill=factor(x))   #색지정

#gplot  함수 매뉴얼 출력
?qplot

####ggplot2의 mpg 데이타셋으로 그래프 만들기
###mpg(Mile Per Gallon) 데이타 - 미국 환경 보호국에서 공개한 자료
###1999~2008년 사이 미국에서 출시된 234종의 연비 관련 정보

#mpg
mpg

class(mpg)
dim(mpg)

str(mpg)

head(mpg,5)


##data에 mpg, x축에 hwy변수 지정하여 그래프 생성
qplot(data=mpg, x=hwy)

#x축 cty
qplot(data=mpg, x=cty)

#x축 drv, y축 hwy
qplot(data=mpg, x=drv, y=hwy)

#x축 drv, y축 hwy, 선 그래프 형태
qplot(data=mpg, x=drv, y= hwy, geom='line')

#x축 drv, y축 hwy, 상자 그림 형태
qplot(data=mpg, x=drv, y= hwy, geom='boxplot')

#x축 drv, y축 hwy, 상자 그림 형태, drv별 색 표현
qplot(data=mpg, x=drv, y= hwy, geom='boxplot', colour =drv)


######## +++++++++++++++++++++++++++####################
#Apply 계열 함수

##==========================================================####

ex_apply <- matrix(1:20, ncol=5)
ex_apply

apply(ex_apply,1,sum) #행방향 -1
apply(ex_apply,2,mean) #열 방향-2

ex_apply[,c(2,4,5)]

apply(ex_apply[,c(2,4,5)],2,mean)


##iris 데이타셋에 apply 적용
head(iris,2)
apply(iris[1:4],1,mean)  ##행방향으로 함수 적용

apply(iris[1:4],2,mean)  ##행방향으로 함수 적용용

###2) lapply 함수

ex_list1 <- list(ex_apply[,1])
ex_list1
ex_list2 <- list(ex_apply[,2])
ex_list3 <- list(ex_apply[,3])
data1 <- lapply(c(ex_list1,ex_list2,ex_list3),mean)
data2 <- c(ex_list1,ex_list2,ex_list3)
data2


###3)sapply
data2 <- sapply(c(ex_list1,ex_list2,ex_list3),mean)
data2


###4) tapply
setwd('c:/Rstudy')
data3 <- read.csv('../data/팀별실적.csv',header=TRUE)
data3

###현재 디렉토리 확인 및 작업디렉토리 설정
getwd()  ##현재 디렉토리 확인
setwd('c:/Rstudy/data')  ## 디렉토리 변경!
getwd()

### install.packages('readxl')
###install.packages('xlsx')

library(readxl)
library(xlsx)

data3 <- read.csv('팀별실적1.csv',header=TRUE)
data3


# install.packages('tibble')
library(tibble)


df_exam <- read_excel('excel_exam.xlsx')
df_exam

class(df_exam)

dim(df_exam)   ###행,열 개수 확인
nrow(df_exam)  ###관측치 개수 확인
names(df_exam) ### 컬럼이름 확인
colnames(df_exam)# 컬럼이름 확인
str(df_exam)


##분석하기

mean(df_exam$math)
mean(df_exam$english)
mean(df_exam$science)

##2) 엑셀의 첫번째 행이 변수명이 아닌 경우 불러오기

df_exam_novar <-  read_excel('excel_exam_novar.xlsx')
df_exam_novar

#3) 엑셀의 첫번째 행이 변수명이 아닌 경우
# col_names = F (파라미터 지정)
df_exam_novar <- read_excel('excel_exam_novar.xlsx', col_names=F)
df_exam_novar

#4)엑셀 파일의 세 번쨰 시트에 있는 데이터 불러오기
df_exam_sheet <- read_excel('excel_exam_sheet.xlsx', sheet=3)
df_exam_sheet

head(df_exam,3)

#### 액셀 파일로 저장하기
write.xlsx(df_exam,'new_exam.xlsx')
#row 번호 저장됨

write.xlsx(df_exam,'new_exam2.xlsx', row.names = FALSE) ##Error 나는것!

write.xlsx(df_exam,'new_exam2.xlsx',sheetName='sheet1', col.names= TRUE, row.names=TRUE)


###  CSV 파일로 저장하기  ###

write.csv(df_exam,'new_df_midterm.csv')
##row 번호 저장됨

write.csv(df_exam,'new_df_midterm2.csv', row.names = FALSE)


###   CSV 파일 불러오기   ####

#1) csv파일 불러오기
df_csv_exam <- read.csv('csv_exam.csv')
df_csv_exam
str(df_csv_exam)

#2) 파일 탐색기를 이용하여 csv 파일 불러오기
exam <- read.csv(file.choose(),header=T)
exam

#3) 문자가 들어 있는 파일을 불러올 때 --> stringAsFactors=F 지정

#(1) stringAsFactors=F 지정하지 않은 경우
df_csv_exam1 <- read.csv('csv_exam2.csv')
head(df_csv_exam1,2)
#(2) stringAsFactors=T
df_csv_exam2 <- read.csv('csv_exam2.csv',stringAsFactors=TRUE)
head(df_csv_exam2,2)


###########  CSV 파일로 저장하기

##데이타 프레임을 csv 파일로 저장하기

df_midterm <- data.frame(english=c(90,80,60,70),
                         math=c(50,60,100,20),
                         class=c(1,1,2,2))
df_midterm


#csv 파일로 저장하기
write.csv(df_midterm, file= 'df_midterm.csv') ##rownumber 저장됨

##row 번호를 저장하고 싶지 않다면?
write.csv(df_midterm,file='df_midterm.csv',row.names = FALSE)


###tab으로 구분된 txt파일 불러오기

ex_data1 <- read.table('data_ex1.txt', header = T)
ex_data1

###쉼표로 구분된 txt 파일 불러오기

ex_data2 <- read.csv('data_ex1.txt', header=T,sep=',')
head(ex_data2,2)

##txt 파일로 저장하기

head(ex_data1,2)

write.table(ex_data1, file='new_ex_data1.txt',quote=F)

######---------------------------------
######  RData 파일로 저장하기
######------------------------------------------

save(df_midterm,file='df_midterm.rda')

######-------------------------
#####       RData 파일 불러오기
#####-------------------------------------
rm(df_midterm)   #### 데이타 프레임 삭제

df_midterm      ##error

###저장된 RData 파일 load() 로 불러오기
load('df_midterm.rda') #자동으로 df_midterm 데이타프레임 로딩딩
df_midterm

#####--------------------
####웹에서 파일 불러오기
####---------------------

##1) 
csv_url <- 'http://viewportsizes.com/devices.csv'

csv_df <- read.table(file=csv_url,sep=',',header= T, stringsAsFactors = F)

csv_df


##2)
url2 <- 'https://vincentarelbundock.github.io/Rdatasets/csv/datasets/Titanic.csv'
x <- read.csv(url2)
x
dim(x)

######--------------------------------------------
#####           클립보드에서 불러오기
#####-------------------------------------------

clipboard <- read.table(file='clipboard',
                        header = T,
                        sep='\t',
                        stringsAsFactors = F)
clipboard

####---------------------------------
####        사용자로부터 데이터 입력받기  scan()
####_-------------------------------------------

no1 <- scan()
no1

txt1 <- scan(what='')
txt1
class(txt1)

txt2 <- readline()
txt2

txt3 <- readline('뭐가 좋아요? : ')
txt3

###-----------------------
###     비정형 데이터 불러오기 : readLines()
###------------------------
###현재 디렉토리 내의 파일리스트 확인

list.files()

txt11 <- readLines('구매후기.txt')
txt11

txt22 <- readLines('구매후기_utf8.txt')
txt22

text33 <- readLines('구매후기_utf8.txt', encoding='UTF-8')
text33


###---------------------------------------
###     pdf 파일의 내용 읽어오기
###---------------------------------------


install.packages('pdftools')
library(pdftools)

list.files()  ##현재 내 디렉토리에 어떤 파일이 있는지 보여줌!
list.files(pattern='pdf$')

txt1 <- pdf_text('exam_pdf.pdf')
cat(txt1)  ## " " 제거 쌍따옴표 없애기 --##
print(txt1)


####그림으로 저장하기

x <- c(1,2,3,4,5)
plot(x)
##R Gui에서만 가능
savePlot ('fig.png,type=png')


