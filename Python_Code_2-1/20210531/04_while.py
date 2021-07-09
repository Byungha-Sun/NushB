# a=5
# while a>0:
#     print(a)
#     a-=1
#
# print('while밖')
#
# a=1
# while a<=10:
#     print(a)
#     a+=1
#

# # 1. 1~100 합 구하라 > 5050
# a=1
# b=0
# while a<=100:
#     b+=a
#     a+=1
# print(b)
#
# #2. 1~100 짝수만 출력하라
# x=1
# while x<=100:
#     if x%2==0:
#         print(x)
#     x+=1
#
# #3. 구구단 단수를 입력받아 출력
# num=int(input('단 수 입력: '))
# i=1
# while i<=9:
#     print(num,'*',i,'=',num*i)
#     i+=1
#
# #4. 약수 구하기
#
# num2=int(input('약수를 구할 값 입력 : '))
# k=1
# while k<=num2:
#     if num2%k ==0:
#         print(k, end='\t')
#     k+=1

# i=1
# while i<=100:
#     print(i, end='\t')
#     if i%10==0:
#         print()
#     i+=1
#
# #짝수 구하는 다른 방법
# i=2
# while i<=100:
#     print(i, end='\t')
#     i+=2
# print()
#
# #구구단
#
# dan=2
# while dan<10:
#     i=1
#     while i<10:
#         print(dan,'*',i,'=',dan*i)
#         i +=1
#     dan+=1
