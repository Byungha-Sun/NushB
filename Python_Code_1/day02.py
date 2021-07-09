# print("Hello python")
#
# str1='hello python'
# print(type(str1))
# print(str1)
# str1="hello python"
# print(type(str1))
# print(str1)
#
# str1= 'hello python'
# print(type(str1))
# print(str1)

# today1="7월21일"
# print(type(today1))
# print("오늘은 %s 입니다." %today1)
#
# today1='7월 21일'
# print(type(today1))
# print('오늘은 %s 입니다.' %today1)

# month1=7
# day1=21
# print(type(month1), type(day(1))
# print("오늘은 %d월 %d일 입니다." %(month1, day1))

# month1=7
# day1=21
# print(type(month1), type(day1))
# print('오늘은 %s월 %s일 입니다.' %(month1,day1))
# month2 = "7월"
# day2 = 21
# print(type(month2), type(day2))
# print("오늘은 %s %d일 입니다." %(month2, day2))


# up=20
# print('뉴스에서 물가가 %s %까지 오른다는데...' %up)

# up=20
# print('뉴스에서 물가가 %s 까지 오른다는데...' %up)


# up=20
# print('뉴스에서 물가가 %s %%까지 오른다는데...' %up)

# print('뉴스에서 물가가 %s %%까지 오른다는데' %up)

# up=20
# sal =10
# print ('뉴스에서 물가는 %s %%오른다는데 내 월급도 %s %%라도..' %(up,sal))

# sal=20
# print('뉴스에서 %s %% 오른다는데 내 월급도 %s %% ' %(up,sal))

# print(1,2,3, sep=' ')
# print(4,5,6, sep='')
# print('Hello', 'Python', sep=' ')
# print(1920, 1080, sep='x')

# print(1,2,3, sep=' ')
# print(4,5,6, sep='')
# print('hello', 'python', sep=' ')
# print(1,2,3, sep='\n')
# print(1,2,3, sep='\t')
#
# print('선병하','이한결','김준희', sep= ' ')
# print (1,2,3, sep='\n')
# print(1,2,3, sep='\t')
# print(1,end='')
# print(2,end='')
# print(3)
#
# print(1,end='')

# print(1,end='&')
# print(2,end='&')
# print(3)
#

# print(1,2, end='&')

# print(1,end='----')
# print(2,end='--')
# print(3)

# print("%d" %(123))
# print("%5d" %(123))
# print("%05d"%(123))
#

# print('%s' %(123))
# print('%5s' %(123))
# print('%05d' %123)


# print("%f" %123.24)
# print('%7.1f'%123.24)
# print('%7.3f' %123.27)
#
# print('%f' %123.12)
# print('%d' %(123))


# print('%s' %'python')
# print('%10s' %'python')

# print('%10s' %'python')


# print('%d %5d %05d' %(123,123,123))
# print("{0:d} {1:5d} {2:05d}".format( 123,123,123)) #자동으로 index (순서) 지정
# print("{1:d} {0:5d} {2:05d}".format( 100,200,300))
# print('국어={2:d} 수학= {0:5d} 영어 ={1:05d}'.format(100,5002,300))

# print('%d %5d %05d' %(123,123,123))
# print('{0:d} {1:5d} {2:05d}'.format(123,345,7345))
# print('{1:d},{0:5d}, {2:05d}'.format(523,251,62155))
# print('국어={3:d}, 수학={2:d}, 영어={1:d}, 사탐={0:d}'.format(5125,5242,73,3463))


# print('\n줄 바꿈 \n연습')
# print('\t탭 키 \t연습')
# print('글자가 \"강조\" 되는 효과')
# print('글자가 \'강조\' 되는 효과')
# print('\\\\\ 역슬래시 세 개 출력')
# print(r'\n \t \' \\를 그대로 출력')
#

