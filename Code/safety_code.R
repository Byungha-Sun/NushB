getwd()
setwd('c:/Rstudy/data/project')   ###파일 저장되어 있는 위치
safety <- read.csv('safetycorr.csv',encoding = 'UTF-8')   ##파일명
head(safety)

cor(safety)  ##전체 상관계수 검사  (유의수준 포함 x)
summary(safety) ## 전체 섬머리 

summary(lm(formula=X.U.FEFF.crime ~ cctv + firestation + pleasure + policeoffice+survey+womansafety, data=safety))
    ####다중상관관계 분석 (참고만)


crime <- safety$X.U.FEFF.crime
cctv <- safety$cctv
firestation <- safety$firestation
pleasure <- safety$pleasure
policeoffice <- safety$policeoffice
survey <- safety$survey
womansafety <- safety$womansafety


###종속변수 crime  ####

cor.test(cctv,crime)  
cor.test(firestation,crime)
cor.test(pleasure,crime)
cor.test(policeoffice,crime)
cor.test(survey,crime)
cor.test(womansafety,crime)


####종속변수 survey  ####
cor.test(cctv, survey)
cor.test(crime, survey)
cor.test(firestation, survey)
cor.test(pleasure, survey)
cor.test(policeoffice, survey)
cor.test(womansafety, survey)

plot(safety)  ##산점도 그리기

plot(cctv,survey)  ### 변수 하나씩만 놓고 산점도 그리기





################밑에 신경 안써도 됨  #############

summary(lm(formula=X.U.FEFF.crime ~ cctv + firestation + pleasure + policeoffice+survey+womansafety, data=safety))