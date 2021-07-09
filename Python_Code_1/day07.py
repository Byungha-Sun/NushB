# s= '''We propose to start by making it possible to teach programming in Python, an existing scripting language, and to focus on creating a new developlment environment and teaching materials for it.'''


# def split(filename):
#     with open(filename,'r') as f:
#         data=f.read()
#         data=data.lower().split()
#         fa={}
#         for i in data:
#             if i in fa:
#                 fa[i]+=1
#             else:
#                 fa[i]=1
#     return fa

# split(s)
import os

# data = s.lower().split()
# fa = {}
# for i in data:
#     if i in fa:
#         fa[i] += 1
#     else:
#         fa[i] = 1
#
#
# fa=sorted(fa.items(), key=lambda x:x[0],reverse=False)
# list_fa=list(fa)
# print(list_fa)


############################## 특수 문자 제거 후 단어 수 검색#############################################3

# word_list=s.lower().split()
#
# for i in range(0,len(word_list)):
#     tmp=''
#     for j in range(0,len(word_list[i])):
#         if(word_list[i][j].isalpha() == True):
#             tmp+=word_list[i][j]
#
#     word_list[i] = tmp                       ####특수 문자 제거 끝
#
# word_list.sort()
#
# cnt={}
# for w in word_list:
#     if w in cnt:
#         cnt[w] +=1
#     else:
#         cnt[w] = 1
#
# print()
# for i in cnt.keys():
#     print('{} : {}'.format(i,cnt[i]))

# stu_num=1
# for i in range(10):
#
#     score=int(input('점수를 입력하세요 : '))
#
#     if 95<=score<=100:
#         print('%s A+'%stu_num)
#         stu_num+=1
#     elif 90<=score<95:
#         print('%s A0'%stu_num)
#         stu_num += 1
#     elif 85 <= score < 90:
#         print('%s B+'%stu_num)
#         stu_num += 1
#     elif 80 <= score < 85:
#         print('%s B0'%stu_num)
#         stu_num += 1
#     elif 75 <= score < 80:
#         print('%s C+'%stu_num)
#         stu_num += 1
#     elif 70 <= score < 75:
#         print('%s C0'%stu_num)
#         stu_num += 1
#     elif 65 <= score < 70:
#         print('%s D+'%stu_num)
#         stu_num += 1
#     elif 60 <= score < 65:
#         print('%s D0'%stu_num)
#         stu_num += 1
#     elif score<60:
#         print('%s F'%stu_num)
#         stu_num += 1
#     else:
#         print('점수를 잘못 입력하셨습니다')
#         break

# ###
# if score>=60:
#     if score==100 or score%10>=5:
#         grade+='+'
#     else:
#         grade+='0'




##########################################비만도 측정       ##############################################






# import sys, os
# f=open('비만도 측정 결과.txt','w')
# stdout= sys.stdout
# sys.stdout=f
#
# def bmi(height,weight):
#     result = ''
#     hg=int(input('키를 입력하세요(cm) : '))/100
#     wg=int(input('몸무게를 입력하세요(kg) : '))
#
#     bmi=round(wg/(hg**2),1)
#
#
#     if bmi>=40.0:
#         result='고도비만'
#     elif 30<=bmi<40:
#         result='중등도 비만(2도 비만)'
#     elif 25<=bmi<30:
#         result='경도 비만(1도 비만)'
#     elif 23<=bmi<25:
#         result = '과체중'
#     elif 20<=bmi<23:
#         result='정상'
#     else:
#         result = '저체중'
#     return (bmi,result)
#
#
#
# print()
# print(''*20,'[실기 테스트 : 비만도 측정 프로그램]')
# print()
# print('*'*25,'비만도 측정 프로그램','*'*25)
# print()
#
# my_height = int(input('당신의 키(cm)를 입력해 주세요 : '))
# my_weight = int(input('당신의 체중(kg)을 입력해 주세요: '))
# my_bmi,my_result = bmi(float(my_height),float(my_weight))
#
# print('\n체중(kg) : %d\n키(cm) : %d  bmi:%s    비만도 측정 결과 : %s' %((my_weight),(my_height),my_bmi,my_result))
# print()
#
# f.close()
# sys.stdout = stdout
#
# bmi(175,63)



 ####################### 영화 좌석 예매 ---내 답 #################################
# from datetime import datetime
# now=datetime.now()
#
# c_seat = ["☆", "☆", "☆", "☆", "☆", "☆", "☆", "☆"]
# while True:
#     sel = input('좌석을 예약하시겠습니까? 선택["YES(Y)","NO(N)","END(E)"]:  ')
#     sel = sel.upper()
#     tot=0
#     if sel == 'Y':
#
#         print('영화 가격 : 10000원')
#         card =int(input('할인카드가 있으면 1, 없으면 0을 입력하세요: '))
#         num = int(input('예약할 인원 수를 입력하세요 : '))
#         print('현재좌석', c_seat)
#         for i in range(num):
#             seat = int(input('좌석을 선택하세요(1~8) : ' ))
#             if c_seat[seat-1] == '★':
#                 print('이미 선택된 좌석입니다')
#                 seat= int(input('좌석을 선택하세요(1~8) : '))
#                 c_seat[seat - 1] = '★'
#                 print(seat, '번 좌석이 예약됨')
#                 print(c_seat)
#             else:
#                 c_seat[seat-1] = '★'
#                 print(seat,'번 좌석이 예약됨')
#                 print(c_seat)
#         if card==1:
#             tot=10000*num-1000
#             print('총 금액 : %s' %tot)
#         else:
#             tot=10000*num
#             print('총 금액 : %s' %tot)
#         print('예약완료, 예약일시 %s ' % now)
#     elif sel != 'Y':
#         print('예약종료, 예약일시 %s ' % now)
#         break


