'''
객체 지향 프로그래밍
순차적 프로그래밍은 시간의 흐름 순서대로 코드를 짰다면,
객체 지향 프로그래밍은 객체를 중심으로 개발.
객체를 정의하고 객체와 객체 사이의 관계를 정의하는 방식으로 프로그래밍 한다

객체: 세상을 프로그램으로 모델링할때 모델링의 대상이되는 사람이나 사물. 즉 샘플.
객체를 샘플링

ATM
입금
출금: 카드를 넣는다 -> 카드 비밀번호 입력 -> YES -> 출금액 입력 -> 카드와 연결된 계좌 정보를 추출
                                      -> No

객체란 타입을 정의.
why? -> 일반 변수는 값을 하나 밖에 못 담음. 그래서 관련있는 정보를 묶어서 한 변수에 담으려고 객체 정의



<카드 객체>
카드번호
명의자
비밀번호
카드사
계좌
<계좌 객체>
계좌번호
명의자
비밀번호
은행명

출금 금액 : 변수로 가능

'''

'''

정수 한개: int
실수 한개: float
문자열 한개: str
카드정보 한개: ? -> class Card 로 정의 
    카드번호, 카드명의자, 카드비밀번호와 같은 값들을 담으려면 클래스 안에 변수들이 필요함
    -> 그래서! class 안에 만든 변수를 '멤버변수'라고 함함타입 정의 방법#
**********************************************************
class 클래스명: #생성자. 객체 초기화. 객체의 멤버변수를 정의   #클래스명의 첫글자는 대문자로!
    def __init__(self):
        멤버변수 정의
    def 기능(self):
        실행문
**********************************************************
    
'''

class Card: #카드라는 이름의 타입을 정의함. 이 타입의 변수는 카드 1개의 정보를 담을 수 있다
    '''
    def __init__(self): #첫번째 파라메터는 현재 객체의 참조값을 받는다. 그래서 멤버변수 표현은 앞에 self.변수이름
        #name='aaa' -> 지역변수
        self.number ='' #카드번호
        self.owner ='' #카드명의자
        self.pwd ='' #카드비밀번호
        self.comp  ='' #카드사
    '''

    #생성자
    def __init__(self,number,owner,pwd,comp):
        self.number= number
        self.owner= owner
        self.pwd= pwd
        self.comp= comp

    #메서드. 멤버 함수
    def printCard(self): #self: 현재 객체. 객체 생성전이기 떄문에 객체 이름을 알 수 없음
        print('number: ', self.number)
        print('owner: ', self.owner)
        print('pwd: ', self.pwd)
        print('comp: ', self.comp)
        print()



def main():
    x = 10 #일반변수 정의 변수이름 = 값

    '''
    #객체(클래스로 만든 변수)는 바로 값을 할당할 수 없고 먼저 생성해야함. 생성하는 방법은 생성자 호출. 생성자 호출은 클래스이름()
    c1 = Card() #캡슐화
    c1.number = '123-4567-2343'
    c1.owner = '아무개'
    c1.pwd= '111'
    c1.comp = '신한'
    c1.printCard()


    c2 = Card() #캡슐화
    c2.number = '234-6345-5213'
    c2.owner = '홍길동'
    c2.pwd= '222'
    c2.comp = '우리'
    c2.printCard()
    '''

    c1=Card('123-4567-2343','아무개','111','신한')
    c1.printCard()

    c2=Card('234-6345-5213','홍길동',222,'우리')
    c2.printCard()

main()

##주소록
#id,pwd,name,email
#Member라는 클래스
#멤버변수 출력하는 기능


class Member():
    def __init__(self,id,pwd,name,email):
        self.id=id
        self.pwd=pwd
        self.name=name
        self.email=email

    def printMember(self):
        print('id:',self.id)
        print('pwd: ',self.pwd)
        print('name: ',self.name)
        print('email: ',self.email)

def main():
    m1=Member('sun950616','12345','선병하','gmail')
    m2=Member('byung95','52123','선병훈','naver')
    m3=Member(name='선주성',id='runman',pwd='25123',email='qweqwr')
    m3.printMember()
    m4= m3
    m4.name='가나다'
    m4.email='가나다@emial.com'
    m4.printMember()
    m3.printMember()



main()