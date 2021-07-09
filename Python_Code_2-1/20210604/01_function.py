#함수 사용하는 이유
#>> 자주 사용하는 코드를 반복적으로 작성하지 않고 모듈화해서 필요할때 호출해서 반복사용하는 방법
#>> 프로그램적으로 보면 하나의 기능 구현 단위

#함수 사용방법
#1. 함수 정의

#def 함수명(파라미터들):
#   실행문1
#   실행문2

#2. 함수 호출

# def add(x1,x2):
#     x3=x1+x2
#     print(x3)
#     return x3
#
#
# def hellO():
#     print('hello')
#
#
# res=add(2,3)
# print(res)

# def hello():
#     print('hello')
#
# def add(x,y): #x,y : 파라메터(매개변수)
#     return x+y
#
# res=add(1,2) #호출 시 파라미터에 넣어주는 값을 아규먼트(인자)
# print(res)
#
# def gugudan(x):
#     for i in range(1,10):
#         print(x,'*',i,'=',i*x)
#
# gugudan(7)
#
# for i in range(2,10):
#     gugudan(i)

# def add(x1,x2):
#     return x1+x2
#
# def minus(x1,x2):
#     return x1-x2
#
# def multi(x1,x2):
#     return x1*x2
#
# def divide(x1,x2):
#     if x2!=0:
#         return x1/x2
#     else:
#         return '0으로 나눌 수 없습니다'
#
# num1=int(input('첫번째 숫자 입력: '))
# num2=int(input('두번재 숫자 입력: '))
# signal=input('연산기호 입력: ')
#
# res=0
# if signal=='+':
#     res= add(num1,num2)
# elif signal=='-':
#     res= minus(num1,num2)
# elif signal=='*':
#     res= multi(num1,num2)
# elif signal=='/':
#     if res==None:
#         print('0으로 나눌 수 없습니다')
#     else:
#         res=divide(num1,num2)
#
# print(res)

#파라메터로 숫자를 입력 받아서 그 숫자의 약수를 출력하는 함수. 리턴값 없음

def yaksu(x):
    yaksus=[]
    for i in range(1,x+1):
        if x%i==0:
            yaksus.append(i)
    return  yaksus

def yaksuprint(data):
    print(data[len(data)-1], '의 약수: ', end='')
    for i in data:
        print(i, end=', ')
    print()

x= int(input('num: '))
d= yaksu(x)
yaksuprint(d)