# print('줄 \n바꿈 \n연습')
# print('탭 \n키 \n연습')
# print('글자가 "강조" 되는')
# print('\\\\\ 3개 출력')
# print('\t탭키 \t practice')
# print(r'\n \n \' \\를 그대로 출력')
# print('\n줄 바꿈 \n연습')
# print('\t탭키 \t practice')

# print('하하하')
# print(100+200)

# a=123
# type(a)
# print(type(a))
#
# a=100**100
# print(a)
# print(type(a))
#
# a=0xFF
# b=0o77
# c=0b1111
# print(a,b,c)
# print(type(b))
#
# a=3.14
# b=3.14e5
# print(a,b)
'''
no1=3.45436
no2=3.69345346
print('원래값 : %s, 반올림후 값 : %s' %(no1, round(no1)))
print('원래값 : %s, 반올림후 값 : %s' %(no2, round(no2)))

print('반올림전 원래값 : %s' %(no1/no2))
print('소수첫째자리 까지 반올림하기 : ', round(no1/no2,1))
print('소수둘째 : ' ,round(no1/no2,2))


import math
print('버림하기전 원래값: ', no2/no1)
print('소수 첫째자리까지 버림하기: ', math.trunc(no2/no1))

cnt=int(input('총 몇 건의 데이터를 수집할까요 :'))
page_cnt = math.ceil(cnt/15)
print ('총 %s 페이지까지 데이터를 수집해야합니다' %page_cnt)
'''
# import math
# test=int(input('총 몇건의 데이터를 수집할까요? :'))
# page_test = math.ceil(test/15)
# print('총 %s 페이지까지 데이터를 수집해야합니다' %page_test)


# no1=5.2123
# no2=2.315
# print('원래값 : %s, 반올림후 값 : %s' %(no1,round(no1)))
# print('df : %s, 반올림 후 값 : %s' %(no2,round(no2)))

# import math
# print('%s보다 작으면서 가장 가까운 정수는 %s 입니다' %(no1, math.floor(no1)))
# print('%s보다 작으면서 가장 가까운 정수는 %s 입니다' %(no2, math.floor(no2)))

'''
say= '"Python is very easy." he says.'
print(say)

food= 'Python\'s favorite food is perl'
print (food)


say = "\" Python is very easy.\" he says."
print (say)

type(say)
print(type(say))
'''
# print("python\'s favorite food is perl")
# food= 'python\'s favorite food is perl'
# print(food)
# print('python\'s favorite food is perl')
#
# print('python' + ' is fun!')

# head ='python'
# tail = ' is fun!'
# print(head + tail)
#
# a= '-'
# print (a*50)

# a= '='
# print(a*50)

# a= 'Life is too short, You need Python'
# print(a[3])
# b=a[0] +a[1] + a[2] + a[3]
# print(b)
# a= 'Life is too short, You need Python'
#
# print(a[3])
#
# print(a[12])
#
# print(a[21])
# print(a[-1])
#
# b=a[0] + a[1] + a[2] + a[3]
# print(b)
#
# print(a[0:4])
# print(a[0:3])
# print(a[:])
#
# print(a[19:])
# print(a[:17])
#
# b=a[0] + a[1] + a[2] +a[3]
# #
# a= 'life is too short \n you won\'t need python'
# print(a)

# a= '20200721Clear'
# year = a[0:4]
# day = a[4:8]
# weather = a[8:]
#

# a= '20200721Weather'
# year = a[:4]
# day=a[4:8]
# weather = a[8:]
#
# print(year)
# print(day)
# print(weather)
# print(year)
# print(day)
# print(weather)
#
#
# a= 'Pithon'
# print (a[1])
# b=a[:1] + 'y' + a[2:]
# print(b)
#


# c='Sunbyungha'
# lastname = c[:3]
# firstname= c[3:]
# print(lastname)
# print(firstname)
# print(lastname , firstname)

