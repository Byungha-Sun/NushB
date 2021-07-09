# ------------------------------------------- #
# OPEN API 활용 - 공공 데이터 포털 API 예제
# ------------------------------------------- #

# ------------------------------------------- #
# 1. 대기오염정보서비스 url 주소
# ------------------------------------------- #

# 데이타프레임 형식으로 데이타 가져오기 

# 패키지 설치 및 로드
#install.packages("XML")
library(XML)

# 인증키 받아오기
# https://www.data.go.kr/dataset/15000581/openapi.do

# url 주소 
url <- "http://openapi.airkorea.or.kr/openapi/services/rest/ArpltnInforInqireSvc/getCtprvnMesureSidoLIst?"


# 인증키
key <- 'K24NhVsF0%2BOQOOfwPBXBXmRddhVoP35CScm0f%2F%2Br3er5Bw97CeL%2BoPUnbn7jxOSkDUPeECSWn5OHmNhmhSERxA%3D%3D'

# 조건 입력 
cnt <- 625
pageno <- 1
sidoname <-"서울"
sido <-URLencode(iconv(sidoname, "euc-kr", "UTF-8"))
sido 

# url 완성하기 
api_url <- paste0(url, "ServiceKey=", key, 
                  "&numOfRows=", cnt, 
                  "&pageNo=", pageno, 
                  "&sidoName=", sido, 
                  "&searchCondition=DAILY")
api_url 

# open api 접속하여 데이타 받아오기(데이타프레임형식)
parseXml <- xmlParse(api_url)
parseXml

rowXml <- getNodeSet(parseXml, "//item")
rowXml 

api_data <- xmlToDataFrame(rowXml, 
                           stringsAsFactors = F)
api_data

dim(api_data)
str(api_data)

# 자료 조회 및 분석 
install.packages("dplyr")
library(dplyr)

# null(결측치) 개수 세기
table(is.na(api_data)) #122
# null(결측치) 제거
api_data <- na.omit(api_data)
api_data

# 데이타타입을 숫자타입으로 변환하기
# 3열부터 8열까지 데이타 타입을 숫자 타입으로 변환
for (x in 3:8) {
    api_data[, x] <- as.numeric(api_data[, x])
}

str(api_data)

# 서울시 구별 평균값 처리 
api_data %>% 
    group_by(cityName) %>%
    summarise(mean_so2 = mean(so2Value),
              mean_co = mean(coValue),
              mean_o3 = mean(o3Value),
              mean_no2 = mean(no2Value),
              mean_pm10 = mean(pm10Value),
              mean_pm25 = mean(pm25Value)) %>%
    arrange(desc(mean_co))

getwd()
setwd('c:/Rstudy/data')
getwd()
