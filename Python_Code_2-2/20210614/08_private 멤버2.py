class Member:
    def __init__(self,id='',pwd='',email=''):
        self.__id=id
        self.__pwd=pwd
        self.__email=email


    def __str__(self): #object 클래스로부터 상속받은 메서드 재정의. 이 메서드의 역할을 객체 설명. 원래는 '클래스명. 참조값'을 반환하도록 되어 있음
        return 'id:'+self.__id+ ' / pwd: ' + self.__pwd + ' / email: ' + self.__email

    def setId(self,id):
        self.__id=id

    def getId(self):
        return self.__id



def main():
    m1= Member('aaa','111','aaa@emial.com')
    m2= Member('bbb','222','bbb@emial.com')
    m3= Member('ccc','333','ccc@emial.com')

    # m1.__id='aaa1'  ->private이 아닐때 이렇게 값 변경!

    m1.setId('aaa1')
    print(m1)
    print(m1)
    print(m1)
    print(m1.getId())
main()
