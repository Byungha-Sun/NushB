#웹 스크래핑(web scraping)
#: 웹 사이트 상에서 원하는 부분에 위치한 정보를 컴퓨터로 하여금 자동으로 추출하여 수집하는 기술

#웹크롤링(web crawling)
#: 자동화 봇(bot)인 웹 크롤러가 정해진 규칙에 따라 복수 개의 웹 페이지를 브라우징 하는 행위

# from bs4 import BeautifulSoup
# import urllib.request as request
# html='''
# <html>
#     <body>
#         <h1>웹스크래핑</h1>
#         <p>웹 페이지를 분석하는 도구</p>
#         <p>원하는 부분을 추출할 수 있음</p>
#     <body>
# </html>
# '''
# soup = BeautifulSoup(html,'html.parser')
# # print(soup)
#
# h1 = soup.html.body.h1
# p1= soup.html.body.p
# p2= p1.next_sibling.next_sibling
#
# print('h: '+h1.string)
# print('p1: '+p1.string)
# print('p2: '+p2.string)

########################33
#
# html='''
# <html>
#     <body>
#         <ul>
#             <li><a href='http://www.naver.com'>naver</a></li>
#             <li><a href='http://www.daum.net'>daum</a></li>
#             <li><a href='http://www.google.com'>google</a></li>
#         <ul>
#     <body>
# </html>
# '''
# soup = BeautifulSoup(html,'html.parser')
# links=soup.find_all('a')
#
# for a in links:
#     href = a.attrs['href']
#     text= a.string
#     print(text,':',href)



# url= 'http://www.kma.go.kr/weather/forecast/mid-term-rss3.jsp'
# res=request.urlopen(url)
# soup = BeautifulSoup(res,'html.parser')
# title=soup.find('title').string
# wf=soup.find('wf').string
#
# print(title)
# print(wf)

# html='''
# <html>
# <body>
# <div id="main-goods" role="page">
#   <h1>과일과 야채</h1>
#   <ul id="fr-list">
#     <li class="red green" data-lo="ko">사과</li>
#     <li class="purple" data-lo="us">포도</li>
#     <li class="yellow" data-lo="us">레몬</li>
#     <li class="yellow" data-lo="ko">오렌지</li>
#   </ul>
#   <ul id="ve-list">
#     <li class="white green" data-lo="ko">무</li>
#     <li class="red green" data-lo="us">파프리카</li>
#     <li class="black" data-lo="ko">가지</li>
#     <li class="black" data-lo="us">아보카도</li>
#     <li class="white" data-lo="cn">연근</li>
#   </ul>
# </div>
# <body>
# </html>
# '''

# soup = BeautifulSoup(html,'html.parser')
#
# ##  CSS 선택자로 추출하기
# print(soup.select('#ve-list> li')[3].string)
# print(soup.select('#ve-list > li.black')[1].string)
#
#
# ##(2) find 매서드로 추출하기
#
# cond= {'data-lo':'us','class':'black'}
# print(soup.find('li',cond).string)
#
# ###(3)
#
# print(soup.find(id='ve-list').find('li',cond).string)


# url = 'https://ko.wikisource.org/wiki/%EC%A0%80%EC%9E%90:%EC%9C%A4%EB%8F%99%EC%A3%BC'
# res=request.urlopen(url)
# soup = BeautifulSoup(res,'html.parser')
#
# a_list= soup.select('#mw-content-text > div > ul > li > a ')
#
# for i, a in enumerate(a_list,start=1):
#     name = a.string
#     print(i,':',name)



