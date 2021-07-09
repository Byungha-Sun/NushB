import csv
import pandas as pd
import matplotlib.pyplot as plt
import numpy as np

# '''
# -우리 동네 인구 구조와 비슷한 형태를 가진 지역은 어딜까?
# 1)행안부(공공)데이터를 통해 데이터 수집
# 2)수집한 데이터를 로드
# 3)본인이 사는 동네의 인구 구조를 별도로 저장
# 4)본인 동네와 인구 구조(밀도)가 가장 유사한 지역을 찾는 작업
# 5)확인? 시각화를 통해 비교-확인 수행
# '''
#
# f=open('pop2.csv')
# data=csv.reader(f)
# next(data)  #header remove
#
# for row in data:
#     print(row)


# name = input('인구 구조가 알고 싶은 지역의 이름(읍/면/동)을 입력하세요 :  ')
# f=open('pop2.csv')
# data=csv.reader(f)
# next(data)  #header remove
#
# for row in data:
#     if name in row[0]:
#         for i in row[3:]:
#             home = np.array(row[3:], int)
#
# print(home)
#
# plt.rc('font',family= 'Malgun Gothic')
# plt.title(name+'지역의 인구구조')
# plt.plot(home)
# # plt.show()
#
# name = input('인구구조가 알고 싶은 지역의 이름(읍/면/동)을 입력하시오 : ')
#
# f=open('pop2.csv',encoding='CP949')
# data=csv.reader(f)
# next(data) #header(컬럼부분) 를 제거
#
# for row in data:
#     if name in row[0]:
#         for i in row[3:]:
#             home = np.array(row[3:], int)
# print(home)
# #나이별 인구 분포 그래프
# plt.rc('font', family='Malgun Gothic')
# plt.title(name+ '지역의 인구구조')
# plt.plot(home)
# plt.bar(range(101),home)
# plt.show()
#
# #########################
#
# m,f = [], []
# name= input('인구 구조가 알고 싶은 지역의 이름(읍/면/동 단위)을 입력해 주세요: ')
# for row in data:
#     if name in row[0]:
#         for i in row[3:104]:
#             m.append(-int(i))
#         for i in row[106:]:
#             f.append(int(i))
#
# plt.style.use('ggplot')
# plt.figure(figsize=)

# f=open('pop2.csv')
# data= csv.reader(f)
# next(data) ##헤더부분 제거
# data= list(data)
#
# #2. 궁금한 지역의 이름을 입력받는다
#
# name=input('인구 구조가 알고 싶은 동네 이름을 입력하세요 : ')
#
# mn =1 ; result_name = ''; result=0
# home=0
#
# #3 궁금한 지역의 인구구조를 저장한다.
# for row in data:
#     if name in row[0]:
#         home=np.array(row[3:], dtype=float)/ float(row[2])    #home=나이별(0세부터~전체)/연령구간인구수
#
# #4. 궁금한 지역의 인구구조와 가장 비슷한 인구구조를 가진 지역을 찾는다.
# #모든 지역에 반복해서 연령별 인구비율 차이의 최솟값을 구한다.
# #찾고자 하는 지역의 인구비율을 home에 저장, 전체 지역의 인구비율을 away에 저장해 차이값의 한계를 tot 변수에 저장
# #여기에 최솟값을 구하기 위해 mn, result_name, result 세 가지 객체를 추가로 생성
# #mn은 최솟값을 저장하고 result_name은 ㅚ솟값을 가진 지역이름을 저장, result는 최솟값을 가진 지역의 연령대별인구비율저장
#
# for row in data:
#     away=np.array(row[3:], int) / int(row[2])
#     tot= np.sum((home-away)**2)
#     if tot< mn and name not in row[0]:
#         mn=tot
#         result_name = row[0]
#         result = away
#
#
#
# print(result_name,mn)
#
#
# plt.style.use('ggplot')
# plt.figure(figsize=(7,4),dpi=100)
# plt.rc('font',family='Malgun Gothic')
# plt.rcParams['axes.unicode_minus']=False
# plt.title(name + '지역과 가장 비슷한 인구구조를 가진 지역')
# plt.plot(home,label=name)
# plt.plot(result,label=result_name[10:1])
# plt.legend()
# plt.show()

