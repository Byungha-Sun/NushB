# import pandas as pd
# import numpy as np
# import xlrd
# import openpyxl
# from datetime import datetime
# import matplotlib.pyplot as plt
# import seaborn
#
#
# kor_popul = pd.read_html('https://ko.wikipedia.org/wiki/%EB%8C%80%ED%95%9C%EB%AF%BC%EA%B5%AD%EC%9D%98_%EC%9D%B8%EA%B5%AC'
#                          ,header=0, index_col=0)
#
# # print(len(kor_popul))
# # print(kor_popul[0])
# # print(kor_popul[1])
#
# df=kor_popul[1]
# # print(df.head()) #1925~~
# # print(df.tail())  #2019
# # print(df.shape)   #(95,8)
#
# # seaborn.set(font='Malgun Gothic')
# # # print(df.columns)
# # plt.figure(figsize=(15,4))
# # plt.xticks(rotation=60)
# # # seaborn.pointplot(data=df, x=df.index, y='tot_pop', rot='vertical')
# # seaborn.lineplot(data=df, x=df.index, y= '사망자수(명)',color='red')
# # seaborn.lineplot(data=df, x=df.index, y= '출생자수(명)',color='orange')
# #
# # plt.show()
# #
#
# #### 연도별 출생자수 시각화
# # seaborn.lineplot(data=df, x=df.index, y= '출생자수(명)')
#
#
# #### pandas 사용해서 그래프 뽑기!!   ####
#
#
#
# # print(df.head())
# df_pop=df[[ '출생자수(명)', '사망자수(명)']]
# # print(df_pop)
# # df_pop.plot()
# # plt.show()
#
# # print(df_pop[-50:])
# # df_pop50=df_pop[-50:]
# # df_pop50.plot()
# # plt.show()
#
# df_pop1=df_pop[-30:]
# df_pop2=df_pop[-60:-30]
# df_pop3=df_pop[:-60]
#
# df_pop1.plot()
# plt.show()

