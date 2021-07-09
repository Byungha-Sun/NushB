#####  access.log 파일을 읽어 들여 문자열을 파싱한다



# def logParser(logList):
#     success = 0
#     images = 0
#     for line in logList:
#         a=line.split()
#         stat=a[8]
#         b=a[6].lower()
#         if b.find('?') !=1:
#             b=b[:b.index('?')]
#         if stat=='200':
#             success+=1
#         if '.jpg' in b or '.gif' in b or '.png' in b:
#             images+=1
#     return success, images
#
# inFp=None
# inlist=''
#
# inFp=open('access.log','r')
# inlist=inFp.readlines()
#
# success,image= logParser(inlist)
#
# print('Result Status 200 count : {}'.format(success))
# print('Image file count : {}'.format((image)))
#
# inFp.close()

##### budget 함수   #######

# def budget(budgets, M):
#     answer = 0
#     low=0
#     high=max(budgets)
#
#     while low <= high:
#         mid= (low+ high)//2
#         result=0
#         for i in budgets:
#             if mid> i:
#                 result+=1
#             else:
#                 result+=mid
#         if result>M:
#             high=mid-1
#         else:
#             if result>=0:
#                 answer=mid
#             low=mid+1
#     return answer
#
#
#
# res=budget([124,124,143,170],350)
# print('각 지방의 최대 예산은 다음과 같습니다 : ', res)

import pandas as pd
import numpy as np

##DataFrame

# data=[['1000','Steve',90.72],
#       ['1001','Kevin',78.10],
#       ['1002','James',98.43]]
#
# print(type(data))
# df = pd.DataFrame(data)
#
#
# df=pd.DataFrame(data,columns=['학번','이름','점수'])
# print(df)
# print(df.info())
# print(df.columns);print(df.index);print(df.values);print(df.dtypes)

# friend_dict_list = [{'name':'John','age':20,'job':'student'},
#                     {'name':'Jenny','age':30,'job':'developer'},
#                     {'name':'Nate','age':30,'job':'teacher'}]
#
# print(type(friend_dict_list))
# df=pd.DataFrame(friend_dict_list)
# print((df))
#
# df=pd.DataFrame(friend_dict_list,columns=['age','job','name'])
# print(df)
#
# data={'id':[1,2,3],
#       'name': ['Kim','Lee','Choi'],
#       'age':[10,20,30],
#       'assets' : [150.4,123.4,56.6],
#       'job' : ['student','CEO','Dad']}
#
# print(type(data))
# df=pd.DataFrame(data)
# print(df)

from prettytable import PrettyTable
#
# def pretty_df(df):
#     print(type(df))
#     if isinstance(df,pd.DataFrame):
#         print(df.shape)
#         table= PrettyTable([' '] + list(df.columns))
#         for row in df.itertuples():
#             table.add_row(row)
#         print(str(table))
#     else:print((df))
#     print('\n')

# pretty_df(df)
#
# df.head(2)
# print(df.tail(2))
#
# print(df.loc[[0,2]])
#
# print(df.loc[df.name=='Kim','age'])
#
# df_filtered = df[df.age>25]
# df_filter = df.query('age>25')
# print(df_filter)

# df_filter=df[(df.age>25) & (df.name =='Choi')]

# df= pd.read_csv('friend_list_no_head.csv', header=None,
#                 names=['name','age','job'])
#
# pretty_df(df)

# print(df)
#
# print(df.iloc[:,0:2])

# df_filter=df[['name','age']]
# print(df_filter)
#
# print(df.filter(items=['name','age']))
#
# print(df.filter(like='a',axis=1))   ###컬럼 이름에 'a'가 포함된 컬럼 출력
#
# print(df.filter(regex='b$',axis=1))   #b로 끝나는
#
# sungjuk = [{'name':'John','midterm':95,'final':85},
# {'name':'Jenny','midterm':55,'final':80},
# {'name':'Nate','midterm':10,'final':30}]
#
# df=pd.DataFrame(sungjuk,columns=['name','midterm','final'])
# pretty_df(df)
#
# df['total'] = df['midterm']+df['final']
# print(df)
# df['average']=(df['midterm']+df['final'])/2
# print(df)
#
# grade=[]
# for i in df['average']:
#     if i>=90:
#         grade.append('A')
#     elif i> 80:
#         grade.append('B')
#     elif i >70:
#         grade.append('C')
#     elif i >60:
#         grade.append('D')
#     else:
#         grade.append('F')
#
# df['grade']=grade
# pretty_df(df)

# df.to_csv('성적.csv')

# apply() >>map()

# def pass_or_fail(row):
#     print(row)
#     if row!='F':
#         return 'Pass'
#     else:
#         return 'Fail'
#
# df.grade=df.grade.apply(pass_or_fail)
# pretty_df(df)

#
# df.loc[3]=['Kevin',80,90,170,85,'Pass']

# pretty_df(df)

