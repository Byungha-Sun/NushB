a=10 #전역변수
def f1(param1): #param1:지역변수
    b=20 #지역변수
    print('a: ',a) #전역변수 a 출력
    print('param: ', param1) #지역변수 param1 출력
    print('b: ',b) #지역변수 b 출력

def f2():
    a=30
    print('a:', a)
    #print(b)        #f1의 지역변수이므로 사용불가
    #print(param1)   #f1의 지역변수이므로 사용불가
    print('x: ',x)

# x=100
#
# def f3():
#     global a
#     a=50 #전역변수 a 변경
#     print('a: ',a ) #전역변수 출력
#     print('x: ', x)
#
# def main():
#     f1(35)
#     f2()
#     f3()
#
# main()