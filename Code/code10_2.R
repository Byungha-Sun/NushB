#------------------------------------------#
# R을 이용한 빅데이타 분석∙시각화 
#------------------------------------------#

# --------------------------------------------------------
#  데이타의 시각화  - code10_2
# --------------------------------------------------------

# --------------------------------------------------------
# ggplot2() 패키지를 이용한 시각화  
# --------------------------------------------------------#

library(ggplot2)

apropos("^geom*_")

# ggplot 그래프 그리기 

#1) 데이타프레임, x축 displ, y축 hwy로 지정해 배경 생성
ggplot(data = mpg, aes(x = displ, y = hwy))

#2) 배경에 산점도 추가
ggplot(data = mpg, aes(x = displ, y = hwy)) + 
  geom_point()

#3) x축 범위 3~6으로 지정
ggplot(data = mpg, aes(x = displ, y = hwy)) + 
  geom_point() + 
  xlim(3, 6)


## 색상을 빨간색으로 적용하여 산점도 그리기
ggplot(data = mpg, aes(x = displ, y = hwy)) + 
  geom_point(size = 3, color = "red") +
  xlim(3, 6)

#4) x축 범위 3~6, y축 범위 10~30으로 지정
ggplot(data = mpg, aes(x = displ, y = hwy)) + 
  geom_point(size = 3, color = "red")+ 
  xlim(3, 6) + 
  ylim(10, 30)


# ------------------------------------------------
# (그래프 정리) 변수의 종류에 따른 시각화 기법
# ------------------------------------------------
# 1) 한개의 수량형 변수 --> 히스토그램, 커널밀도추정함수

# gapminder에서 일인당국민소득(gdpPercap) 수량형 변수의 
# - (1) 히스토그램, (2) 로그변환한 변수의 히스토그램, (3) 도수폴리곤, (4)커널밀도추정함수

library(gapminder)
library(ggplot2)
library(dplyr)

# 화면 분할을 지원하는 패키지 설치
#install.packages("gridExtra")
library(gridExtra)

a = gapminder %>% ggplot(aes(x=gdpPercap)) +
  geom_histogram()
b = gapminder %>% ggplot(aes(x=gdpPercap)) +
  geom_histogram() +
  scale_x_log10()
c = gapminder %>% ggplot(aes(x=gdpPercap)) +
  geom_freqpoly() +
  scale_x_log10()
d = gapminder %>% ggplot(aes(x=gdpPercap)) +
  geom_density() +
  scale_x_log10()

grid.arrange(a, b, c, d, nrow=2, ncol=2)

# 2) 한개의 범주형 변수 --> 막대그래프(bar graph), table() 함수 이용
# diamonds 데이터의 cut 변수의 막대 그래프

diamonds %>% ggplot(aes(cut)) +
  geom_bar()

# 도수분포, 상대도수, 퍼센트 구하기
table(diamonds$cut)
prop.table(table(diamonds$cut))
round(prop.table(table(diamonds$cut))*100, 1)


# 3) 두 수량형 변수 --> 산점도(scatterplot)
# x, y 좌표에 여러개의 중복 관측치가 있을 때 --> geom_jitter() 사용

# diamonds와 mpg 데이타
a = diamonds %>% ggplot(aes(carat, price)) +
  geom_point()
b = diamonds %>% ggplot(aes(carat, price)) +
  geom_point(alpha=.01)
c = mpg %>% ggplot(aes(cyl, hwy)) +
  geom_point()
d = mpg %>% ggplot(aes(cyl, hwy)) +
  geom_jitter()

grid.arrange(a, b, c, d, nrow=2, ncol=2)

# 3) 두개 이상의 수량형 변수 --> 산점도 행렬
pairs(diamonds %>% sample_n(1000))
plot(diamonds %>% sample_n(1000))

# 3) 두 수량형 변수 --> 산점도(scatterplot) 분할
gapminder %>% 
  ggplot(aes(gdpPercap, lifeExp, col=continent)) +
  geom_point(alpha=0.2) +
  facet_wrap(~year) +
  scale_x_log10()

# 4) 두 범주형 변수 --> 모자이크플롯
glimpse(Titanic)
mosaicplot(Titanic, main="Survival on the Titanic")
mosaicplot(~Sex+Survived, data = Titanic)
mosaicplot(~Class+Survived, data = Titanic)
help("mosaicplot")
# --------------------------------------------------------
# 움직이는 챠트, googleVis 패키지 
# --------------------------------------------------------
# 특징 : 웹 브라우저를 통해 플래시 기반의 움직이는 그래프 

install.packages("googleVis")
library(googleVis)
library(ggplot2)

#1) ecomomics 데이타 셋을 이용하여 시간 흐름에 따라 변화되는 값 확인 
str(economics)

