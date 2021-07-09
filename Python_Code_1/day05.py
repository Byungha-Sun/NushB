# food={'떡볶이':'오뎅', '짜장면':'단무지', '라면':'김치','피자':'피클','맥주':'땅콩','치킨':'치킨무','삼겹살':'상추'}
# while True:
#     select = input((str(list(food.keys())) + '좋아하는 음식은?'))
#     if select in food:
#         print('<%s> 궁합 음식은  %s  입니다' %(select, food.get(select)))
#     elif select == '끝':
#         break
#     else:
#         print('음식을 다시 입력하세요')
#
######## ======================UP&Down=================################
# 임의의 숫자(random.randrange(1,101,1)를 생성.
#while loop > input() > if 조건 처리

# import random
# number=random.randrange(1,101)
# while True:
#     sel=int(input('숫자를 입력하세요: '))
#     if sel>number:
#         print('DOWN')
#     elif sel<number:
#         print('UP')
#     else:
#         print('빙고!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!')
#         break

# import random
# rn=random.randrange(1,101)
# num=0
# t_cnt=0
# print('Input 1~100 : Up & Down Game Start!')
# print('-----------------------------')
# while( rn!=num):
#     num=int(input('Input 1~100 : '))
#
#     if (num>rn):
#         print("Down")
#     elif (num<rn):
#         print('Up')
#
#     t_cnt+=1
# print('------------------------')
# print(t_cnt,'번 만에 정답을 맞추셨습니다!')


# num=0
# cnt=0
#
# for i in range(1,100):
#     num+=i
#     cnt+=1
#     if num<1000:
#         continue
#     elif num>=1000:
#         break
# print(num,cnt)


########+++++++++++++++++++++++++++++++++++++++++++++++++#######################


# select, answer,numstr,num1,num2 = 0,0,'',0,0
#
# select =int(input('1.입력한 수식 계산 2. 두 수 사이의 합계 : '))
#
# if select == 1:
#     numstr=input('수식을 입력하세요  : ')
#     answer=eval(numstr)
#     print('%s의 결과는 %s입니다' %(numstr,answer))
# elif select == 2:
#     num1=int(input('숫자를 입력하세요: '))
#     num2=int(input('숫자를 입력하세요: '))
#     num3=0
#     for i in range(num1,num2 + 1,1):
#         num3+=i
#     print('두 수 사이의 합계',num3)
# else:
#     print('1번과 2번 중 고르세요')








# num1=int(input('숫자를 입력하세요: '))
# num2=int(input('숫자를 입력하세요: '))
# num3=0
# for i in range(num1,num2 + 1,1):
#     num3+=i
# print('두 수 사이의 합계',num3)




##########연습문제#######################33

# menu=int(input('''1.짜장면 - 5,000원             2.짬뽕 - 6,000원
#                   3.군만두 - 8,000원             4.탕수육 - 10,000원''')
#
# sel=int(input('위 메뉴 중 주문할 메뉴의 번호를 쓰세요 : '))
# cnt=int(input('위 메뉴의 주문 수량을 쓰세요 : '))
#
# if sel==1:


# reorder=0
# answer= 'Y'
# while answer.upper()=='Y':
#     menu = int(input('''1.짜장면 - 5,000원             2.짬뽕 - 6,000원
#                       3.군만두 - 8,000원             4.탕수육 - 10,000원
#
#                       1. 위 메뉴 중 주문할 메뉴의 번호를 쓰세요:    '''))
#
#     cnt = int(input('위 메뉴의 주문 수량을 쓰세요 : '))
#     print('\n')
#
#     if menu==1:
#         print('주문하신 메뉴는 짜장이고 주문 수량은 %s 그릇이며 주문금액은 %s입니다' %(cnt,5000*cnt))
#     elif menu==2:
#         print('주문하신 메뉴는 짬뽕이고 주문 수량은 %s 그릇이며 주문금액은 %s입니다' % (cnt, 6000 * cnt))
#     elif menu==3:
#         print('주문하신 메뉴는 군만두이고 주문 수량은 %s 그릇이며 주문금액은 %s입니다' % (cnt, 8000 * cnt))
#     elif menu==4:
#         print('주문하신 메뉴는 짜장이고 주문 수량은 %s 그릇이며 주문금액은 %s입니다' % (cnt, 10000 * cnt))
#     else:
#         print(' 메뉴선택을 잘못하셨습니다')
#     print('\n')
#
#     reorder +=1
#     if reorder <4:
#         answer = input('3. 추가 주문을 하시겠습니까?(Y/N) : ')
#         print('%s 번째 추가 주문입니다.' %reorder)
#     else:
#         print(' 추가 주문은 총 3회 까지만입니다')
#         break





