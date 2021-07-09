import pandas as pd
import numpy as np
import xlrd
import openpyxl
from datetime import datetime
import matplotlib.pyplot as plt

# url = 'https://search.naver.com/search.naver?sm=top_hty&fbm=1&ie=utf8&query=%ED%99%98%EC%9C%A8%EC%A1%B0%ED%9A%8C'
#
# tables = pd.read_html(url)     ##DataFrame = talbe = 행렬 = 2차원구조
# print(len(tables))
# print(tables[0])   # 데이터 분석에서 결측데이터(결측치) = Null= Nan = 이상치 등은 제거!
# print(tables[1])

# df2=tables[1]
# df2.index= df2['통화명']
# print(df2)

# from matplotlib import font_manager as fm
# font_name = fm.FontProperties(fname="c:/Windows/Fonts/malgun.ttf").get_name()
# plt.rc('font', family=font_name)
# plt.rc('font', family='Malgun Gothic')

# df2.plot(figsize=(7,4), title='네이버환율정보(20200806)',rot=60, grid=True)
# plt.show()

# df2.plot(kind='barh', figsize=(7,4), title='네이버환율정보(20200806)',rot=60, grid=True)
# plt.show()

# df2.plot(kind='area', figsize=(7,4), title='네이버환율정보(20200806)',rot=60, grid=True)
# plt.show()


##          boxplot   : 기초통계를 근거로 한 plot

# df2.boxplot()
# plt.show()

import seaborn as sb
## 통계데이터 시각화

# sb.distplot(df2['매매기준율'])
# plt.show()

from datetime import datetime
##날짜 형식(format) 조정 할 때!

# cur_time=datetime.now()
#
# filename = './' + cur_time.strftime('%y-%m-%d') + '-' + '네이버환율정보.xlsx'
#
# df2.to_excel(filename,sheet_name=cur_time.strftime('%y-%m-%d'))



###    Frame을 제공하는 사이트인 경우
###    그렇지 않은 경우는 직접 퍼서 저장한다.



################          Wordcloud 를 이용한 텍스트 마이닝         ################