# i) 날짜별(date) 개인 저축률의 변화(pasvert) 값을 구한 후 motion 변수에 할당
motion <- gvisMotionChart(economics, idvar="psavert", timevar = "date")

# ii) motion 변수의 값으로 그래프 그리기
plot(motion)

#2) CityPopulrity 데이타 셋을 이용한 계기판형 그래프 게이지 챠트 그리기 
str(CityPopularity)
head(CityPopularity)

# 게이지의 측정 데이터(labelvar)는 도시명, 값(numvar)은 인구수, 눈금은 0~1000으로 옵션 지정
gauge <- gvisGauge(CityPopularity, labelvar="City", numvar="Popularity", options=list(min=0, max=1000))
plot(gauge)                          # gauge 변수 값으로 그래프 그리기

# 게이지 색상 영역 설정
Gauge <- gvisGauge(CityPopularity, options=list(min=0, max=1000, greenFrom=800, greenTo=1000, yellowFrom=500, yellowTo=800, redFrom=0, redTo=500, width=400, height=300)) 
plot(Gauge)

# ------------------------------------------------
# googleVis() : pie chart & donut chart
# ------------------------------------------------

# pie chart & donut chart 
CityPopularity
pop_pie <- gvisPieChart(CityPopularity,options=list(width=600, height=400)) 
plot(pop_pie)

pop_donut <- gvisPieChart(CityPopularity, options=list(
  slices="{4: {offset: '0.2'}, 0: {offset: '0.3'}}",
  title="City popularity",
  pieSliceText="label",
  pieHole="0.3",width=600,height=400))
plot(pop_donut)

# bubble chart 
head(Fruits,3)
bubble <- gvisBubbleChart(Fruits, 
                          idvar="Fruit", xvar="Sales", yvar="Expenses", 
                          colorvar="Year", sizevar="Profit", 
                          options=list(height=600,weight=200)
)
plot(bubble)

bubble2 <- gvisBubbleChart(Fruits, 
                           idvar="Fruit", xvar="Sales", yvar="Expenses", 
                           colorvar="Year", sizevar="Profit", 
                           options=list(height=600,weight=200,
                                        hAxis='{minValue:0, maxValue:130}',
                                        vAxis='{minValue:0, maxValue:150}'))
plot(bubble2)



# motion chart 
Fruits
motion <- gvisMotionChart(Fruits, idvar="Fruit", timevar="Year",
                          options=list(width=1000,height=500))

plot(motion)

# --------------------------------------------------------
# 인터렉티브 그래프  
#---------------------------------------------------------
#---------------------------------------------------------
# plotly 패키지로 인터렉티브 그래프 만들기
#---------------------------------------------------------
#1) 패키지 준비하기 
install.packages("plotly")
library(plotly)

#2) ggplot2로 그래프 만들기 
library(ggplot2)
p <- ggplot(data = mpg, aes(x = displ, 
                            y = hwy, col = drv)) + geom_point()
p

#3) 인터렉티브 그래프 만들기 
ggplotly(p)

#4) html로 저장하기 
# [Export -> Save as Web Page...] 클릭 -> html 포맷으로 저장

#5) 인터렉티브 막대 그래프 만들기 
p <- ggplot(data = diamonds, aes(x = cut, fill = clarity)) + 
  geom_bar(position = "dodge")

ggplotly(p)

#---------------------------------------------------------
# dygraphs 패키지로 인터렉티브 시계열 그래프 만들기 
#---------------------------------------------------------

#1) 패키지 설치하기 
install.packages("dygraphs")
library(dygraphs)

#2) economics 데이타 불러오기 
economics <- ggplot2::economics
head(economics)

#3) dygraphs 패키지를 이용해 인터렉티브 시계열 그래프 만들기
## 시간 속성을 가지는 xts 데이타 타입으로 되어 있어야만 함
## xts()를 이용해 economics 데이타의 실업자수(umemploy)를 xts 타입으로 변경
install.packages("xts")
library(xts)

eco <- xts(economics$unemploy, order.by = economics$date)
head(eco)

#4) 인터렉티브 시계열 그래프 생성
dygraph(eco)

#5) 날짜 범위 선택 기능 - dyRangeSelector() 추가
dygraph(eco) %>% dyRangeSelector()

#6) 여러값 표현하기 
## economics 데이타의 실업자수(unemploy)와 저축률(psavert)를 함께 그래프에 표현 

# i) 저축률 
eco_a <- xts(economics$psavert, order.by = economics$date)

# ii) 실업자 수
eco_b <- xts(economics$unemploy/1000, order.by = economics$date)

#7) cbind()를 이용하여 가로열(열)로 결합하고, 변수명도 쉽게 수정
## eco2는 데이타프레임이 아니라 xts 타입이기때문에 rename()을 사용하지 못하고 colnames()를 이용하여 변수명 수정 

