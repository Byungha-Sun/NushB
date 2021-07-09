# money,c500,c100,c50,c10 = 0,0,0,0,0
#
# money = int(input('교환할 돈은 얼마? : '))
# c500 = money//500
#
# money%=500
# c100=money//100
#
# money%=100
# c50=money//50
#
# money%=50
# c10=money//10
#
# money%=10
#
# print('\n 500원짜리 ==> %d개' %c500)
# print('100원짜리 ==> %d개' %100)
# print('50원짜리 ==> %d개' %50)
# print('10원짜리 ==> %d개' %10)
# print('바꾸지 못한 잔돈 ==> %s원' %money)
#

##복습

# strdata1= 'I love '; strdata2='Python '; strdata3='You'
# listdata1= [1,2,3] ; listdata2= [4,5,6]
# print(strdata1 + strdata2)
# print(strdata1 + strdata3)
# print(listdata1+listdata2)
#
# import operator
# add_list=map(operator.add, listdata1, listdata2)
# print(list(add_list))
# print(sum(listdata1) + sum(listdata2))
#
# artist= '빅뱅'
# sing = '뱅'
# song = artist + '이 부르는 ' + sing*3
# print(song)
#
# add_list=map(operator.sub, listdata1,listdata2)
# print(list(add_list))

# txt1= '자바'; txt2='파이썬'
# num1=5; num2=10
# print('나는 %s보다 %s에 더 익숙합니다' %(txt1,txt2))
# print('%s은 %s 보다 %s배 더 쉽습니다' %(txt2,txt1,num1))
# print('%s + %s = %s' %(num1,num2,num1+num2))
# print('{0} + {1} = {2}'.format(num1,num2,num1+num2))
# print('작년 세계 경제 성장률은 전년에 비해 %s%% 포인트 증가했다' %num1)
#
# strdata= 'Time is money!!'
# print(strdata[1:3])
# print(strdata[:7])
# print(strdata[9:13])
# print(strdata[:-3])
# print(strdata[-3:])
# print(strdata[:])
# print(strdata[::2])

#
# a= 2
# b= 4
# ret6=a+a*b/a #나누기먼저
# ret7= (a+b)*(a-b)
# ret8=a*b**a #제곱먼저
#
# print(ret6)
# print(ret7)
# print(ret8)

# ---------------------------------

# t0=[]
# t1=()
# print(type(t0),type(t1))  ##tuple은 값 변경 불가 (list와 매우 흡사!)
#
# t2=(1,)
# t3=(1,2,3)
# t4=1,2,3
# t5=('a','b',('ab','cd'))
#
# t1=(1,2,'a','b')
# print(t1[0])
# print(t1[1:])
# t2=(3,4)
# print(t1+t2)
# print(t2*2)         ##list와 연산 같음!

##Dictionary --중괄호! {} key와 value 형태!

# dic={'name' : 'LGU+', 'phone' : '01012345678', 'birth' : '1118'}
# print(dic)
#
# a= {1: 'a'}
# a[2] = 'b'
# a['name']= 'LGU+'
# a[3] = [1,2,3]
# print(a)
#
# del a[3]
# print(a)
#
# del a['name']
# print(a)


#------------------------------------------------------------------

# menu={
# '아메리카노':2500,
# '밀크티':5500,
# '카푸치노':4000,
# '카페라떼':3000,
# '스무디':5000,
# '선병하스페셜' : 25000}
#
# aa_price= menu['아메리카노']
# cup_cnt=int(input('몇잔드실?'))
# print('아메리카노의 %s 잔의 가격은 %s원입니다.'%(cup_cnt,aa_price*cup_cnt)

# persons = [('박태균',25), ('이효정',25),('선병하',26)]
# print(type(persons))
# mydict=dict(persons)
# print(type(mydict))
# print(mydict['선병하'])
#
# age= mydict['선병하']
# print (age)
#
# scores = dict(a=80,b=50,c=100)
# print(type(scores))
# print(scores['b'])

# dict1 = {'a':1,'b':2,'c':3,'d':4}
# print(dict1['a'])
#
# dict1['e'] = 5
# print(dict1)
# dict1['b']= 19
# print(dict1)
# print(len(dict1))

# solar1=['태양','수성','금성','지구','화성','목성','토성','천왕성','해왕성']
# solar2=['Sun','Mercury','Venus','Earth','Mars','Jupiter', 'Saturn','Uranus','Neptune']
# solardict={}
# for i,k in enumerate(solar1):
#     val = solar2[i]
#     solardict[k] = val
#
# print(solardict)

#==============================================


# dic={'name' : 'LGU+', 'phone' : '01012345678', 'birth' : '1118'}
# #
# # print(dic.keys())
# # for k in dic.keys():
# #     print(k)
#
# print(list(dic.keys()))
# print(dic.items())
# print(dic.values())
# print('birth' in dic)
##dic.clear()

# names={'Mary':10999, 'Sams':2111, 'Aimy':9778, 'Tom': 20245,'Michale':27115,'Bob':5887, 'Kelly':7885}
# names['Aimy'] = 10000
# # print(names)
# #
# # names1=dict(Mary=10999)
# # print(names1)
# # print(type(names1))
# #
# # ##del names['Sams']
# # print(names)
# # ##names.clear()
# # print(names)


# names={'Mary':10999, 'Sams':2111, 'Aimy':9778, 'Tom': 20245,'Michale':27115,'Bob':5887, 'Kelly':7885}
# ks=names.keys()
# print(ks)
#
# for k in ks:
#     print('Key:%s \t\tValue:%d' %(k,names[k]))

# vals= names.values()
# print(vals)
#
# vals_list=list(vals)
# ret = sum(list(vals))
# print('출생아 수 총계 : %s' %ret)

# items=names.items()
# print(items)
#
# for item in items:
#     print(item)


# k=input('이름을 입력하세요: ')
# if k in names:
#     print('이름이 <%s>인 출생아수는 <%s> 명 입니다'%(k,names[k]))
# else:
#     print('자료에 <%s>인 이름이 존재하지 않습니다' %k)

# ret1= sorted(names)
# print(ret1)
#
# def f1(x):          def 함수이름 (인수)
#     return x[0]     출력할 결과값
# def f2(x):
#     return x[1]
# #print(names.items()) = [('Mary',10999), ~~ ('Kelly',7855)
# ret2=sorted(names.items(),key=f1)  #f1이 출력하는 값은 첫 번쨰 요소이며, names의 키를 기준으로 ASC
# print(ret2)
#
# ret3 = sorted(names.items(), key=f2)  #f2가 출력하는 값은 두 번째 요소이며, names의 값을 기준으로 ASC
# print(ret3)
#
# ret4= sorted(names.items(), key=f2,reverse=True)
# print(ret4)