#########3               스벅 영수증 만들기 ########################3



#
# from datetime import datetime
# now=datetime.now()
#
# menu={'아메리카노':3000,'카페라떼':4000,'화이트모카라떼':4500,'자바칩프라푸치노':5000,'스무디':5500,'종료':''}
# menu_list=list(menu)
# show_menu='''   1. 아메리카노 : 3000원
#    2. 카페라떼  : 4000원
#    3. 화이트모카라떼 : 4500원
#    4. 자바칩프라푸치노 : 5000원
#    5. 스무디  : 5500원
#    6. 종료 '''
# print(show_menu)
# print(menu_list)
# order_num=0
# cnt=0
# sum=0
# while True:
#     order_num=int(input('주문메뉴 번호를 입력하세요 : '))-1
#     if order_num<5:
#         cnt=int(input('주문 수량을 입력하세요: '))
#         print('{0}를 {1}잔 시켰습니다.'.format(menu_list[order_num],cnt))
#         sum +=menu.get(menu_list[order_num])*cnt
#     else:
#         break
#
#
# print('=====================================================================')
# print('[STARBUCKS]')
# print('결제금액(부가세포함) = %s 원' %sum)
# print('=====================================================================')
# print('주문 종료. 주문 일시 = %s' %now)



# menu='''  1. 아메리카노 : 3000원
#   2. 카페라떼  : 4000원
#   3. 화이트모카라떼 : 4500원
#   4. 자바칩프라푸치노 : 5000원
#   5. 스무디  : 5500원
#   6. 종료 '''
# print(menu)
#
# while True:
#     coffee = int(input('주문메뉴 번호를 입력하세요 : '))
#     if(coffee <= 5):
#
#         cnt = int(input('주문 수량을 입력하세요 : '))
#         if coffee ==1:
#             sum+=3000
#             sum=sum*cnt
#             tot.append(sum)
#             sum=0
#             print('아메리카노 %s잔 주문됨!' %cnt)
#
#         elif coffee ==2:
#             sum += 4000
#             sum = sum * cnt
#             tot.append(sum)
#             sum = 0
#             print('카페라떼 %s잔 주문됨!' %cnt)
#
#         elif coffee== 3:
#             sum += 4500
#             sum = sum * cnt
#             tot.append(sum)
#             sum = 0
#             print('화이트 모카라떼 %s잔 주문됨!' % cnt)
#
#
#         elif coffee== 4:
#             sum += 5000
#             sum = sum * cnt
#             tot.append(sum)
#             sum = 0
#             print('자바칩 프라푸치노 %s잔 주문됨!' % cnt)
#
#
#         elif coffee== 5:
#             sum += 5500
#             sum = sum * cnt
#             tot.append(sum)
#             sum = 0
#             print('스무디 %s잔 주문됨!' % cnt)
#     elif coffee==6:
#         break
#     else:
#         print('다시 입력해주세요')
# for i in tot:
#     final += i
#
# num_final = format(final,',')
# print('='* 50 + '\n')
# print('[STARBUCKS]\n')
# print('결제금액(부가세포함) %s원 \n' %num_final)
# print('= * 50' + '\n')
# print('주문 종료, 주문 일시 : %s \n God Bless You.~' %now)




#############           딕셔너리 로 풀기!             #################



# def p(x,y):
#     result=print('%s 와 %s 를 곲한 값은 %s 입니다' %(x,y,x*y))
#     return result
# p(5,6)

# def add(a,b):
#     result =0
#     result=a+b
#     return result
#
# import random
# num1= random.randint(1,100)
# num2= random.randint(1,100)
#
# print('{} + {} = {}'.format(num1,num2,num1+num2))