eco2 <- cbind(eco_a, eco_b)                 # 데이터 결합
colnames(eco2) <- c("psavert", "unemploy")  # 변수명 바꾸기
head(eco2)

#8) dygraph() 이용하여 그래프 그리기 
dygraph(eco2) %>% dyRangeSelector()

# ------------------------------------------------
# 데이타 시각화 실전 예제 - gapminder 패키지 데이타
# ------------------------------------------------
install.packages("gapminder")
library(gapminder)
library(ggplot2)

# ------------------------------------------------
# 1. 많은 양의 데이터를 효과적으로 관찰  
# ------------------------------------------------
# 1) 대륙별 1인당 GDP 에 따른 기대 수명
y <- gapminder %>% 
  group_by(year, continent) %>% 
  summarise(c_pop=sum(pop))  

head(y, 20)

# 시각화
plot(gapminder$gdpPercap, gapminder$lifeExp, col=gapminder$continent)
legend("bottomright", legend=levels(gapminder$continent),
       col=c(1:length(levels(y$continent))),
       pch=c(1:length(levels(y$continent))))


# 시각화 개선 
# 전체 범위에 비해 낮은 범위에 샘플들이 많이 몰려 있어 관찰이 쉽지 않다.
# -> 로그 스케일(log scale)을 이용하여 샘플들을 고르게 관찰 

plot(log10(gapminder$gdpPercap), gapminder$lifeExp, col=gapminder$continent)
legend("bottomright", legend=levels(gapminder$continent),
       col=c(1:length(levels(y$continent))),
       pch=c(1:length(levels(y$continent))))

# 2) 시각화전용 라이브러리 ggplot2 사용하여 완성도 높은 시각화 결과
library(ggplot2)
install.packages("gridExtra")
library(gridExtra)

a <- ggplot(gapminder, aes(x=gdpPercap, y=lifeExp, col=continent)) +
  geom_point() +
  scale_x_log10()
  
# pop 속성 추가
b <- ggplot(gapminder, aes(x=gdpPercap, y=lifeExp, col=continent, size=pop)) +
  geom_point() +
  scale_x_log10()

# 마커 투명도 조정
c <- ggplot(gapminder, aes(x=gdpPercap, y=lifeExp, col=continent, size=pop)) +
  geom_point(alpha=0.5) +
  scale_x_log10()

grid.arrange(a, b, c, nrow=3, ncol=1)

# 3) 각 년도별 데이타 관찰 : facet_wrap() 함수 이용 
ggplot(gapminder, aes(x=gdpPercap, y=lifeExp, col=continent, size=pop)) +
  geom_point(alpha=0.5) +
  scale_x_log10() +
  facet_wrap(~year)

# ------------------------------------------------
# 2. 데이터를 여러 관점으로 보게 함
# ------------------------------------------------

# 1) 비교/순위 
# 1952년 아시아 대륙의 인구분포에서 각 국가의 순위 
# i) 가로축에 국가명이 겹치는 문제 해결 --> coord_flip 함수로 가로 세로 전환
gapminder %>%  filter(year==1952 & continent=="Asia") %>% 
  ggplot(aes(reorder(country, pop), pop)) +
  geom_bar(stat="identity") +
  coord_flip()

#ii) 국가별 인구차이가 많아 인구가 작은 싱가포르 나라는 그래프에서 확인 불가능
#--> 데이타 간의 상대적인 차이를 직접 비교하거나 순위를 표시, 막대그래프 유리 
gapminder %>%  filter(year==1952 & continent=="Asia") %>% 
  ggplot(aes(reorder(country, pop), pop)) +
  geom_bar(stat="identity") +
  scale_y_log10() +
  coord_flip()

# 2) 변화 추세
# i) 한국의 평균 수명 변화를 연도에 따라 시각화 
gapminder %>% filter(country=="Korea, Rep.") %>% 
  ggplot(aes(year, lifeExp, col=country)) +
  geom_point() +
  geom_line()

# ii) 여러 데이타 변화를 동시에 비교 --> 색상으로 구분한 다중 플롯 이용
#단, 대륙과 같이 범주형 속성을 이용하여 구분이 가능
#ggplot2의 geom_smooth 함수를 이용하여 평균적인 추세선을 표시
gapminder %>%  
  ggplot(aes(x=year,y=lifeExp, col=continent)) +
  geom_point(alpha=0.2) +
  geom_smooth()

# 3) 분포 혹은 구성 비율
# 1952년 전 세계 평균 수명의 분포를 시각화 
# i) 베이스 R의 hist() 함수 사용하여 시각화 
x = filter(gapminder, year==1952)
hist(x$lifeExp, main="Histogram of lifeExp in 1952")

