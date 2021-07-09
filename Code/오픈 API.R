# install.packages('XML')
library(XML)


##인증키 받아오기

##url 주소

url <- "http://openapi.airkorea.or.kr/openapi/services/rest/ArpltnInforInqireSvc/getCtprvnMesureSidoLIst?"

#인증키
key <- "RPQq%2FQT0XICnUplwNNlRR9GMYycvlaBM2H6Osh8FHjnvMEGmPGGwXhzs8o41zysBo3Ax40VpmNH8KijKrwWRDQ%3D%3D"

#조건입력

cnt <- 625
pageno <- 1
sidoname <- '서울'
sido <- URLencode(iconv(sidoname,'euc-kr','UTF-8'))

#url 완성하기
api_url <- paste0(url,
                  'ServiceKey=',key,
                  '&numberOfRows=',cnt,
                  '&pageNo=',pageno,
                  '&sidoName=',sido,
                  '&searchCondition=DAILY')
api_url


##open api 접속하여 데이타 받아오기(데이타프레임형식)

parseXml <- xmlParse(api_url)
parseXml

rowXml <- getNodeSet(parseXml,"//item")
rowXml
api_data <- xmlToDataFrame(rowXml,stringsAsFactors = F)
api_data

dim(api_data)
str(api_data)