import xlrd
# df=pd.read_excel('남북한발전전력량.xlsx')
# df=pd.DataFrame(df)
# df_ns = df.iloc[[0,5], 3:]
# df_ns.index=['South', 'North']
# # # print(df_ns)
# df_ns.columns=df_ns.columns.map(int)
# tdf_ns = df_ns.T
# plt.rc('font',family='Malgun Gothic')
#
# tdf_ns.plot(kind='line')   ###bar, barh,line,his,box
# plt.title('남북한발전전력량')
# plt.xlabel('년도')
# plt.ylabel('전력량')
# plt.show()
#


# df = pd.read_csv('pop2.csv',encoding='utf-8',index_col=0)
# print(df.head())
# ##전체데이터를 '총인구수'로 나눠서 비율로 변환>>> dataframe 저장
#
# df=df.div(df['2020년07월_계_총인구수'],axis=0)
# print(df.head())
#
# # 총인구수, 연령구간인구수 컬럼 삭제
#
# # del df['총인구수'],df['연령구간인구수']
# # print(df.heard())
#
# name=input('인구 구조가 알고 싶은 지역의 이름(읍면동 단위)을 입력해 주세요  : ')
#
# pos=df.index.str.contains(name)
# df2=df[pos]
# # print(df2.head())
#
# df3=df2.T
# print(df3.head())
# plt.rc('font',family='Malgun Gothic')
# df3.plot()
# plt.show()



# # 궁금한 지역 A의 인구 비율에서 B의 인구 비율을 뺀다.
#
# x=df.sub(df2.iloc[0],axis=1)
#
# #A의 인구 비율에서 B의 인구 비율을 뺀 값의 제곱 값을 모두 더한다.
#
# y= np.power(x,2)
# z= y.sum(axis=1)
#
# #pandas의 sort_values() 정렬 함수와 슬라이싱을 이용하여 상위 몇 개 지역 선택
# i=z.sort_values().index[:5] # 차이가 가장 작은 지역 5곳 선택
#
# #꺽은선 그래프로 표시
#
# plt.rc('font',family='Malgun Gothic')
# df.loc[i].T.plot(rot=60)
# plt.show()

import lxml
# df_list=pd.read_html('https://www.fdic.gov/Bank/individual/failed/banklist.html')
# print(df_list)
# print(len(df_list))
#
import openpyxl

# medal_list= pd.read_html('https://en.wikipedia.org/wiki/All-time_Olympic_Games_medal_table',
#                          header=0, index_col=0)
#
# # print(medal_list[1])
#
# #summer olympic
#
# summer=medal_list[1].iloc[:,:5] #모든 행, 하계 올림픽에 해당하는 데이타만
# # print(summer)
#
# summer.columns=['경기수','금','은','동','계']
# # print(summer)
#
# summer_g=summer.sort_values('금',ascending=False)
# summer_s=summer.sort_values('은',ascending=False)
# summer_b=summer.sort_values('동',ascending=False)
#
# with pd.ExcelWriter('하계올림픽메달.xlsx') as writer:
#     summer_g.to_excel(writer, sheet_name='금메달')
#     summer_s.to_excel(writer, sheet_name='은메달')
#     summer_b.to_excel(writer, sheet_name='동메달')





# winter=medal_list[1].iloc[:,5:10]
#
#
# winter.columns=['경기수','금','은','동','계']
#
# winter_g=winter.sort_values('금', ascending=False)
# winter_s=winter.sort_values('은', ascending=False)
# winter_b=winter.sort_values('동', ascending=False)
#
# with pd.ExcelWriter('동계올림픽메달.xlsx') as writer:
#     winter_g.to_excel(writer,sheet_name='금메달')
#     winter_s.to_excel(writer, sheet_name='은메달')
#     winter_b.to_excel(writer, sheet_name='동메달')