# ii) ggplot() 함수를 이용한 시각화
x %>% ggplot(aes(lifeExp)) + geom_histogram()


# iii) boxplot() 을 이용하여 대륙별 평균 수명의 분포 시각화  - - 이상치 확인 가능 
x %>% ggplot(aes(continent, lifeExp)) + geom_boxplot()

# 4) 상관관계 - gdpPercap과 lifeExp 간의 상관관계 시각화 
plot(log10(gapminder$gdpPercap), gapminder$lifeExp)

# 상관계수
cor(log10(gapminder$gdpPercap), gapminder$lifeExp)


# --------------------------------------------------------
# 지도 시각화 
#---------------------------------------------------------

# --------------------------------------------------------
# 구글지도를 이용하는 ggmap 패키지  
#---------------------------------------------------------

# 주의) Google Map Platform 출시로 인해 ggmap 패키지 변경됨

# http://developers.google.com/maps/terms
# 1. 상기 주소에서 구글 계정 인증 필요
# 2. 프로젝트 신규로 생성하기
# 3. Google Maps Platform API Key 활용하기

# --------------------------------------------------------
#  구글 지도 그리기 
# --------------------------------------------------------
# 프로젝트 설정 이후 API Key 확인하기
# https://console.cloud.google.com/

# 패키지 설치 및 로드
# install.packages("ggmap")
library(ggmap)

#1) 구글 API 등록하기 
googleAPIkey = "AIzaSyA8PbvRKaIEj5MaFGuesp1-VcD3z6PSoOI"

# seoul의 위치 정보를 가져온 후 gg_seoul 변수에 할당
register_google(googleAPIkey)

#2) 위치 설정하기  
gc <- geocode(enc2utf8("영등포구"))
gc

#3) 경도, 위도를 숫자로 변경하기
cen <- as.numeric(gc)
cen

#4) 구글 지도 그리기 
map <- get_googlemap(center=cen, maptype = "roadmap", zoom=15)
ggmap(map)

# get_googlemap() 함수
# center - 지도 중심의 좌표값 지정(경도, 위도)
# maptype
# - "roadmap", "terrain"(기본값), "satellite", "hybrid"
# zoom - 지도의 확대 크기를 지정
#      - 3(대륙)~21(빌딩), 기본값은 10(도시)

# --------------------------------------------------------
# 지도 위에 마커와 텍스트 표시
# --------------------------------------------------------
# --------------------------------------------------------
# 1) 지도의 중심 지점에 마커 표시하기
# --------------------------------------------------------
library(dplyr)
library(ggplot2)

register_google(googleAPIkey)  # 구글키 등록

# 한글 검색을 위해 utf8로 변환한 후 위도와 경도 데이터를 geo_code 변수에 할당
geo_code <- enc2utf8("가천대학교") %>% geocode()
geo_code  

# 리스트를 숫자로 변환하여 geo_data 변수에 할당
cen <- as.numeric(geo_code)              

# 가천대학교 위치정보를 가져온 후 구글 지도 호출
# geo_code에 있는 경도(lon)와 위도(lat) 값으로 산점도 그리기
get_googlemap(center=cen, 
              maptype="roadmap", 
              zoom=16,
              markers = gc) %>% 
  ggmap() +
  geom_point(data=geo_code, aes(x=geo_code$lon, y=geo_code$lat), 
             colour="red", cex=7)  

# --------------------------------------------------------
# 2) 지도의 여러 지점에 마커와 텍스트 표시
# --------------------------------------------------------
# 제주도 6개 관광명소의 지명과 주소 이용
# library(ggmap)
# register_google(googleAPIkey) 	# 구글키 등록
library(ggplot2)

names <- c("용두암","성산일출봉","정방폭포",
           "중문관광단지","한라산1100고지","차귀도")
addr <- c("제주시 용두암길 15",
          "서귀포시 성산읍 성산리",
          "서귀포시 동홍동 299-3",
          "서귀포시 중문동 2624-1",
          "서귀포시 색달동 산1-2",
          "제주시 한경면 고산리 125")
gc <- geocode(enc2utf8(addr)) 	#주소를 경도와 위도로 변환
gc

# 관광지 명칭과 좌표값으로 데이터프레임 생성
df <- data.frame(name=names,
                 lon=gc$lon,
                 lat=gc$lat)
df

cen <- c(mean(df$lon),mean(df$lat)) 		# 지도의 중심점
map <- get_googlemap(center=cen, 		    # 지도 가져오기
                     maptype="roadmap", # 지도의 형태
                     zoom=10, 			    # 지도의 확대 크기
                     size=c(640,640), 	# 지도의 크기
                     marker=gc) 			  # 마커의 위치
ggmap(map) 	# 지도와 마커 화면에 보이기

