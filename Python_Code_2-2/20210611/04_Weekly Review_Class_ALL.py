'''
클래스
int, float, str.. 이러한 기본 타입으로 객체 표현 어려움 => 객체 표현할 수 있는 데이터타입 정의.

학생의 이름, 번호, 학과
데이터 여러개 담으라고 리스트 제공

['aaa', 1, '컴공', 'bbb', 2, '산디', 'ccc', 3, '전자']

[['aaa', 1, '컴공'], ['bbb', 2, '산디'], ['ccc', 3, '전자']] => 2차원 리스트.


=> 리스트는 차수가 올라갈수록 복잡도가 올라간다

=> 학생의 문제점: 한 객체가 갖는 데이터 값도 여러개, 타입도 여러종류 => 하나의 기본 타입 변수에 담지 못함.
=> 리스트 사용시 복잡도 올라감
=> 에잇 타입을 만들자 => 클래스

<클래스 사용법>
1. 타입을 만든다 => 클래스 정의
2. 타입으로 변수를 만든다 => 객체 생성 => 메모리 할당받음
3. 만든 변수에 값 할당 => 객체 멤버 변수에 값 할당
   값을 읽을 수 있음
4. 메서드도 호출 가능

멤버변수는 다른 메서드에서도 만들 수 있지만 호출 순서에 따라 에러가 발생할 수 있으므로 멤버변수는 생성자에서 정의하는 것이 좋다
class Test:
    def setData(self, a, b):  #이 메서드에서 멤버변수 정의.
        self.a = a
        self.b = b

    def printData(self):
        print('a:', self.a)
        print('b:', self.b)


def main():
    m1 = Test()
    m1.setData(1,2)
    m1.printData()

    m2 = Test()
    m2.printData()
    m2.setData()

main()
'''
#클래스 구성요소: 멤버변수(이 객체의 데이터 담을라구), 메서드(기능)
#vo 클래스 => 역할: 객체의 값 저장. 값 관련 (메서드)기능만 제공. 값 할당(생성자), 값변경, 값읽기
#모니터 재고 관리 프로그램. 모델명, 가격, 수량, 크기
#모니터를 코드로 변환 => 하나의 모니터를 표현할 수 있는 타입 정의 => 모니터 클래스를 정의

#클래스 정의. 파이썬의 모든 클래스는 자동으로 object클래스를 상속받는다. 그래서 object가 가지고 있는 모든 멤버변수와 메서드를
#자동으로 상속받음
#그 중 하나가 __str__(): 객체를 설명하는 문자열을 반환. 클래스명 and 할당받은메모리 참조값을 문자열로 반환
'''
class Monitor:
    #생성자. 객체 초기화하는 함수. 멤버변수 정의 및 초기화. self:현재 객체 참조값. 모든 메서드는 첫번째 파라메터가 self다
    #멤버변수:객체소속의 변수. self.변수
    def __init__(self, model='', price=0, amount=0, size=0):
        self.model = model
        self.price = price
        self.amount = amount
        self.size = size

    def printMonitor(self):
        print('model:', self.model)
        print('price:', self.price)
        print('amount:', self.amount)
        print('size:', self.size)



def main():
    m1 = Monitor('s2440', 1500, 5, 27)  #객체 생성
    m1.printMonitor()

    m2 = Monitor('s2455', 2500, 5, 30)
    m2.printMonitor()

    m3 = Monitor('s3440', 4500, 8, 30)
    m3.printMonitor()

main()

'''


#클래스 정의. 파이썬의 모든 클래스는 자동으로 object클래스를 상속받는다. 그래서 object가 가지고 있는 모든 멤버변수와 메서드를
#자동으로 상속받음
#그 중 하나가 __str__(): 객체를 설명하는 문자열을 반환. 클래스명 and 할당받은메모리 참조값을 문자열로 반환
class Monitor:
    #생성자. 객체 초기화하는 함수. 멤버변수 정의 및 초기화. self:현재 객체 참조값. 모든 메서드는 첫번째 파라메터가 self다
    #멤버변수:객체소속의 변수. self.변수
    def __init__(self, model='', price=0, amount=0, size=0):
        self.model = model
        self.price = price
        self.amount = amount
        self.size = size

    #메서드 오버라이딩.=> 상속받은 메서드를 수정해서 사용
    def __str__(self):#객체 설명 메서드로 object로부터 상속받았음.
        return 'model:'+self.model+' / price:'+str(self.price)+' / amount:'+str(self.amount)+' / size:'+str(self.size)


