
class MonitorService:
    def __init__(self):
        self.monitors=[]

    def addMonitor(self):
        #모니터의 모델명,가격,수량,크기를 키보드로 입력받아 Monitor객체 생성
        #생성한 객체를 리스트에 추가
        m=input('Monitor name: ')
        p=int(input('Monitor price: '))
        a=int(input('Monitor numbers: '))
        s=int(input('Monitor size: '))
        mo=Monitor(m,p,a,s)
        print(s)
        self.monitors.append(mo)

    def getMonitor(self):
        name=input('검색할 모니터 이름 입력: ')
        try:
            for i in self.monitors:
                if name==i[0]:
                    print(i)
        except:
            print('없음')

    def printAll(self):
        for i in self.monitors:
            print(i)

def main():
    service=MonitorService()
    service.addMonitor()
    service.addMonitor()
    service.printAll()
