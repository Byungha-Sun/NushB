

#멤버변수는 다른 메서드에서도 만들 수 있지만, 호출 순서에 따라 에러가 발생할 수 있으므로 멤버변수는 생성자에서 정의하는 것이 좋다
'''class Test:
    def setData(self,a,b):
        self.a=a
        self.b=b

    def printData(self):
        print('a:',self.a)
        print('b:',self.b)

def main():
    m1=Test()
    m1.setData(1,2)
    m1.printData()

    m2=Test()
    m2.printData()

main()
'''
#클래스 구성요소: 멤버변수(이 객체의 데이터 담을려고.), 메서드(기능)
#vo.클래스 =>역할 : 객체의 값 저장. 값 관련 (메서드)기능만 제공, 값 할당(생성자), 값 변경, 값 읽기
#모니터 재고 관리 프로그램. 모델명. 가격. 수량. 크기
#모니터를 코드로 변환 => 하나의 모니터를 표현할 수 있는 타입 정의 =>모니터 클래스를 정의
class Monitor:

    #생성자. 객체 초기화하는 함수. 멤버변수 정의 및 초기화. self:현재 객체 참조값. 모든 메서드는 첫번째 파라메터로 self 를 받는다.
    #멤버변수: 객체소속의 변수. self.변수
    def __init__(self,model='',price=0, amount=0, size=0):
        self.model=model
        self.price=price
        self.amount=amount
        self.size=size

    def __str__(self):
        return 'model:' +self.model+'/ price:'+str(self.price)+' / amount:'+str(self.amount)+' / size:'+str(self.size)


    def printMoritor(self):
        print('model:',self.model)
        print('price:', self.price)
        print('amount:', self.amount)
        print('size:', self.size)

#DAO + SERVICE

def main():
    monitors=[]
    monitors.append(Monitor('s2400',1500,5,27))
    monitors.append(Monitor('s2500',2500,5,30))
    monitors.append(Monitor('s2600',4500,8,30))

    for i in range(0,3):
        print(monitors[i])

    for m in monitors:
        print(m)
        m.printMoritor()

main()




