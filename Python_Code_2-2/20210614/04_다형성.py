#다형성 구현 => 한 코드가 다양한 형태로 실행되는 것

class Car:
    def __init__(self):
        self.name=''

    def horn(self):
        print('자동차 빵빵')

class 소방차(Car):
    def __init__(self):
        super().__init__()
        self.name='소방차'

    def horn(self):
        print('불꺼~~~')

class 구급차(Car):
    def __init__(self):
        super().__init__()
        self.name= '구급차'

    def horn(self):
        print('삐용삐용~')

class 경찰차(Car):
    def __init__(self):
        super().__init__()
        self.name='경찰차'

    def horn(self):
        print('잡어~~')

def main():
    print('자동차를 선택하시오')
    s= input('1.소방차 2.구급차 3.경찰차')

    if s=='1':
        obj=소방차()
    elif s=='2':
        obj=구급차()
    elif s=='3':
        obj=경찰차()
    else:
        print('없는 번호')

    print(obj.name)
    obj.horn()

main()

