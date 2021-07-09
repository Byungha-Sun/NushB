################### IP주소 2진수를 10진법으로 바꾸기     ###################################
###슬라이싱######
####임의로 ip주소 받기  ######


# ip2='11001011100001001110010110000000'
# print(ip2)
#
# ip01=int(ip2[0:8], base=2)
# ip02=int(ip2[8:16], base=2)
# ip03=int(ip2[16:24],base=2)
# ip04=int(ip2[24:],base=2)
#
# ip_address=(str(ip01)+'.'+str(ip02)+'.'+str(ip03)+'.'+str(ip04))
# print('IP주소 : ',ip_address)

# code1=input('암호화 할 코드를 입력하세요 : ')
# result1=''
#
# for i in code1:
#     sen=i.lower()
#     if sen>='x' and sen<='z':
#         sen2=chr(ord(sen)-23)
#     else:
#         sen2=chr(ord(sen)+3)
#     result1+=sen2
#
# print(result1)
#
# code2=result1
# result2=''
# for i in code2:
#     sent=i.upper()
#     if sent>='A' and sent<='C':
#         sent2=chr(ord(sent)+23)
#     else:
#         sent2=chr(ord(sent)-3)
#     result2+=sent2
#
# print(result2)


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
# receipt={}
# order_count=0
# while True:
#     order_num=int(input('주문메뉴 번호를 입력하세요 : '))-1
#     if order_num<5:
#         cnt=int(input('주문 수량을 입력하세요: '))
#         print('{0}를 {1}잔 시켰습니다.'.format(menu_list[order_num],cnt))
#         sum +=menu.get(menu_list[order_num])*cnt
#         receipt[menu_list[order_num]]=cnt
#         order_count+=1
#     else:
#         break
#
# coupon=int(input('쿠폰 금액을 입력하세요 : '))
# import random
# number=random.randrange(10000000000000000,9999999999999999999)
# print('\n\n\n\t\t\t\tSTARBUCKS')
# print('\n\n영등포점','      서울 영등포구 병하로 101')
# print('대표:선병하 209-41-21451 T:02-554-7929')
# print('[POS 01]','       %s'%now)
# print('---------------------------------------------------------------------')
# for key,val in receipt.items():
#     print('%8s           0         %d      0' %(key,val))
#
#
# print('---------------------------------------------------------------------')
# print('Subtotal\t\t\t\t->\t\t\t  %s'%sum)
# print('Coupon\t\t\t[-]\t\t->\t\t\t  %s'%coupon)
# print('Net Amount \t\t\t\t->\t\t\t  %s'%(sum-coupon))
# print('Tax \t\t\t[+]\t\t->\t\t\t 0')
# print('---------------------------------------------------------------------')
# print('Total\t\t\t\t\t%s'%(sum-coupon))
# print('---------------------------------------------------------------------')
# print('Cash\t\t\t\t\t0')
# print('---------------------------------------------------------------------')
# print('Partner Name:\t\t\t[0234]선병하')
# print('  결제수단 변경은 구입하신 매장에서\n전체취소/재결제로 14일 이내 가능합니다.\n(변경 가능 기간) : ~%s'%now)
# print('www.istarbucks.co.kr')
# print(number)
# print('본 영수증은 친환경 용지로 제작되었습니다')
# print('---------------------------------------------------------------------')
# print('Order Number A-%s'%order_count)
# print('=====================================================================')
# print('[STARBUCKS]')
# print('결제금액(부가세포함) = %s 원' %sum)
# print('=====================================================================')
# print('주문 종료. 주문 일시 = %s' %now)
#




##########################################################################
# import shutil
# print(dir(shutil)

# import os.path
# print(dir(os.path),'')

# import os
# os.getcwd()
# print(dir(os))
# print(os.getcwd())
# #
# # os.chdir('C:/python_exam')
#
#
#
# f=open('stockcode.txt','r')
# line_num=1
# line=f.readline()
# while line:
#     print('%d %s' %(line_num,line),end='')
#     line=f.readline()
#     line_num+=1
# f.close()
#
# f=open("stockcode.txt",'w')
# for i in range(1,12):
#     data='%d번째 줄입니다.\n' % i
#     f.write(data)
# f.close()

# text=input('파일에 저장할 내용을 입력하세요 : ')
# f=open('mydata.txt','w')
# f.write(text)
# f.close()

# count=1
# data=[]
# print('파일에 내용을 저장하려면 내용을 입력하지 말고 [Enter]를 누르세요')
# while True:
#     text=input('[%d] 파일에 저장할 내용을 입력하세요: '%count)
#     if text== '':
#         break
#     data.append(text+'\n')
#     count+=1
#
# f=open('mydata.txt','w')
# f.writelines(data)
# f.close()

# f=open('mydata.txt','r')
# while True:
#     line=f.readline()
#     if not line:
#         break
#     print(line)
# f.close()

# f=open('stockcode.txt','r')
# lines=f.readlines()
# print(lines)
# for line_num, line in enumerate(lines):
#     print('%d %s' %(line_num+1,line),end='')
# f.close()

