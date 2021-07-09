######################          주식문제                ################################3


# from maxProfit_sub import max_profit
#
# fp=open('data1.txt','r')
# strList = fp.read().splitlines()
# fp.close()
#
#
# for x in strList:
#     stock = list(map(int,x.split(',')))
#     res = max_profit(stock)
#
#     print('{}번째 날에 사서 {}번째 날에 팔았을 때 최대 수익이 {} 입니다.'.format(res[0]+1,res[1]+1,res[2]))
#


#######################            과일구매                  ####################3

#
# from fruitPurchase_sub import fruitPurchase
# fp=open('data2.txt','r')
# strlist = fp.read().splitlines()
# fp.close()
#
# fruitDics={}
#
# for fruit in strlist:
#     datalist=fruit.split()
# #
#
#
#
#
#
# ##################               판매실적           #########################3
#
#
# from productSales_sub import productSales
#
# fp=open('data3.txt','r')
# strList=fp.read().splitlines()
# fp.close()
#
# sales_cnt = int(input('평가 판매 실적 : '))
# survey_grade = int(input('품질 평가 기준 : '))
# gp,bp = productSales(strList,sales_cnt,survey_grade)
#
# print('우수 상품으로 선정된 품목 ', gp)
# print('판매 중지로 판정된 품목', bp)


import pandas as pd
# #
# # data= [1,3,5,7,9]
# # s= pd.Series(data)
# # print(s)
#
# from pandas import Series, DataFrame
# # data2 = [3,6,6,1,16,-3,]
# # s=Series(data)
# # print(s)
# #
# # print(s.values)
# # print(s.index)
# #
# # data3=Series([4,6,-7,3], index=['a','b','c','d'])
# # print(data3)
# # print(data3.index)
# # print(data3[data3>0])
# # print(data3['b'])
# #
# # sdata={'OHIO':35000,'TEXAS':71000,'OREGON':16000,'UTAH':5000}
# # data3=Series(sdata)
# # print(data3)
# #
# # states = ['CALIFORNIA','OHIO','OREGON','TEXAS']
# # data4=Series(sdata,index=states)
# # print(data4)
#
# #
# # raw_data = {'col0':[1,2,3,4],
# #             'col1' : [10,20,30,40],
# #             'col2':[100,200,300,400]}
# #
# # data=DataFrame(raw_data)
# # print(data)
# #
# # print(data['col0'])
# # print(data['col1'])
# # print(data['col2'])
# #
# # print(type(data))
#
# datapoint={'name':['Lee','Kim','Park','Sun','Lim'],
#            'year' : [2017,2018,2019,2018,2017],
#            'points' : [1.5,1.7,3.6,2.4,2.9]}
# # # print(type(datapoint))
# #
# # df1 = pd.DataFrame(datapoint)
# # # print(type(df1))       ####Dict -> DataFrame으로 변경 ###
# #
# df2= pd.DataFrame(datapoint,columns=['year','name','points','penalty'],
#                   index=['one','two','three','four','five'])
#
# # print(df1);print(df2)
#
# # print(df1['year'])
# # print(df1[['year','points']])    ######     2개 이상 갖고올 때, 대괄호        #####
#
# df2['penalty'] =0.5
#
# # print(df2)
#
# df2['penalty']=[0.1,0.2,0.3,0.4,0.5]
#
import numpy as np
#
# df2['zero']=np.arange(5)
# # print(df2)
#
# dates= pd.date_range('20200720', periods= 10)
# # print(dates)
#
#
# df3=pd.DataFrame(np.random.randn(10,4), index=[dates],
#                  columns=['A','B','C','D'])
#
# # print(df3)
# #
# # print(df3.values)
# # print(df3.index)
# # print(df3.columns)
# #
# # print(df3.describe())  ##   데이터의 기초 통계   ##
# # print(df3.sort_values(by='A',ascending=False))
#
# # print(df3['A'])
# #
# # print(df3[0:3])
# #
# # print(df3.loc['2020-07-21',['C']])
#
# ##두 날짜 7/23 ~ 7/25 까지의 B,C 열의 정보를 추출
#
# # print(df3.loc['2020-07-23':'2020-07-25',['B','C']])
# #
# # print(df3.loc[:,['D']])
# #
# # print(df3.iloc[0:2,0:2])
# #
# # print(df3.iloc[[0,1,3],1:3])
#
# # print(df3['A']>0)
#
# # df3['E'] = np.nan
# # df3.loc['2020-07-24',['E']]=2
# # print(df3)
#
# # df3['F']=df3['A']+df3['B']
# # print(df3)
#
# df2['penalty']=0.5
# print(df2)
#
# sval=pd.Series([-1.2,-1.5,-1.7], index=['one','three','five'])
# df2['debt']=sval
# # print(df2)
#
# df2['net_points']=df2['points']-df2['penalty']
# print(df2)
#
# df2['high_points']=df2['net_points']>2.0
# print(df2)
#
# del df2['net_points']
# del df2['high_points']
# del df2['zero']
#
# print(df2.columns)
#
#
# # print(df2.loc['two':'four','points'])
#
# print(df2)
#
# print(df2.loc[:,'points'])
# #

#
# data={'id': [1,2,3],
#       'name': ['Kim','Lee','Choi'],
#       'age' : [10,20,30],
#       'assets' : [150.4,123.4,56.6],
#       'job'  : ['student','CEO','Dad']}
#
# df4=pd.DataFrame(data)
# # print(df4);print(type(df4));print(df4.dtypes);print(df4.info())
# #
# # print(df4.loc[df4.name=='Kim','age'])
# #
# # df4['hobby']='watching_movies'
# # print(df4)
#
# #######numpy를 이용하여 age2를 생성하는데, 값이 10,20,30 으로 입력되게
#
# df4['age2']=np.arange(1,4)*10
# # print(df4)
# newcol=pd.Series(['서울','None','대구'], index=[2,1,0])
#
# df4['addr']=newcol
# # print(df4)
#
# df4.loc[3]=[4,'Sun',26,84621.24,'CEO','none',0]
# # print(df4)
# # print(df4);print(type(df4));print(df4.dtypes);print(df4.info())
#
# # print(df4.T)
#
# gugu={'dan1':pd.Series(range(10)),
#       'dan2':pd.Series(range(10))*2,
#       'dan3':pd.Series(range(10))*3}
#
# df=pd.DataFrame(gugu)
# # print(df)
#
# df.index=pd.Series(['영','일','이','삼','사','오','육','칠','팔','구'])
# # print(df)
#
# df['4단']= np.arange(10)*4
# # print(df)
#
# df['11단']=np.arange(10)*11
# df.columns=['1단','2단','3단','4단','11단']
# print(df)
#
# df_csv=pd.read_csv('test.csv')
# # print(df_csv)
#
# df_csv['d']=0
# print(df_csv)
#
# df_csv.to_csv('test2.csv')
#
# cross_df_csv=pd.DataFrame(df_csv.T)
# print(cross_df_csv)
# cross_df_csv.to_csv('test3.csv')


