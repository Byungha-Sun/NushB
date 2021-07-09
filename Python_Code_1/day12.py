import feedparser
import  newspaper
import pandas as pd
import numpy as np
import xlrd
import openpyxl
from datetime import datetime
import matplotlib.pyplot as plt
from wordcloud import WordCloud
import nltk
from PIL import Image
#
#
# feeds= feedparser.parse('http://www.khan.co.kr/rss/rssdata/economy_news.xml')
# links=[entry['link'] for entry in feeds['entries']]
#
# news_text=''
# for link in links:
#     article=newspaper.Article(link,language='ko')
#     article.download()
#     article.parse()
#     news_text+=article.text
#
# # print(news_text[:])
# from konlpy.tag import  Twitter; t= Twitter()
#
# news_nouns=t.nouns(news_text)
# print(len(news_nouns))
#
# news_nouns = [n for n in news_nouns if len(n) > 1]
# # print(news_nouns[:50])
#
# from collections import Counter
# cnt=Counter(news_nouns)
# tags = cnt.most_common(50)
# # print(tags)
#
#
# data=cnt.most_common(50)
#
# tmp_data=dict(data)
# greenhouse_img=np.array(Image.open('korea_mask.jpg'))
# wordcloud = WordCloud(font_path='/Library/Fonts/malgun.ttf',
#                       relative_scaling=0.2,
#                       background_color='white',
#                       mask=greenhouse_img).generate_from_frequencies(tmp_data)
# plt.figure(figsize=(12,5))
# plt.imshow(wordcloud)
# plt.axis('off')
# plt.show()

# from konlpy.tag import Kkma
# kkma=Kkma()
# kor1=kkma.sentences('한국어 분석을 시작합니다. 재미있어요~ㅎㅎ')
# kor2=kkma.nouns('한국어 분석을 시작합니다. 재미있어요~ㅎㅎ')
# kor3=kkma.pos('한국어 분석을 시작합니다. 재미있어요~ㅎㅎ')
#
# print('%s\n'%kor1)
# print('%s\n'%kor2)
# print('%s\n'%kor3)
#
# from konlpy.tag import Twitter
# t=Twitter()
# kor4=t.nouns('한국어 분석을 시작합니다. 재미있어요~ㅎㅎ')
# kor5=t.morphs('한국어 분석을 시작합니다. 재미있어요~ㅎㅎ')
# kor6=t.pos('한국어 분석을 시작합니다. 재미있어요~ㅎㅎ')
#
# print('%s\n'%kor4)
# print('%s\n'%kor5)
# print('%s\n'%kor6)

from wordcloud import WordCloud
# from google.colab import files
# uploaded= files.upload()
#
# for fn in uploaded.keys():
#     print('User uploaded file "{name}" with length {length} bytes'.format(name=fn, lenght=len(uploaded[fn])))
#



# text=open('dream.txt','r',encoding='UTF-8').read()
# wc=WordCloud().generate(text)
# plt.figure(figsize=(12,6))
# plt.imshow(wc, interpolation='bilinear')
# plt.axis('off')
# plt.show()


# from bs4 import BeautifulSoup
# from urllib.request import urlopen
# import urllib
# import time
#
# tmp1='https://search.naver.com/search.naver?where=kin'
# html = tmp1 + '&sm=tab_jum&ie=utf8&query={key_word}&start={num}'
#
# response = urlopen(html.format(num=1, key_word=urllib.parse.quote('류현진')))
# soup=BeautifulSoup(response,'html.parser')
# tmp=soup.find_all('dl')
#
# tmp_list=[]
# for line in tmp:
#     tmp_list.append(line.text)
#
# print(tmp_list)

