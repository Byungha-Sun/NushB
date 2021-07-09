#이름, 전화, 주소
#VO(Value Object) / DTO(Data Transfer Object)
#VO : 값 묶음
#DAO : 저장소 작업. 저장,수정,삭제...
#Service: 사용자 기능



class Member:
    def __init__(self,name='',tel='',address=''):
        self.name=name
        self.tel=tel
        self.address=address

    def printMember(self):
        print('name: ',self.name)
        print('tel: ',self.tel)
        print('address: ', self.address)

#DAO(Database Access Object). 이 코드는 DB대신 리스트 사용. 데이터를 추가/수정/검색/삭제 기능 구현 클래스


class MemDao:
    def __init__(self):
        self.datas=[]

    def insert(self,m):
        self.datas.append(m)

    def select(self,name):
        for i in self.datas:
            if i.name==name:
                return i #검색된 객체의 참조값 반환. 객체에 다이렉트로 접근

    def selectAll(self):
        return self.datas

    # def update(self,m): #수정할사람의 이름, 새전화, 새주소

    def delete(self,m):
        self.datas.remove(m)
        # del self.datas[idx]

#Service(비즈니스 로직 구현): 사용자에 제공할 기능을 구현하는 클래스. 추가/검색/수정/삭제

class MemService:
    def __init__(self):
        self.dao=MemDao()

    def addMember(self):
        name = input('name: ')
        tel = input('tel: ')
        address = input('address: ')
        m = Member(name, tel, address)
        self.dao.insert(m)

    def printMember(self):
        name=input('search name: ')
        m=self.dao.select(name)
        if m==None:
            print('없는 이름')
        else:
            m.printMember()

    def printAll(self):
        datas=self.dao.selectAll()
        for i in datas:
            i.printMember()

    def editMember(self):
        name = input('수정할 사람 name: ')
        m = self.dao.select(name)
        if m == None:
            print('없는 이름')
        else:
            m.tell=input('new tel: ')
            m.address=input('new address:')

    def delMember(self):
        name = input('수정할 사람 name: ')
        m = self.dao.select(name)
        if m == None:
            print('없는 이름')
        else:
            self.dao.delete(m)


class Menu:
    def __init__(self):
        self.service=MemService()

    def run(self):
        while True:
            menu=int(input('1.등록 2.검색 3.수정 4.전체출력 6.종료'))
            if menu==1:
                self.service.addMember()
            elif menu==2:
                self.service.printMember()
            elif menu==3:
                self.service.editMember()
            elif menu==4:
                self.service.delMember()
            elif menu==5:
                self.service.printAll()
            elif menu==6:
                break



def main():
    service = MemService()
    service.addMember()
    service.addMember()
    service.printAll()
    service.printMember()
    service.printMember()


# def main():
#     datas=[]
#
#     for i in range(0,3):
#         name= input('name: ')
#         tel= input('tel: ')
#         address= input('address: ')
#         m=Member(name,tel,address)
#         datas.append(m)
#
#     for i in datas:
#         i.printMember()


    '''
    m1=Member('aaa','010-24125','대한민국')
    m1.printMember()

    m2=Member('aaa','25125-512','부산')
    m2.printMember()
    '''
main()

#입력받아서...
#객체를 리스트에 담아
#메뉴 돌려줘야함

