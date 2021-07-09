'''
1. 예외 클래스를 만들 수 있음. 파이썬에 정의되지 않은 예외 클래스 쓰고 싶을 때 직접 만들어서 사용.
class 예외클래스명(Exception):
    def __int__(self,변수1) :생성자, 객체 초기화 함수. 사용할 에러 메시지 할당
        sef.msg=msg

2. 예외 발생 시킴 => 파이썬이 인지하지 못하는 예외를 직접 발생시키고 싶을때 사용
raise 예외객체 생성
raise TypeError('에러 메시지')

3. 함수에서 예외가 발생하면 먼저 그 함수 안에서 예외처리 코드를 찾고, 있으면 그것을 실행.
없으면 이 함수를 호출한 위치(main)에서 예외처리 구문을 또 찾음 (스택 언롤링)
있으면 그 예외처리 구문을 실행하고 없으면 프로그램이 중단됨.
'''




#예외 클래스 하나 만듬. 이름 : NumError
class NumError(Exception):
    def __init__(self,msg): #생성자. 객체 초기화 함수
        self.msg =msg

def f1(num):  # 5이하의 숫자만 가능. 5보다 큰 숫자를 받으면 심각한 문제가 발생
    if num>5:
        raise NumError('num은 5이하') #raise 예외객체 : 예외 발생 구문

    print(num)

def f2(num):
    if not isinstance(num, int): #isinstance(a, type): a의 타입이 'type'이냐? 맞으면 True, 아니면 False
        raise TypeError('num은 int이어야 함') #TypeError 객체를 생성하여 던짐
    return num+10


def main():
    try:
        # f1(10)
        # f1(4)
        f2('asdf')
    # except NumError as e:
    #     print(e.msg)
    except TypeError as e:
        print(e)

main()