# 명소 이름 지도 위에 표시하기
gmap <- ggmap(map)
gmap+geom_text(data=df, 		        # 지도 위에 텍스트 표시
               aes(x=lon,y=lat), 		# 텍스트 위치(관광지 좌표)
               size=5, 			        # 텍스트 크기
               label=df$name) 		  # 텍스트 내용

# --------------------------------------------------------
# 지도 위에 데이타 표시
# --------------------------------------------------------
# 구글맵 위에는 마커나 텍스트뿐만 아니라 ggplot 패키지를 이용하여 원과 같은 도형도 표시할 수 있음
# ggmap 패키지에서 제공하는 wind 데이터셋을 이용하여 지도 위에 데이터를 표현하는 방법을 실습
#wind 데이터셋은 미국 루이지애나주 부근의 여러 지점에서 측정한 바람에 대한 정보를 담고 있으며, 측정 위치에 풍속(spd)을 원의 크기로 표현

#library(ggmap)
#register_google(googleAPIkey) 	# 구글키 등록
#library(ggplot2)

# 데이터 준비
sp <- sample(1:nrow(wind),50) 		# 50개 데이터 샘플링
df <- wind[sp,]
head(df)

cen <- c(mean(df$lon), mean(df$lat)) 		  # 지도의 중심점 계산
cen
gc <- data.frame(lon=df$lon, lat= df$lat) # 측정위치 좌표값 데이터
head(gc)

# 측정 위치에 마커 표시하기
map <- get_googlemap(center=cen,
                     maptype="roadmap",
                     zoom=6,
                     marker=gc)
ggmap(map)

# 풍속을 원의 크기로 표시하기
map <- get_googlemap(center=cen, 	# 마커 없는 지도 가져오기
                     maptype="roadmap",
                     zoom=6)
gmap <- ggmap(map) 		            # 지도를 저장
gmap+geom_point(data=df, 		      # 풍속을 원의 크기로 표시
                aes(x=lon,y=lat,size=spd),
                alpha=0.5,
                col="blue") +
  scale_size_continuous(range = c(1, 14)) # 원의 크기 조절


# --------------------------------------------------------
#서울지하철 2호선과 3호선 정보
# --------------------------------------------------------
getwd()
setwd('c:/Rstudy/data')
sub2 <- read.csv("서울지하철2호선위경도정보.csv")
sub3 <- read.csv("서울지하철3호선역위경도정보.csv")

center <- c(mean(sub2$LON)-0.04, mean(sub2$LAT)+0.04)
sub23 <- get_map(center, zoom=11, maptype = "roadmap")
sub.map <- ggmap(sub23)+
  geom_point(data=sub2,aes(x=LON, y=LAT),size=3,color="green")+
  geom_point(data=sub3,aes(x=LON, y=LAT),size=3,color="red")

sub.map + 
  geom_text(data=sub2, aes(x = LON, y = LAT+0.005, label=역명),size=3) +
  geom_text(data=sub3, aes(x = LON, y = LAT+0.005, label=역명),size=3 ) 

# --------------------------------------------------------
# R 에서 GIS - leaflet( ) 패키지로 시각화 하기 
# --------------------------------------------------------

# (1) leaflet( ) 패키지 기본 문법

# 한라산 위치 표시하기
install.packages("leaflet")
library("leaflet")

han <- leaflet() %>%
  addTiles() %>%  
  setView(lng=126.5292, lat=33.36167, zoom = 10) %>%
  addMarkers(lng=126.5292, lat=33.36167,popup="제주도 한라산")
han

#(2) leaflet( ) 함수 활용 예제-주요 도시의 인구현황 출력하기
getwd()
pop1 <- read.csv("../data/지역별인구현황_2014_4월기준.csv")
pop1
map1 <- leaflet(pop1) %>% 
  addTiles( ) %>%  
  setView(mean(pop1$LON), mean(pop1$LAT), zoom = 11) %>%  
  addCircleMarkers(~LON, ~LAT , popup=~지역,
                   color=~ifelse(pop1$총인구수>3000000, "red", "blue"),
                   radius=(~인구수/min(총인구수)*0.5) ,
                   fillOpacity=0.5 )
map1

# (3) leaflet( ) 패키지 활용 실습

# 작업디렉토리 설정
setwd("c:/R/data/")

# 패키지 설치 및 메모리 로딩 
install.packages("leaflet")
#install.packages("Rcpp")
#install.packages("dplyr")
install.packages("readxl")

library(leaflet)
library(readxl) 
library(dplyr)