# f=open('stockcode.txt','a')
# for i in range(12,2000):
#     data='%d번째 줄입니다.\n' %i
#     f.write(data)
# f.close()

# with open('LGU+.txt','w') as f:
#     f.write('life is too short, you need python')

# f=open('stockcode.txt','r')
# h=open('stockcode_copy.txt','w')
# data=f.read()
# h.write(data)
# f.close()
# h.close()

# spos=105
# size=500
#
# f=open('stockcode.txt','r')
# h=open('stockcode_part.txt','w')
#
# f.seek(spos)
# data=f.read(size)
# h.write(data)
#
# f.close()
# h.close()
#
# from os import remove
# target_file='stockcode.txt'
# k=input('[%s]파일을 삭제하시겠습니까? (y/n)' %target_file)
# if k=='y':
#     remove(target_file)
#     print('[%s]를 삭제했습니다.'%target_file)
#

#
# file1='stockcode.txt'
# file2='py_exam01.pay.txt'
#
# file_size1= getsize(final1)/1024
# file_size2
#
# from os import rename
#
# target_file = '주식코드'
# newname=input('[%s]에 대한 새로운 파일 이름을 입력하세요 : ' %target_file)
# rename(target_file, newname)
# print('[%s]->[%s]로 파일이름이 변경되었습니다.'%(target_file,newname))
#
# import os
# from os.path import exists

# dir_name=input('새로 생성할 디렉터리 이름을 입력하세요 : ')
# if not exists(dir_name):
#     os.mkdir(dir_name)
#     print('[%s] 디렉터리를 생성했습니다.' %dir_name)
# else:
#     print('[%s] 은(는) 이미 존재합니다.' %dir_name)

# dir_name = input('삭제할 디렉터리 이름을 입력하세요 : ')
# os.rmdir(dir_name)

# import os
# from os.path import exists,isdir,isfile
#
#
# files= os.listdir()
# for file in files:
#     if isdir(file):
#         print('DIR: %s' %file)
# for file in files:
#     if isfile(file):
#         print('FILE: %s' %file)

# with open('Steve_jobs_speech.txt','r') as f:
#     data = f.read()
#     tmp = data.split()
#     print('단어수 : [%d]' %len(tmp))

# import os

# def countWord(filename,word):
#     with open('Steve_jobs_speech.txt','r') as f:
#         data=f.read()
#         data=data.lower()
#         pos=data.find(word)
#         count=0
#         while pos != -1:
#             count +=1
#             pos = data.find(word,pos+1)
#     return count
#
# word=input('Steve_jobs_speech.txt 에서 개수를 구할 단어를 입력하세요:')
# word=word.lower()
# ret=countWord('Steve_jobs_speech.txt',word)
# print('[%s]의 개수 : %d'%(word,ret))

# def getTextFreq(filename):
#     with open(filename,'r') as f:
#         data=f.read()
#         data=data.lower()
#         fa={}
#         for i in data:
#             if i in fa:
#                 fa[i]+=1
#             else:
#                 fa[i]=1
#     return fa
# ret=getTextFreq('Steve_jobs_speech.txt')
# ret=sorted(ret.items(), key=lambda x:x[1],reverse=True)
# for c, freq in ret:
#     if c =='\n':
#         continue
#     print('[%c] -> [%d]회 나타남' %(c,freq))
#
# def countalpha(filename):
#     with open(filename,'r') as f:
#         data=f.read()
#         data=data.lower()
#         result={}
#         for i in data:
#             if i in result:
#                 result[i]+=1
#             else:
#                 result[i]=1
#     return result
#
# ret=countalpha()
# ret=sorted(ret.items(), key=lambda x:x[1], reverse=True)
# for c,freq in ret:
#     if c =='\n':
#         continue
#     print('[%c] ->[%d]회 나타남'%(c,freq))




# result={}
# s1='qwrqwrawipeAWEROASFNeaiasdf EP@1FO2 awEOFa weMAF'
# for i in s1:
#     if i in result:
#         result[i]+=1
#     else:
#         result[i]=1
#
# for key, val in result.items():
#     print ('%s : %d' %(key,val))



# ret=s1
# ret=sorted(ret.items(), key=lambda x:x[1], reverse=True)
# for c,freq in ret:
#     if c =='\n':
#         continue
#     print('[%c] ->[%d]회 나타남'%(c,freq))


# num1=int(input('첫번째 숫자를 입력하세요 : '))
# num2=int(input('두번째 숫자를 입력하세요 : '))
# cal=0
# num=[num1,num2]
# for i in range(1,11,1):
#     cal=(num[i-1]+num[i])%10
#     num.append(cal)
# print(num)


######

# num=[]
# tmp=int(input('첫번째 수 :'))
# num.append(tmp)
# tmp=int(input('두번째 수 : '))
# num.append(tmp)
#
# for i in range(2,11):
#     num.append(num[i-2]+num[i-1])
#     num[i]%=10
# print()
# for i in range(0,10):
#     print('{}'.format(num[i],end=''))