# def cal(v1,v2,op):
#     result=0
#     if op=='+':
#         result=v1+v2
#     elif op=='-':
#         result=v1-v2
#     elif op=='*':
#         result=v1*v2
#     elif op=='/':
#         result = v1/v2
#     return result
# res=0
# var1,var2,oper=0,0,''
#
# oper=input("'+','-','*','/' 중에 선택하세요 : ")
# var1=int(input('숫자를 입력하세요 : '))
# var2=int(input('숫자를 입력하세요 : '))
# res=cal(var1,var2,oper)
#
# print('##계산기 : %s %s %s = %s' %(var1,oper,var2,res))

#### --------------------------------------------------####

# def calc2(op,fnum,snum):
#     print('=' * 30)
#     print('1.PLUS\n2.MINUS\n3.MULTIPLIED\n4.DIVISION\n5.REMAINDER')
#     print('='*30)
#
#     while True:
#         menu=int(op)
#         if(menu<=5):
#             numA=int(fnum)
#             numB=int(snum)
#             if (menu==1):
#                 print('결과는 %s 입니다.' %(numA+numB))
#                 break
#


#########           로또 번호 생성기 요구사항       #################

# from random import shuffle
# from time import sleep
# num=int(input('몇 회 게임 ? : '))
# for i in range(num):
#     balls= [x+1 for x in range(45)]
#     ret=[]
#
#     for j in range(6):
#         shuffle(balls)
#         number=balls.pop()
#         ret.append(number)
#         ret.sort()
#     print('로또번호 [%s]: ' %(i+1),end='')
#     print(ret)
#     sleep(0.8)



# def lotto(num):
#     from random import shuffle
#     from time import sleep
#
#     for i in range(num):
#         balls=[x+1 for x in range(45)]
#         ret=[]
#
#         for j in range(6):
#             shuffle(balls)
#             number = balls.pop()
#             ret.append(number)
#             ret.sort()
#         print('로또번호 [%s]: ' % (i + 1), end='')
#         print(ret)
#         sleep(0.8)
#
# lotto(5)
##



######                 연습문제             ###############


#1
# def il(num1,num2):
#
#     result=0
#     if num1>num2:
#         result=num1-num2
#         print(result)
#     elif num2>=num1:
#         result=num2-num1
#
#     return print(result)
#
#
# il(10,20)
#
#
#
# #2
# def ebun(*x):
#     result=max(x)
#     return print(result)
# ebun(2,5,2,5,3,5,7,4,5)
#
#
# #3
#
# def sambun(*x):
#     result=sum(x)
#     return print(result)
#
# sambun(1,2,3,4,5,6,7,8,9,10)
#
#
# #4
#
# def sabun(*x):
#     result=max(x)-min(x)
#     return print(result)
#
# def maxmin(*args):
#     max=0
#     for i in args:
#         if i >max:
#             max= i
#     min=999
#     for i in args:
#         if i <min:
#             min = i
#
#     return print(max-min)
#
# maxmin(1,42,52)
#
# sabun(1,2,3,4,5,6,7,8,9)
#
# import inspect
# print(inspect.getsource(sabun))

# def say_myself(name,old,gender=True):
#     print('나의 이름은 %s입니다' %name)
#     print('나이는 %s살 입니다' %old)
#     if gender:
#         print('남자입니다')
#     else:
#         print('여자입니다')
#
#
# say_myself('선병하',25)


#여러 개의 입력값을 가지는 함수 생성

# def print_kwargs(**kwargs):
#     print(kwargs)
#
# print_kwargs(a=1)
# {'a':1}
# print_kwargs



# ###################################         암스트롱 문제             #####################################
#
#
# for i in range(100,1000,1):
#     num1= i//100
#     num2=(i%100)//10
#     num3=(i%100)%10
#
#     result=(num1**3)+(num2**3)+(num3**3)
#
#     if i==result:
#         print(i)
#
#
# sel=int(input('~단 까지의 합 : '))
# for i in range(1,sel+1,1)
# #
#
#
# ################################          4번          ################################3
#
# num1,num2,num3,num4 = 0,0,0,0
# num=int(input('값을 입력하세요 : '))
# for i in range(1,num+1,1):
#
#     num1=i**2
#     num2+=num1
#
#     num3+=i
#
# num4=num3**2
# print(num4-num2)
#
#
#   ########################33
# num1=0
# num2=0
#
# sel=int(input('~단 까지의 합 : '))
# for i in range(1,sel+1,1):
#     for j in range(1,10,1):
#         if i!=j:
#             num1+=(i*j)
#         else:
#             continue
#
# print(num1)
#