# 데이타 파일 불러오기 
data_all <- read_excel("국내지진발생현황_2017.xlsx",sheet=2)
data1 <- read_excel("국내지진발생현황_2017.xlsx",sheet=3)
data2 <- read_excel("국내지진발생현황_2017.xlsx",sheet=4)
data3 <- read_excel("국내지진발생현황_2017.xlsx",sheet=5)
data4 <- read_excel("국내지진발생현황_2017.xlsx",sheet=6)
data5 <- read_excel("국내지진발생현황_2017.xlsx",sheet=7)
data6 <- read_excel("국내지진발생현황_2017.xlsx",sheet=8)
data7 <- read_excel("국내지진발생현황_2017.xlsx",sheet=9)
data8 <- read_excel("국내지진발생현황_2017.xlsx",sheet=10)
data9 <- read_excel("국내지진발생현황_2017.xlsx",sheet=11)
data10 <- read_excel("국내지진발생현황_2017.xlsx",sheet=12)
data11 <- read_excel("국내지진발생현황_2017.xlsx",sheet=13)
data12 <- read_excel("국내지진발생현황_2017.xlsx",sheet=14)

data1

# 2017년 데이타 전체를 한번에 출력하기   
mall <- leaflet(data_all) %>% 
    addTiles( ) %>%  
    setView(mean(data_all$경도)-0.9, mean(data_all$위도)+0.5, zoom = 7) %>%  
    addCircles(~경도, ~위도, popup=paste(data_all$번호,":",
                                     data_all$발생시각,":",data_all$위치,":진도 ",data_all$규모), weight = 20,  
               color="blue", stroke = TRUE,fillOpacity = 1 ) %>%  
    addLegend("topright", colors= "blue", labels="발생지역" , title="2017년 전체") 

mall  

# 월별로 다른 색깔로 출력하기
cnt <- nrow(data_all)  
time1 <- substr(data_all$발생시각,6,7)
col <- c( )

for ( i in 1:cnt )
{ if (time1[i] == "01" )
{ col <- c(col,"red") }
    else if ( time1[i] == "02" )
    { col <- c(col,"orange") }
    else if ( time1[i] == "03" )
    { col <- c(col,"blue") }
    else if ( time1[i] == "04" )
    { col <- c(col,"yellow") }
    else if ( time1[i] == "05" )
    { col <- c(col,"darkgrey") }
    else if ( time1[i] == "06" )
    { col <- c(col,"cyan") }
    else if ( time1[i] == "07" )
    { col <- c(col,"green") }
    else if ( time1[i] == "08" )
    { col <- c(col,"gray") }
    else if ( time1[i] == "09" )
    { col <- c(col,"violet") }
    else if ( time1[i] == "10" )
    { col <- c(col,"lime") }
    else if ( time1[i] == "11" )
    { col <- c(col,"black") }
    else 
    { col <- c(col,"brown") }
}

cntall <- nrow(data_all)
cnt1 <- nrow(data1)
cnt2 <- nrow(data2)
cnt3 <- nrow(data3)
cnt4 <- nrow(data4)
cnt5 <- nrow(data5)
cnt6 <- nrow(data6)
cnt7 <- nrow(data7)
cnt8 <- nrow(data8)
cnt9 <- nrow(data9)
cnt10 <- nrow(data10)
cnt11 <- nrow(data11)
cnt12 <- nrow(data12)

mall <- leaflet(data_all) %>% 
    addTiles( ) %>%  
    setView(mean(data_all$경도)-0.9, mean(data_all$위도)+0.5, zoom = 7) %>%  
    addCircles(~경도, ~위도, popup=paste(data_all$번호,":",data_all$발생시각,":",data_all$위치,":진도 ",data_all$규모), weight = ~규모*10,  
               color=col, opacity = 0.5 ) %>%  
    addLegend("topright", colors= unique(col), labels=paste(unique(time1),"월-",summary(factor(time1)),"건"), title=paste("2017년 전체-",cntall,"건")) 

mall

# 지도 시각화 이미지 저장할 경로 지정하기 
setwd(~)
getwd()

# 지도 이미지로 저장하는 패키지 설치하기 
install_phantomjs(version = "2.1.1",
                  baseURL = "https://github.com/wch/webshot/releases/download/v0.3.1/")

## 1월 발생 현황
m1 <- leaflet(data1) %>% addTiles( ) %>%  
    setView(mean(data1$경도), mean(data1$위도), zoom = 7) %>%  
    addCircles(~경도, ~위도,popup=paste(data1$번호,":",data1$발생시각,":",data1$위치,":진도 ",data1$규모), weight = ~규모*10,  
               color="red",  opacity = 0.5) %>%  
    addLegend("topright", colors= "red", labels="지진발생위치", title=paste("2017년 1월-",cnt1,"건")) 

m1 
mapshot(m1, file = "eq_1.png")

# 2월 발생현황 