def main():
    monitors = []#방이 없음
    monitors.append(Monitor('s2440', 1500, 5, 27))
    monitors.append(Monitor('s2455', 2500, 5, 30))
    monitors.append(Monitor('s3440', 4500, 8, 30))

    for i in range(0, 3):
        print(monitors[i])

    for m in monitors:
        print(m)

main()



#VO
class Monitor:
    def __init__(self, model='', price=0, amount=0, size=0):
        self.model = model
        self.price = price
        self.amount = amount
        self.size = size

    def __str__(self):
        return 'model:'+self.model+' / price:'+str(self.price)+' / amount:'+str(self.amount)+' / size:'+str(self.size)

#dao+service
#기능 및 저장 작업
#등록: 모니터 정보를 입력받는다 -> Monitor 객체 생성 -> 리스트에 추가함
#검색: 검색할 제품의 모델명을 입력받는다 -> 리스트의 객체들을 하나씩 꺼내서 비교 -> 찾은 결과 반환
#전체출력: 리스트의 모든 객체 출력
#멤버변수:
class MonitorService:
    def __init__(self):
        self.monitors = []  #이 객체의 다수 메서드가 사용하는 값. 멤버 변수는 클래스안에서 전역으로 사용하는 변수

    def addMonitor(self):  #새 모니터 등록. 모니터 데이터를 입력.
        #모니터의 모델명, 가격, 수량, 크기를 키보드로 입력받아 Monitor 객체 생성
        #생성한 객체를 리스트에 추가
        m = input('model:')        #새 모니터 모델 입력
        p = int(input('price:'))   #새 모니터 가격 입력
        a = int(input('amount:'))  #새 모니터 수량 입력
        s = int(input('size:'))   #새 모니터 크기 입력
        mo = Monitor(m, p, a, s)    #방금 입력받은 데이터를 묶어서 Monitor 객체 생성
        self.monitors.append(mo)    #생성한 객체를 리스트에 추가

    #모델명을 파라메터로 받아서 검색하여 검색된 객체 반환
    def getMonitor(self, model):
        #리스트 요소 하나씩 꺼내서 모델명 파라메터와 같은 제품 있으면 반환. 없으면 None 반환
        for i in self.monitors:
            if i.model == model:
                return i    #검색된 객체 반환

    def printMonitor(self):#모델명 입력받아서 똑같은 모니터 객체 찾아서 출력
        # 모델명 입력받아 지역변수에 저장
        name = input('검색할 모델명:')
        mo = self.getMonitor(name)
        if mo==None:
            print('없는 모델명')
        else:
            print(mo)

    def editMonitor(self):
        #수정할 제품 모델명입력받아서 지역변수에 저장
        #제품 검색해서 그 객체를 지역변수에 저장/ 검색했는데 없으면 여기서 종료
        #새 가격과 새 수량을 입력받아서 이 새정보로 객체를 변경
        name = input('수정할 모델명:')
        mo = self.getMonitor(name)
        if mo == None:
            print('없는 모델명. 수정 취소')
        else:
            mo.price = int(input('new price:'))
            mo.amount = int(input('new amount:'))

    def delMonitor(self):
        name = input('삭제할 모델명:')
        mo = self.getMonitor(name)
        if mo == None:
            print('없는 모델명. 삭제 취소')
        else:
            self.monitors.remove(mo)

    def printAll(self):
        for i in self.monitors:
            print(i)

#메뉴 클래스는 메뉴 돌려줄 메서드 하나만 있으면 됨.
#메뉴에서 기능을 선택해서 실행하려면 기능을 제공해주는 서비스 객체 필요. MonitorService를 멤버변수로 생성
class Menu:
    def __init__(self):
        self.service = MonitorService()

    def run(self):
        while True:
            m = int(input('1.모니터등록 2.검색 3.수정 4.삭제 5.전체출력 6.종료'))
            if m==1:
                self.service.addMonitor()
            elif m==2:
                self.service.printMonitor()
            elif m==3:
                self.service.editMonitor()
            elif m==4:
                self.service.delMonitor()
            elif m==5:
                self.service.printAll()
            elif m==6:
                break

def main():
    m = Menu()
    m.run()

main()