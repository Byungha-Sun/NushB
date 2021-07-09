# import urllib.request
# import re
#
#
# url = 'https://finance.naver.com/item/main.nhn?code=005930'
#
# html=urllib.request.urlopen(url)
# html_contents = str(html.read().decode('ms949'))
#
# #첫번째 패턴
#
# stock_results = re.findall("(\<dl class=\"blind\"\>)([\s\S]+?)(\<\/dl\>)", html_contents)
#
# print(stock_results)
#
# samsung_stock = stock_results[0]
# samsung_index= samsung_stock[1]
#
# ### 주식정보만 추출
#
# index_list = re.findall("(\<dd\>)([\s\S]+?)(\<\/dd\>)",
#                         samsung_index)
#
# for index in index_list:
#     print(index[1])


##예제 2) 네이버 금융에서 원/달러 환율 정보 추출하기

# from bs4 import BeautifulSoup
# import urllib.request as req
#
# url = 'https://finance.naver.com/marketindex/'
#
# #urlopen() 으로 데이타 가져오기
#
# res = req.urlopen(url)
# res = res.read().decode('cp949')   ##UTF-8, cp949, ms949
#
# ### BeautifulSoup으로 분석하기
#
# soup = BeautifulSoup(res,'html.parser')
#
# ##원/달러 환율 데이타 추출하기
# price = soup.select_one('#exchangeList > li.on > a.head.usd > div > span.value').string
#
# print('usd/krw = ',price)
#
# ##원/엔 환율 데이타 추출하기
# price = soup.select_one('#worldExchangeList > li.on > a.head.jpy_usd > div > span.value').string
# print('jpy/krw =', price)


##진호형 답
# from bs4 import BeautifulSoup
# import urllib.request as req
#
# url = "https://finance.naver.com/marketindex/"
#
# # urlopen()으로 테이터 가져오기
# res = req.urlopen(url)
# res = res.read().decode('cp949')    # UTF-8, cp949, ms949
#
# # # BeautifulSoup 으로 분석하기
# soup = BeautifulSoup(res, "html.parser")
#
# # # 원/ 달러 환율 데이터 추출하기
# price = soup.select_one("#exchangeList > li.on > a.head.usd > div > span.value").string
# print("usd/krw =", price)
#
# # # 엔/ 달러 환율 데이터 추출하기
# price = soup.select_one("#worldExchangeList > li.on > a.head.jpy_usd > div > span.value").string
# print("jpy/krw =", price)


# ##네이버 실시간 영화 랭킹
# from bs4 import BeautifulSoup
# import requests
#
# ##네이버 영화 랭킹 사이트
# url = 'https://movie.naver.com/movie/sdb/rank/rmovie.nhn'
# response = requests.get(url)
# source = response.text
#
# soup = BeautifulSoup(source,'html.parser')
#
# movieList = soup.select('#old_content > table > tbody > tr > td.title > div > a')
#
# for rank, data in enumerate(movieList, start=1):
#     print(rank, data.text)


from selenium import webdriver
# import time
#
# #드라이브 지정
# path='chromedriver.exe'
# driver=webdriver.Chrome(path)
#
# #구글 사이트 검색
# driver.get('http://www.google.com')
# time.sleep(3)
#
# search_box = driver.find_element_by_name('q')
# search_box.send_keys('python')
# search_box.submit()
# time.sleep(5)
#
# driver.close()


###예제 5) 네이버 top10 뉴스 검색

path= './chromedriver.exe'
driver= webdriver.Chrome(path)

##검색사이트 입력
driver.get('http://news.naver.com')
elem= driver.find_element_by_id('right.ranking_contents')
lis=elem.find_elements_by_tag_name('li')

for li in lis :
    print(li.text)

driver.close()