m2 <- leaflet(data2) %>% addTiles( ) %>%  
    setView(mean(data2$경도), mean(data2$위도), zoom = 7) %>%  
    addCircles(~경도, ~위도, popup=paste(data2$번호,":",data2$발생시각,":",data2$위치,":진도 ",data2$규모), weight = ~규모*10,
               color="orange" , opacity = 0.5 ) %>%  
    addLegend("topright", colors= "orange", labels="지진발생위치", title=paste("2017년 2월-",cnt2,"건")) 

m2
mapshot(m2, file = "eq_2.png")


# 3월 발생 현황 
m3 <- leaflet(data3) %>% addTiles( ) %>%  
    setView(mean(data3$경도), mean(data3$위도), zoom = 7) %>%  
    addCircles(~경도, ~위도, popup=paste(data3$번호,":",data3$발생시각,":",data3$위치,":진도 ",data3$규모), weight = ~규모*10,  
               color="blue", opacity = 0.5) %>%  
    addLegend("topright", colors= "blue", labels="지진발생위치", title=paste("2017년 3월-",cnt3,"건")) 

m3
mapshot(m3, file = "eq_3.png")

#4월 발생 현황 
m4 <- leaflet(data4) %>% addTiles( ) %>%  
    setView(mean(data4$경도), mean(data4$위도), zoom = 7) %>%  
    addCircles(~경도, ~위도, popup=paste(data4$번호,":",data4$발생시각,":",data4$위치,":진도 ",data4$규모), weight = ~규모*10,  
               color="yellow", opacity = 0.5) %>%  
    addLegend("topright", colors= "yellow", labels="지진발생위치", title=paste("2017년 4월-",cnt4,"건")) 

m4
mapshot(m4, file = "eq_4.png")

# 5월 발생 현황  
m5 <- leaflet(data5) %>% addTiles( ) %>%  
    setView(mean(data5$경도), mean(data5$위도), zoom = 7) %>%  
    addCircles(~경도, ~위도, popup=paste(data5$번호,":",data5$발생시각,":",data5$위치,":진도 ",data5$규모), weight = ~규모*10,  
               color="pink", opacity = 0.5) %>%  
    addLegend("topright", colors= "deep pink", labels="지진발생위치", title=paste("2017년 5월-",cnt5,"건")) 

m5
mapshot(m5, file = "eq_5.png")

#6월 발생 현황 
m6 <- leaflet(data6) %>% addTiles( ) %>%  
    setView(mean(data6$경도), mean(data6$위도), zoom = 7) %>%  
    addCircles(~경도, ~위도, popup=paste(data6$번호,":",data6$발생시각,":",data6$위치,":진도 ",data6$규모), weight = ~규모*10,  
               color="cyan", opacity = 0.5) %>%  
    addLegend("topright", colors= "cyan", labels="지진발생위치", title=paste("2017년 6월-",cnt6,"건")) 

m6
mapshot(m6, file = "eq_6.png")

#7월 발생 현황 
m7 <- leaflet(data7) %>% addTiles( ) %>%  
    setView(mean(data7$경도), mean(data7$위도), zoom = 7) %>%  
    addCircles(~경도, ~위도, popup=paste(data7$번호,":",data7$발생시각,":",data7$위치,":진도 ",data7$규모), weight = ~규모*10,  
               color="green", opacity = 0.5) %>%  
    addLegend("topright", colors= "green", labels="지진발생위치", title=paste("2017년 7월-",cnt7,"건")) 

m7
mapshot(m7, file = "eq_7.png")

#8월 발생 현황 
m8 <- leaflet(data8) %>% addTiles( ) %>%  
    setView(mean(data8$경도), mean(data8$위도), zoom = 7) %>%  
    addCircles(~경도, ~위도, popup=paste(data8$번호,":",data8$발생시각,":",data8$위치,":진도 ",data8$규모), weight = ~규모*10,  
               color="gray", opacity = 0.5) %>%  
    addLegend("topright", colors= "gray", labels="지진발생위치", title=paste("2017년 8월-",cnt8,"건")) 

m8
mapshot(m8, file = "eq_8.png")

#9월 발생 현황 
m9 <- leaflet(data9) %>% addTiles( ) %>%  
    setView(mean(data9$경도), mean(data9$위도), zoom = 7) %>%  
    addCircles(~경도, ~위도, popup=paste(data9$번호,":",data9$발생시각,":",data9$위치,":진도 ",data9$규모), weight = ~규모*10,  
               color="purple", opacity = 0.5) %>%  
    addLegend("topright", colors= "purple", labels="지진발생위치", title=paste("2017년 9월-",cnt9,"건")) 

m9
mapshot(m9, file = "eq_9.png")

#10월 발생 현황 
m10 <- leaflet(data10) %>% addTiles( ) %>%  
    setView(mean(data10$경도), mean(data10$위도), zoom = 7) %>%  
    addCircles(~경도, ~위도, popup=paste(data10$번호,":",data10$발생시각,":",data10$위치,":진도 ",data10$규모), weight = ~규모*10,  
               color="lime", opacity = 0.5) %>%  
    addLegend("topright", colors= "lime", labels="지진발생위치", title=paste("2017년 10월-",cnt10,"건")) 

