#------------------------------------------#
# 빅데이타 분석∙시각화 with R
#------------------------------------------#

#------------------------------------------#
# 텍스트 마이닝(분석) - code11_1
#------------------------------------------#

# --------------------------------------------------#
#  KoNLP 설치
# ------------------------------------------------- #

# 1. rtools 설치

# 2. java, rJava 설치 
# install.packages("multilinguer")
library(multilinguer) 
install_jdk()

# 3. KoNLP 의존성 패키지 설치
install.packages(c("hash", "tau", "Sejong", "RSQLite", "devtools", "bit", "rex", "lazyeval", "htmlwidgets", "crosstalk", "promises", "later", "sessioninfo", "xopen", "bit64", "blob", "DBI", "memoise", "plogr", "covr", "DT", "rcmdcheck", "rversions"), type = "binary")

# 4. KoNLP의 github 버전 설치
install.packages("remotes")
remotes::install_github('haven-jeon/KoNLP', upgrade = "never", INSTALL_opts=c("--no-multiarch"))  

# 5. KoNLP 로딩하기
library(KoNLP)

# 6. 사전 설정하기 
useSejongDic() 

#------------------------------------------#
# KoNLP 패키지 설치 테스트
#------------------------------------------#

# 1. 텍스트 입력
text <- "R은 오픈소스로 통계, 기계학습, 금융, 생물정보학, 그래픽스에 이르는 
다양한 통계 패키지를 갖추고 있는 좋은 프로그램이다."

# 2. 명사 추출 - 사전에 등록되어있지 않는 명사들이 분리되서 출력
extractNoun(text)

# 3. 사전에 없는 명사는 사전에 등록하는 작업이 필요함.
buildDictionary(ext_dic = "sejong",
                user_dic = data.frame(c("기계학습","생물정보학",
                                        "다양한","오픈소스"),
                                      c("ncn")),replace_usr_dic=T)

# 4. 명사 추출 다시 실행
extractNoun(text)

3#------------------------------------------#
# 단어를 추출하는 방법(strsplit vs extractNoun)
#------------------------------------------#
txt1 <- "Start R Programming."
txt1

# strsplit()을 이용한 단어 추출
strsplit(txt1, " ")

# KoNLP 패키지의 extractNoun() 함수하여 단어 추출 
txt2 <- "R 프로그래밍을 시작하세요"
txt2

# i) strsplit()을 이용한 단어 추출
strsplit(txt2, " ")

# ii) extractNoun() 함수하여 단어 추출
extractNoun(txt2)