# jumin = '810123-1138539'
# print(type(jumin))
# yyyymmdd = jumin[:6]
# num = jumin[7:]
# print(yyyymmdd)
# print(num)

# jumin = '760314-1234567'
# print(type(jumin))
# yyyyymmdd=jumin[:6]
# num = jumin[7:]
# print(yyyyymmdd)
# print(num)


# print('I eat {0} apples'.format(3))
#
# print('i eat {0} apples'.format(3))
# print('I eat {0} apples'.format('five'))
#
# print('I ate {0} apples'.format('five'))
# number =3
# print ('I eat {0} apples'.format(number))
# #
# number=6
# print('I ate {0} apples.'.format(number))

# number=10
# day= 'three'
# print ('I ate {0} apples. so I was sick for {1} days.'.format(number,day))
#
# number=10
# day = 'three'
# print('I ate {0} apples. so I was sick for {1} days.'.format(number,day))


# print('I ate {number} apples. so I was sick for {day} days.'.format(number=10,day=5))
#
# print('I ate {number} apples, so I was sick for {day} days.'.format(number=10,day=7))
# print('I ate {number} apples, so I was sick for {day} days.'. format(number=10,day=3))

# print('{0:<10}'.format('hi'))
# print('{0:>10}'.format('hi'))
# print('{0:^10}'.format('hi'))
# print('{0:-^10}'.format('hi'))
# print(f'{"hi":=^10}')
# print(f'{"hi":^10}')
# print(f'{"hi":<10}')

# print('{0:<10}'.format('hi'))
# print('{0:>10}'.format('hi'))
# print('{0:-^10}'.format('hi'))


# str2='PytHOn'
# print(str2.lower())
# print(str2.upper())
# str3='    <-이쪽 끝에 공백 있었어요'
# str4='오른쪽 끝에 공백 있었어요     '
# str5='   qwqwre    '
# print(str3.lstrip())
# print(str4.rstrip())
# print(str5.strip())
#
# str6 = '새우깡도 해산물 인가요?'
# print(str6.replace('새우깡','새우'))
#
# str6= '새우깡도 해산물인가요?'
# print(str6.replace('새우깡','새우'))

# tel = '02-1243-5678'
# print(tel.split('-'))
# print(tel.split('-',1))

# tel = '010-2090-5284'
# print(tel.split('-'))
# print(tel.split('-',1))
# a= 'LGOoeneuOeood'
# print(a.count('o'))
# print(a.find('n'))
# print(a.find('z'))
# print(a.index('n'))
#
# a=','
# print(a.join('CJ'))
# print(",".join('networks'))
#
# a=','
# print(a.join('CJ'))
# print(",".join('networks'))
# a= 'Life is too short'
# print(a.split())
# print(a.split(':'))
#
# b='woerjadffe'
# print(b.split())
#
# a='        hi     '
# print(a.rstrip())
# print(a.lstrip())
# print(a.strip())
#
# '''cafe menu'''
# 아메리카노=2500
# 밀크티=5500
# 카푸치노=4000
# 카페라떼=3000
# 스무디=5000
#
# #밀크티 2잔, 카푸치노 3잔 주문 할게요
#
# tot_price=(밀크티 *2 + 카푸치노 *3)
# print('Total price= ')
# tot_price=(밀크티 *2 + 카푸치노*3 )
# print('Total Price= '+ str(tot_price) + '원 입니다.')

# tot_price=(밀크티*2 + 카푸치노*3)
# print(type(tot_price))
# print('Total PRice=' + str(tot_price) + '원 입니다')
# print('total price= %d원 입니다' %tot_price)
# print('total price= {}원 입니다'.format(tot_price))
#
# print('total price = %d원 입니다.' %tot_price)
# print('total price = {}원 입니다'.format(tot_price))

# a=[]  #변수 a는 list type 이다. index 사용 가능, for loop(반복문에 활용)
# print(type(a))