m10
mapshot(m10, file = "eq_10.png")

#11월 발생 현황 
m11 <- leaflet(data11) %>% addTiles( ) %>%  
    setView(mean(data11$경도), mean(data11$위도), zoom = 7) %>%  
    addCircles(~경도, ~위도, popup=paste(data11$번호,":",data11$발생시각,":",data11$위치,":진도 ",data11$규모), weight = ~규모*10,  
               color="black", opacity = 0.5) %>%  
    addLegend("topright", colors= "black", labels="지진발생위치", title=paste("2017년 11월-",cnt11,"건")) 

m11
mapshot(m11, file = "eq_11.png")

#12월 발생 현황 
m12 <- leaflet(data12) %>% addTiles( ) %>%  
    setView(mean(data12$경도), mean(data12$위도), zoom = 7) %>%  
    addCircles(~경도, ~위도, popup=paste(data12$번호,":",data12$발생시각,":",data12$위치,":진도 ",data12$규모), weight = ~규모*10,  
               color="brown",  opacity = 0.5) %>%  
    addLegend("topright", colors= "brown", labels="지진발생위치", title=paste("2017년 12월-",cnt12,"건")) 

m12
mapshot(m12, file = "eq_12.png")

# --------------------------------------------------------
# animation chart 
# --------------------------------------------------------
#install.packages("animation")
#install.packages("png")
library(animation)
library(png)

ani.options(interval=1)  

for ( i in 1:12) {            
    img <-paste("eq_",i,".png",sep="")
    img2 <- readPNG(img)    
    plot.new()                 
    rect(0,0,1,1,col="white")   
    rasterImage(img2,0,0,1,1)  
    ani.pause()                
}

# 애니메이션 --> gif로 저장하기 
saveGIF({ for ( i in 1:12) {  
    ani.options(interval=1)          
    img <-paste("eq_",i,".png",sep="")
    img2 <- readPNG(img)    
    plot.new()                 
    rect(0,0,1,1,col="white")   
    rasterImage(img2,0,0,1,1)  
    ani.pause()                
}}, interval = 0.03, movie.name = "map.gif",
ani.width = 600, ani.height = 600)


# 지도 이미지 html로 저장하기 : Export -> Save as Web Page..


# --------------------------------------------------------
# 차원 축소
# --------------------------------------------------------
# 산점도는 2차원 평면상에 두 변수의 값으로 좌표로 정하여 위치를 나타내는 방법으로 
# 데이터의 분포를 관찰할 수 있는 시각화 도구
install.packages("Rtsne")
library(Rtsne)
library(ggplot2)

# --------------------------------------------------------
# 4차원 데이타를 2차원 축소
# --------------------------------------------------------
ds <- iris[,-5]               # 품종 정보 제외
head(ds)

## 중복 데이터 제거 : t-sne를 이용하려면 중복 데이터가 존재하면 안된다. 
dup = which(duplicated(ds))
dup                           # 143번째 행 중복
ds <- ds[-dup,]
ds.y <- iris$Species[-dup]    # 중복을 제외한 품종 정보(중복된 행의 품종값을 제외) 

## t-SNE 실행
tsne <- Rtsne(ds,dims=2, perplexity=10)
# dims=2: ds를 몇차원으로 축소할 지 지정
# perplexity=10 : 차원 축소 과정에서 데이타를 샘플링하는데 샘플의 개수를 몇개로 할지 지정
#                 (대상 데이타의 행의 수)/3 보다 작게 지정

## 축소결과 시각화 
df.tsne <- data.frame(tsne$Y)
head(df.tsne)

ggplot(df.tsne, aes(x=X1, y=X2, color=ds.y)) + 
  geom_point(size=2)

# --------------------------------------------------------
# 4차원 데이타를 3차원 축소
# --------------------------------------------------------
install.packages(c("rgl", "car"))
library("car")
library("rgl")
library("mgcv")

tsne <- Rtsne(ds,dims=3, perplexity=10)
df.tsne <- data.frame(tsne$Y)
head(df.tsne)

# 회귀면이 포함된 3차원 산점도
scatter3d(x=df.tsne$X1, y=df.tsne$X2, z=df.tsne$X3)

# 회귀면이 없는 3차원 산점도
points <- as.integer(ds.y)
color <- c('red','green','blue')
scatter3d(x=df.tsne$X1, y=df.tsne$X2, z=df.tsne$X3,
          point.col = color[points], 	# 점의 색을 품종별로 다르게
          surface=FALSE) 		# 회귀면을 표시하지 않음 



