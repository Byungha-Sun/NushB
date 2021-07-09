#1
# no1= int(input('숫자를 입력하세요 : '))
# if no1%3==0:
#     print(no1**2)
# else:
#     print(0)

#2
# fruits = input('사과,감, 귤 중에 어떤 과일을 좋아하세요?: ')
# if fruits == '사과':
#     print('Good~')
# elif fruits == '감':
#     print('Very Good')
# elif fruits =='귤':
#     print('So so...')
# else:
#     print ('사과나 감, 귤 중에서 하나를 입력하세요~')
#

#3
# fruits = input('사과,감, 귤, 복숭아 중에 어떤 과일을 좋아하세요?: ')
# if fruits == '사과' or fruits=='감':
#     print('Very Good~')
# elif fruits =='귤'or fruits=='복숭아':
#     print('Good')
# else:
#     print ('사과나 감, 귤, 복숭아 중에서 하나를 입력하세요~')


#4
# menu = {'짜장면':5000, '짬뽕' : 6000, '군만두' : 8000, '탕수육' : 10000}
# print(list(menu))
# number=int(input('위 메뉴 중 주문할 메뉴의 번호를 쓰세요 : '))
# cnt=int(input('위 메뉴의 주문 수량을 쓰세요 : '))
#
# print('주문하신 메뉴는 {0}이고 주문수량은 {1}이며 주문금액은 {2}입니다.'.format(menu.get(number),cnt,)  )

#4
# menu=int(input('''1.짜장면 - 5,000원          2.짬뽕 - 6,000원
#                   3.군만두 - 8,000원          4.탕수육 - 10,000원
#                   1. 위 메뉴 중 주문할 메뉴의 번호를 쓰세요: '''))


#================================================================
#
# for i in reversed(range(5)):
#     print('python!', i)
#

# 1~10 합은?

# sum=0
# for i in range(11):
#     sum+=i
# print('1~10까지의 합은 %d'%sum)
#
# ##Q2 500~1000 사이의 홀수의 합은 얼마?
#
# sum=0
# for i in range(501,1001,2):
#     sum+=i
# print('500~1000 사이의 홀수의 합은 %s '%sum)

# str1='life is too short, you need python'
# tot_char = 0
# for chr in str1:
#     tot_char=tot_char+1
# print('전체글자수는', tot_char)

# list1=['one','two','three']
# for i in list1:
#     print(i,end=' ')

# list2=[(1,2),(3,4),(5,6)]
#
# for (i,j) in list2:
#     print(i+j)              ##dictionary 할때 유용!

#Q) 6명의 학생이 시험을 보고 점수가 나왔다. 60점 이상이면 합격, 아니면 불합격
#결과는 6명 모두 출력한다. 단,합격과 불합격을 명시한다.

# jumsu=[76,23,88,34,90,56]
# num1=0; cnt1=0; cnt2=0
# for i in jumsu:
#     num1 += 1
#     if i >=60:
#         print('%d번 학생은 합격!' %num1)
#         cnt1+=1
#     else:
#         print('%d번 학생은 불합격!' %num1)
#         cnt2+=1
# print('합격자는 %s 명, 불합격자는 %s 명' %(cnt1,cnt2))
#
# ##합격자에게만 축하합니다~ 메시지를 출력하시오.
# jumsu=[76,23,88,34,90,56]
# num1=0
# for i in jumsu:
#     num1+=1
#     if i <60: continue
#     print('%d번 학생, 축하합니다' %num1)

#Q1)
# num1=0
# for i in range(1,101,1):
#     num1=num1+1/(i)
# print(num1)

#Q2)
# num1=0 ; num2=0
# for i in range(1,101,1):
#     if i%2==1:
#         num1+=1/i
#     else:
#         num2-=1/i
# print(num1+num2)

#03) ##내답
# num1=0;num2=0
# for i in range(1,101,1):
#     num1+=i
#     num2+=num1
# print(num2)

#03) 정답
# v_sum=0
# v_tot=0
# for i in range(1,101):
#     v_sum = v_sum + i
#     v_tot= v_tot + v_sum
# print(v_tot)
#
# #04) 정답
# v_sum=1
# v_tot=0
# for i in range(1,101):
#     v_sum = v_sum * i
#     v_tot= v_tot + v_sum
# print(v_tot)


  #========================구구단




# i=0; dan2=0
# dan2 = int(input('단을 입력하세요 : '))
# for i in range(1,10,1):
#     print('%d X %d = %2d' %(dan2, i , dan2 * i))

# k = 0
#
# for k in range(1,10,1):
#     for i in range(2,10,1):
#         print('%d X %d = %2d' %(i,k,i*k),end='       ')
#     print('')


#############         구구단 함수            #############

# def gugu(n):
#     print('---[' + str(n) +   '단]---')
#     for y in range(1,10):
#         print(n,'X',y, '=', int(n)*y)
#     print('-----------------')
# gugu(5)


#####       평균 구하기          #########
# A = [70,60,55,75,95,90,80,80,85,100]
# num=0
# for i in A:
#     num+=i
# print(num/len(A))

#######         혈액형 별 카운트           #######

# blood_type = ['A', 'B','A', 'O', 'AB','AB', 'O','A','B','O','B','AB','O','A']
# result={}
# for type in blood_type:
#     if type in result:
#         result[type] +=1
#     else:
#         result[type] = 1
# print(result)

######### 1~100 합   단,3의 배수 제외          ##############

# num1=0
# for i in range(1,101,1):
#     if i%3 ==0:
#         continue
#     num1=num1+i
# print(num1)


#######     While 반복문으로 1~10까지 합        ###############

# i,hap=0,0
#
# i=1
# while i<11:
#     hap +=i
#     i+=1
# print(hap)

########## 3이 아닐때 계속 돌아라
# import random
# i=0
# while i !=3:
#     i=random.randint(0,9)
#     print(i)

### 열 번 찍어 안넘어가는 나무 없다

# i=0
# while i<10:
#     i+=1
#     print('안넘어감')
# print('넘어감')
#
# treeHit=0
# while treeHit <10:
#     treeHit = treeHit+1
#     print('나무를 %d번 찍었습니다.'%treeHit)
#     if treeHit == 10:
#         print('나무 넘어갑니다.')
#
# ############## 커피 자판기 프로그래밍         ###############

# coffee=10
# money = (int(input('돈 입력 : ')))
# while True:
#     if money==300:
#         print('돈을 받았으니 커피를 줍니다.')
#         coffee -=1
#         print('남은 커피의 양은 %s개 입니다. (잔돈없음)' %coffee)
#     elif money>300:
#         print('돈을 받았으니 커피를 줍니다.')
#         coffee -= 1
#         print('남은 커피의 양은 %s개 입니다. 잔돈 :%s ' % (coffee,money-300))
#     else :
#         print('금액부족, 잔돈 : %s'%money)
#     if not coffee:
#         print('Coffee Out! 판매를 중지합니다')
#         break