# b=[1,2,3]
# c=['Life','is','too','short']
# d=[1,2,'Life','is']
# e=[1,2,['Life','is']]
# a=[1,2,['a','b',['Life','is']]]
#
# print(a[2][2][0])
# print(a[1])
# print(a[2][2][1])

# solarsys = ['태양','수성','금성','지구','화성','목성','토성','천왕성','해왕성','지구']
# planet = '지구'
# pos= solarsys.index(planet)
# print('%s은(는) 태양계에서 %s번째에 위치하고 있습니다.' %(planet,pos))
# pos=solarsys.index(planet,5)
# print('%s은(는) 태양계에서 %s번째에 위치하고 있습니다.' %(planet,pos))
#
# solarsys=['태양','수성','금성','지구','화성','목성','토성','천왕성','해왕성','지구']
# planet= '지구'
# pos=solarsys.index(planet)
# print('%s는 태양계에서 %s 째에 위치해 있습니다.' %(planet,pos))

# days=['월','화','수','목','금','토','일','월','화']
# today= '화'
# pos=days.index(today)
# print('%s는 %s번째 요일입니다' %(today,pos))
# pos=days.index(today,5)
# print('%s는 %s번쨰 요일입니다'%(today,pos))

# solarsys = ['태양','수성','금성','지구','화성','목성','토성','천왕성','해왕성','지구']
# rock_planets = solarsys[1:4]
# gas_planets = solarsys[4:]
# print('태양계의 암석형 행성:', end='');print(rock_planets)
# print('태양계의 가스형 행성:', end='');print(gas_planets)
# #
# solarsys = ['태양','수성','금성','지구','화성','목성','토성','천왕성','해왕성','지구']
# rockplanets= solarsys[1:4]
# gasplanets= solarsys[4:9]
# print('암석형 행성:', end='');print(rockplanets)
# print('가스형 행성:', end='');print(gasplanets)

# days=['월','화','수','목','금','토','일','월','화']
# 공휴일 = days[5:7]
# print('쉬는날:', end='');print(공휴일)
# print('쉰는날:');print(공휴일)
#
# list1=[1,2,3,4,5]
#
#
#
# list2=[6,7,8,9,10]
# print(list1+list2)
# print(list1*3)
#
# list1[0]='python'
# print(list1)
# print(str(list1[3]) + 'python')
#
# list3=[2,3,4,5,6,7]
# list3[0]='python'
# print(str(list3[3])+'python')

# list1[0:2]=[] #삭제
# del list1[0]
# print(list1)

# a=[1,2,3]
# a.insert(0,4) #0번째 위치에 4 추가
# print(a)
#
# a=[1,2,3]
# a.insert(0,4)
# print(a)
# a.insert(3,4)
# print(a)
# a.insert(3,5) #3번째 위치에 5추가
# print(a)
#
# a=[1,2,3,1,2,3] #remove > 특정 수
# a.remove(3)
# print(a)
#
a=[1,2,3,4,5,6,7,8]
a.remove(6)
print(a)
# a= [1,2,3,1,3,4,6,7]
# print(a.count(1))
#
# del a[4] #del > 위치값 삭제
# print(a)

# a=[1,2,3] #마지막 요소 출력 후 삭제
# print(a.pop())
#
# print(a.pop(1)) #위치값 출력 후 삭제
# print(a)

# a= [1,2,3]
# a.extend([4,5]) #리스트확장
# print(a)
#
# b=[6,7]
# a.extend(b)
# print(a)

# list2=['1','2','3']
# list2.append('append로 추가한것')
# list2.insert(2,'insert로 추가한것') #위치값에 추가
# print(list2)

# listdata=list(range(1,21))
# print(listdata)
# evenlist=listdata[1::2]
# print(evenlist)
# oddlist=listdata[0::2]
# print(oddlist)
#
# listdata=list(range(21));print(listdata)


