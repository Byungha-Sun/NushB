#지역변수(지역구): 함수 내에서 선언. 그 함수 내에서만 사용가능
#전역변수(전국구): 함수 밖에 선언. 이 파일 내에서 모든 함수에서 사용가능

num=10 #전역변수
def f1():
    global num #전역변수로 지정
    num=20 #전역변수. 전역변수 값 변경
    print('f1:',num)

def f2():
    x=5 #지역변수
    num=15 #변수정의. 지역변수로 정의
    print('f12 x:', x)
    print('f12:',num)
def main():
    print('main num:',num)
    # print('main x:', x) #x가 지역변수이기 때문에 참조값 참조 불가능
    f1()
    f2()
    print('main num:',num)

main()