# data_list=[{'birthday' : '2000-06-27'},
#            {'birthday': '2002-09-24'},
#            {'birthday': '2005-12-20'}]
#
# df_date = pd.DataFrame(data_list, columns=['birthday'])
# print(df_date)
#
# def extract_year(row):
#     return row.split('-')[0]
#
# def current_year(year,current_year):
#     return current_year- int(year)
#
# def get_introduce(age,prefix,suffix):
#     return  prefix +str(age) +suffix
#
# def get_introduce2(row):
#     return 'I was born in ' + str(row.year) + ' and my age is ' +str(row.age)
#
#
# df_date['year'] = df_date['birthday'].apply(extract_year)
# df_date['age'] = df_date['year'].apply(current_year, current_year=2019)
# pretty_df(df_date)
# df_date['introduce']=df_date['age'].apply(get_introduce,prefix='I am', suffix=' years old.')
#
# pretty_df(df_date)
#
#
# ## get_introduce를 만들어서 다음과 같이 출력 >> I was born in 2000 my age is 19
#
# df_date['introduce'] = df_date.apply(get_introduce2, axis=1)
#
# pretty_df(df_date)

# df=pd.DataFrame({'c1':['a','a','b','a','b'],
#                  'c2':[1,1,1,2,2],
#                  'c3':[1,1,2,3,3]})
# pretty_df(df)

### 중복처리  : duplicated(), 전에 나온 행들과 비교해서 중복되는 행을 찾으면 True, 첫번째 행은 자동 False

# df_dup = df.duplicated()            ###전체에서 중복값 찾기
#df_dup = df['c2'].duplicated()

# df_dup = df.drop_duplicates()       ##전체 행에서 중복값 제거
# df_dup = df.drop_duplicates(subset=['c2','c3'])    #열이름 리스트를 통해 부분 중복제거
# pretty_df(df_dup)

# years = range(1880,2019)
# df_pieces=[]
# for y in years:
#     path='names/yob%d.txt'%y
#     df= pd.read_csv(path,  header=None,
#                       names=['name','gender','birth'],
#                       encoding='utf-8')
#     df['year']=y
#     df_pieces.append(df)
# #
# # print(len(df_pieces))
# # pretty_df(df_pieces[0].head())
# # df_pieces=pd.DataFrame(df_pieces)
# # print(type(df_pieces))
#
# ###Data분석을 위한 Concat 작업 ( 열 방향으로 Data 병합)
# names= pd.concat(df_pieces,ignore_index=True)
# pretty_df(names.head())
# pretty_df(names.count())



######      남/여 아이의 출산율 증감세 확인 Pivot Table 구조 생성
# total_birth = names.pivot_table('birth',index='year',
#                                 columns='gender',aggfunc=sum)
#
# print(total_birth)
#
#
# import matplotlib.pyplot as plt
# # plt.figure()
# total_birth.plot(title='Total births by gender and year')
# plt.show()
# names2018=pd.read_csv('names/yob2018.txt',
#                       header=None,
#                       names=['name','gender','birth'],
#                       encoding='utf-8')

# print(names2018.shape)   ####    (32033,3)


###성별 합계
# print(names2018.groupby('gender').birth.sum())

# print(names2018.info())
# print(names2018)
# pretty_df(names2018)
# pretty_df(names2018[:10])
# pretty_df(names2018.head())
# pretty_df(names2018.tail())

###연도와 성별 ######
# select year,gender, sum(birth) from names group by year,gender

# total = names.groupby(['year','gender']).birth.sum()
# total.to_csv('birth_gender_CNT.csv')

# def cnt_birth_gender():
#     ret = []
#     for y in range(1880,2019):
#         cnt_f=0
#         cnt_m=0
#         filename='names/yob%d.txt' %y
#         with open(filename,'r') as f:
#             data=f.readlines()
#             for d in data:
#                 if d[-1] =='\n':
#                     d=d[:-1]
#                 tmp = d.split(',')
#                 gender = tmp[1]
#                 birth=tmp[2]
#                 if gender =='F':
#                     cnt_f += int(birth)
#                 else:
#                     cnt_m += int(birth)
#         ret.append((y,cnt_f,cnt_m))
#     return  ret
#
# result=cnt_birth_gender()
#
# with open('cnt_birth_gender.csv','w') as f:
#     for y, bf, bm in result:
#         data= '%s,%s,%s\n'%(y,bf,bm)
#         print(data)
#         f.write(data)


# from os.path import exists
#
# def getTop10BabyName(year):
#     nameF={}
#     nameM={}
#
#     filename= 'names/yob%s.txt' %year
#     if not exists(filename):
#         print('[%s] 파일이 존재하지 않습니다.' %filename)
#         return None
#
#     with open(filename,'r') as f:
#         data = f.readlines()
#         for d in data:
#             if d[-1] =='\n':
#                 d=d[:-1]
#
#                 tmp =d.split(',')
#                 name=tmp[0]
#                 sex=tmp[1]
#                 birth= tmp[2]
#
#             if sex =='F':
#                 ret=nameF
#             else:
#                 ret=nameM
#
#             if name in ret:
#                 ret[name] += int(birth)
#             else:
#                 ret[name] = int(birth)
#
#     retF= sorted(nameF.items(),key=lambda  x:x[1], reverse=True)
#     retM = sorted(nameM.items(), key=lambda x: x[1], reverse=True)
#
#     for i, name in enumerate(retF):
#         if i > 9 :
#             break
#         print('TOP_%d 여자아기이름: %s' %(i+1,name))
#
#     for i, name in enumerate(retM):
#         if i > 9 :
#             break
#         print('TOP_%d 남자아기이름: %s' %(i+1,name))
#
# y=input('인기순 상위 10개 이름을 알고 싶은 출생년도를 입력하세요 (예:2001): ')
# getTop10BabyName(y)