# solarsys = ['태양','수성','금성','지구','화성','목성','토성','천왕성','해왕성']
# planet = '화성'
# pos= solarsys.index(planet)
# solarsys[pos]= 'Mars'
# print(solarsys)
#
# listdata=list(range(1,21))
# evenlist=listdata[-1::-2]
# print(evenlist)

# listdata = list(range(5))
# ret1=reversed(listdata)
# print('원본',end='');print(listdata)
# print('역순',end='');print(list(ret1))
#
# ret2=listdata[::-1]
# print(ret2)

# solarsys = ['태양','수성','금성','지구','화성','목성','토성','천왕성','해왕성']
# ret=list(enumerate(solarsys))
# print(ret)
#
# for i, body in enumerate(solarsys):
#     print('태양계의 %d번째 천체 : %s' %(i,body))

# original = ['홍길동','일지매']
# print("현재 이 과목의 수강 신청자는 %s 입니다." %original)
# print('\n')
# kk = input('목록에 추가할 첫번째 학생의 이름을 입력하세요: ')
# original.append(kk)
# print('%s 학생의 신청이 완료되었습니다.' %kk)
# print('\n')
# kkk = input('목록에 추가할 첫번째 학생의 이름을 입력하세요: ')
# original.append(kkk)
# print('%s 학생의 신청이 완료되었습니다.' %kkk )
# print('\n')
# print("현재 이 과목의 최종 수강 신청자는 %s입니다" %original)
#
origin = ['홍길동','일지매']
print("현재 이 과목의 수강 신청자는 %s 입니다."%origin)
print('\n')
s1= input('목록에 추가할 첫 번째 학생의 이름을 입력하세요 : ')
origin.append(s1)
print('%s학생의 신청이 완료되었습니다.' %s1)
print('\n')
s2= input('목록에 추가할 첫 번째 학생의 이름을 입력하세요 : ')
origin.append(s2)
print('%s 학생의 신청이 완료되었습닌다.' %s2)
print('\n')
print('현재 이 과목의 최종 수강 신청자는 %s입니다.' %origin)

# print('현재 수강 신청자는 %s 입니다' %original)
# print('\n')
# re_original = input('수강 철회하는 학생의 이름을 쓰세요: ')
# original.remove(re_original)
# print('\n')
# print('%s 학생의 수강 신청 철회가 완료되었습니다' %re_original)
# print('\n')
# original.sort()
# print('현재 이 과목의 최종 수강 신청자는 %s입니다' %original)
#
print('현재 수강 신청자는 %s 입니다' %origin)
print('\n')
re_origin = input('수강 신청하는 학생의 이름을 쓰세요: ')
origin.remove(re_origin)
print('\n')
print('%s 학생의 수강 신청 철회가 완료되었습니다' %re_origin)
print('\n')
origin.sort()
print('현재 이 과목의 최종 수강 신청자는 %s입니다' %origin)


# stu2= '홍길동,일지매,유관순'
# print('현재 이 과목의 최종 수강 신청자는 %s 입니다' %stu2)
# print('\n')
# old_name = input('변경 전 이름을 입력하세요: ')
# new_name = input('변경 후 이름을 입력하세요: ')
# stu3= stu2.replace(old_name,new_name)
# print('\n')
# print('요청하신대로 %s 을 %s(으)로 변경하였습니다.'% (old_name,new_name))
# print('현재 이 과목의 최종 수강 신청자는 %s입니다' %stu3)
stu2='홍길동, 일지매, 유관순'
print('현재 이 과목의 최종 수강 신청자는 %s입니다' %stu2)
print('\n')
old_name = input('변경 전 이름을 입력하세요: ')
new_name = input('변경 후 이름을 입력하세요: ')
stu3=stu2.replace(old_name,new_name)
print('\n')
print('요청하신대로 %s 을 %s(으)로 변경하였습니다' %(old_name,new_name))
print('현재 이 과목의 최종 수강 신청자는 %s 입니다' %stu3)

