'''
관계 : 포함(has a)  - 소유. 다른 타입의 객체를 멤버변수로 갖는것
       상속(is a)  - 본질.자신 자체. 멤버 변수나 메서드를 정의하지 않아도 상속받아서 애초부터 가지고 있는 것(눈,코,입)

상속
1. 코드 재사용을 높이기 위해서
2. 다형성 구현
3. 조립형(인터페이스)

상속 디자인: 도출된 객체 비슷한 객체들이 발견 => 공통된 코드를 추출해서, 부모 클래스로 정의
=>비슷한 클래스들을 상속받아서 정의.

'''

# **상속 정의**

class Parent:
    def __init__(self):
        self.a= 10
        print('Parent 생성자')

    def method1(self):
        print('메서드1')

class Child(Parent): #Child는 Parent를 상속받는다. 부모의 멤버변수와 메서드를 물려받는다
    def __init__(self):  #super() : 부모객체 반환하는 함수
        super().__init__() #부모 객체 생성
        print('Child 생성자')
        self.b = 20

    def method2(self):
        print('메서드2')

class Child2(Parent): #Child는 Parent를 상속받는다. 부모의 멤버변수와 메서드를 물려받는다
    def __init__(self):
        super().__init__()
        print('Child 생성자')
        self.c = 20
        self.d = 40

    def method3(self):
        print('메서드3')

def main():
    c1= Child()
    print('c1.a: ',c1.a)
    print('c1.b: ',c1.b)

    c1.method1()
    c1.method2()

    c2= Child2()
    print('c2.a: ', c2.a)
    print('c2.c: ', c2.c)
    print('c2.d: ', c2.d)

    c2.method1()
    c2.method3()
main()




