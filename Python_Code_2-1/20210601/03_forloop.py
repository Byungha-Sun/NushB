# #1
# for i in range(1,11):
#     print(i)
#
# #2
# for i in range(2,11,2):
#     print(i)
#
# #3
# a=0
# for i in range(1,101):
#     a+=i
# print(a)
#
# #4
# for i in range(1,10):
#     print('3','*',i,'=',3*i)
#
#
# for i in range(2,10):
#     for j in range(1,10):
#         print(i,'*',j,'=',i*j)
#     print('')
# #
# #
# for j in range(0,2):
#     for i in range(0,3):
#         print('#',end='')
#     print('')

# for i in range(1,11):
#     if i%2==0:
#         continue
#
#     print(i,end='\t')
# print()

##과제
#1. 1~100 소수 출력
#2. 크기 입력받아 삼각형 출력
'''
*
**
***
****
'''
#3. 크기 입력받아
 #     *
 #    **
 #   ***
 #  ****
 # *****
#4. 이등변 삼각형

#5. 마름모 출력
 #   *
 #  ***
 # *****
 #  ***
 #   *
 #
#
#1.
for i in range(1,100):
    for j in range(2,i+1):
        if i==j:
            print(i)
        elif i%j==0:
            break

#2.
num=int(input('크기 입력 : '))
for i in range(1,num+1):
    print('*'*i)

#3.
num=int(input('크기 입력 : '))
for i in range(1,num+1):
    print((num-i)*' ',i*'*')


#4.
num=int(input('크기 입력: '))
for i in range(1,num+1):
    if (num-i)%2 == 0:
        print(int(((num-i)/2))*' ',i*'*',int(((num-i)/2))*' ')
    else:
        continue

#5.
num=int(input('크기 입력: '))
for i in range(1,num+1):
    if (num-i)%2 == 0:
        print(int(((num-i)/2))*' ',i*'*',int(((num-i)/2))*' ')
    else:
        continue

for i in range(num-1,0,-1):
    if (num-i)%2 == 0:
        print(int(((num-i)/2))*' ',i*'*',int(((num-i)/2))*' ')
    else:
        continue
