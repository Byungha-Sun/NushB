# a=10
# b=13
# #조건문은 조건이 만족될때만 실행됨
# if a>b:
#     print('a는 b보다 크다')
# if a==b:
#     print('a는 b와 같다')
# if a<b:
#     print('a는 b보다 작다')
#

# score=int(input('점수 입력: '))
#
# if score>=60:
#     print('합격')
# else:
#     print('불합격')
#
#

# num=int(input('숫자 입력 : '))
#
# if num%2 == 0:
#     print('짝수')
# else:
#     print('홀수')
#
# gender=input('성별을 입력해주세요(남:M , 여:F):')
# age=int(input('나이를 입력해주세요:'))
#
# if gender=='F' and age>=20:
#     print('통과')
# else:
#     print('성인 여성만 입장 가능')
#
# a=10
# b=20
# a+=b
# print(a)
#
# menu=int(input('Please selcet the mode: '))
#
# if menu==1:
#     print('game start')
# elif menu==2:
#     print('select character')
# elif menu==3:
#     print('start practice mode')
# elif menu==4:
#     print('game over')
# else:
#     print('reselect mode')


score=int(input('점수 : '))
if score<0:
    print('점수를 다시 입력해주세요')
elif score<60:
    print('F')
elif score>=60 and score<70:
    print('D')
elif score>=70 and score<80:
    print('C')
elif score>=80 and score<90:
    print('B')
elif score>=90 and score<=100:
    print('A')
elif score>100:
    print('점수를 다시 입력해주세요')

###풀이

score= int(input('score(0-100): '))
if score<0 or score>100:
    print('잘못된 점수')
else:
    if score>=90:
        print('A')
    elif score>=80:
        print('B')
    elif score>=70:
        print('C')
    elif score>=60:
        print('D')
    elif score<60:
        print('F')

