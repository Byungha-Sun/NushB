#사람. 이름. 나이 저장.
#기능: 출력

class Person():
    def __init__(self, name='', age=0): #생성자는 아무때나 호출 못하고 생설할 때 한번만 호출됨
        #멤버변수정의. 객체의 데이터를 담는 변수
        self.name=name
        self.age=age

    def setData(self,name,age):
        self.name=name
        self.age=age

        
    #메서드. 클래스 안에 정의한 함수. 이 객체의 기능. 정보 출력
    #모든 메서드의 첫번째 파라메터는 현재 객체의 참조값이 전달됨.
    def personPrint(self): #현재 객체의 참조값
        name='xxx'
        print('지역변수 name: ',name)
        print('name: ',self.name)
        print('age: ', self.age)

def main():
    p1=Person() #생성자 호출은 클래스명() => 객체가 사용할 메모리 할당받아서 그 참조값을 반환
    #반환받은 참조값을 변수 p1에 저장.
    #p1.멤버변수, p1.메서드() 사용이 가능해짐
    p1.name='aaa'  #멤버변수값 쓰기
    p1.age=12      #멤머변수값 쓰기

    print(p1.name) #멤버변수값 읽기
    print(p1.age)  #멤버변수값 읽기
    p1.personPrint()

    p2 = Person()
    p2.name = 'bbb'  # 멤버변수값 쓰기
    p2.age = 23  # 멤머변수값 쓰기

    print(p2.name)  # 멤버변수값 읽기
    print(p2.age)  # 멤버변수값 읽기

    p2.personPrint()

    # persons=[]
    # for i in range(0,3):
    #     persons.append(Person())


main( )