###########################영화 좌석 예매 선생님 답   ###############################3

#
# from datetime import datetime
# now = datetime.now()
#
# seat = ["☆", "☆", "☆", "☆", "☆", "☆", "☆", "☆", "☆", "☆"]
# number=[]
# total=0
#
# while True:
#     answer = input('좌석을 예약하시겠습니까? 선택["YES(Y)","NO(N)","END(E)"]:  ')
#     if answer.upper() =='YES' or answer.upper() =='Y':
#         i =1
#         print('영화 가격 : 10000원')
#         card = int(input('할인카드 1, 0 : '))
#         person=int(input('사람 수를 입력하세요 : '))
#         while (i <=person):
#             print(i, '번째 좌석을 선택하세요 (1~10)')
#             print('현재좌석 : ',seat)
#             select = int(input())
#             if select >=1 and select<=10:
#                 if seat[select-1]=='★':
#                     print('이미 예약된 좌석')
#                 else:
#                     seat[select-1]='★'
#                     print(select,'빈 좌석이 예약되었습니다')
#                     print('현재좌석',seat,'\n')
#                     number.append(select)
#                     i+=1
#                     if card:
#                         total += 10000*0.9
#                     else:
#                         total += 10000
#             else:
#                 print('1~10번 좌석 중 선택하세요!')
#             print('예약한 좌석', number)
#             print('총 금액:',format(int(total), ','))
#             print('='*50)
#             print('(예약완료, 예약일시 : %s' %now)
#     elif answer.upper() =='NO' or answer.upper() =='N':
#         print('예약을 취소합니다')
#         break
#     else:
#         print('다시 입력하세요!')
#         continue



#####################         숫자 한글로 변환하기  ##########################





# def readNumber(n):
#     n=6785
#     result =[]
#     units = [''] +list('십백천만')
#     nums='일이삼사오육칠팔구'
#     i=0
#     while n > 0:
#         n, r = divmod(n, 10)
#         if r > 0:
#             result.append(nums[r - 1] + units[i])
#         i += 1
#     return ''.join(result[::-1])
#
# num=int(input('숫자입력 : '))
# print(readNumber(num))


import os
# f=open('dream.txt', encoding='utf-8')
# contents = f.readlines()
# print(type(contents))
# print('총 라인수:  ',len(contents))
# f.close()
#
#

# with open('dream.txt','r',encoding ='utf-8') as f:
#     i=0
#     while True:
#         line= f.readline().replace('\n','')
#         if not line:
#             break
#         if line.strip() =='':
#             continue
#         print(str(i)+ '===' + line)
#         i +=1
#

#문자수, 단어수, 라인수
# with open('dream.txt','r',encoding ='utf-8') as f:
#     contents =  f.read()
#     word_list=contents.split(' ')
#     line_list=contents.split('\n')
#
# print('문자수 : ',len(contents))
# print('단어수 : ',len(word_list))
# print('라인수 : ',len(line_list))
#
# import collections
# word_stat=collections.Counter(word_list)
# print(word_stat)
# print(word_stat.most_common(10))

# import csv
# # with open('fruit.csv','w', newline='') as fruit:
# #     writer = csv.writer(fruit, delimiter=',')
# #     writer.writerow(['banana',3500])
# #     writer.writerow(['pineapple', 7000])
# #     writer.writerow(['watermelon', 5000])
# #     writer.writerow(['melon', 8000])
# #     writer.writerow(['pear', 3500])
#
# f=open('fruit.csv','r')
# csvfruit = csv.reader(f)
# fruit=[]
# for i in csvfruit:
#     fruit.append(csvfruit)
#     print(i)
#
# #####################pandas
#
#
# import pandas as pd
# fruit2 = pd.read_csv('fruit.csv')
# print(type(fruit2))
#
# fruit2.to_excel('fruit2.xlsx')


########################## 숫자 야구 게임   ###################################

# import random
#
# while True:
#     number = int(random.randint(100, 999))
#     num1 = number // 100
#     num2 = (number % 100) // 10
#     num3 = number % 10
#     if num1!=num2!=num3:
#         # print(number)
#         break
#     else:
#         continue
#
# while True:
#     guess=input('숫자를 입력하세요 :')
#     if guess == str(number):
#         print('정답입니다')
#         break
#     else:
#         strike = 0
#         ball = 0
#         for i in range(3):
#             if guess[i]== str(number)[i]:
#                 strike +=1
#             elif guess[i] in str(number):
#                 ball +=1
#         print('%s 스트라이크 , %s 볼 '%(strike,ball))



#########################        선생님 답        ###############


# rn=['0','0','0']
# rn[0] = str(random.randrange(1,9,1))
# rn[1] = rn[0]
# rn[2] = rn[0]
# while (rn[0] == rn[1]):
#     rn[1] = str(random.randrange(1,9,1))
# while (rn[0] == rn[2] or rn[1] == rn[2]):
#     rn[2] = str(random.randrange(1,9,1))
#
# print (rn[0],rn[1],rn[2])