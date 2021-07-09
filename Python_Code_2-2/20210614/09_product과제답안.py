class Product:
    cnt=0
    def __init__(self, name='', price=0, amount=0):
        Product.cnt +=1
        self.num=Product.cnt
        self.name=name
        self.price=price
        self.amount=amount

    def __str__(self):
        return 'num: ' + str(self.num) + ' / name: ' + self.name + ' / price: ' + str(self.price) + ' / amount: ' + str(self.amount)


#저장소에 추가(insert), 수정, 검색, 삭제
class Dao:
    def __init__(self):
        self.products=[] #[Product(), Product()]

    def insert(self, p):
        self.products.append(p)

    def select(self, num):
        for i in self.products:
            if i.num==num:
                return i

    def selectAll(self):
        return self.products

    def delete(self, num):
        p=self.select(num)
        if p!=None:
            self.products.remove(p)
            return True
        return False

class Service: #사용자에 제공할 기능 구현
    def __init__(self):
        self.dao = Dao()

    def addProduct(self):
        name= input('name: ')
        price= int(input('price: '))
        amount=int(input('amount: '))
        p=Product(name,price,amount)
        self.dao.insert(p)


    def printProduct(self):
        print('제품검색')
        num=int(input('검색할 제품 번호: '))
        p=self.dao.select(num)
        if p == None:
            print('없는 제품')
        else:
            print(p)

    def printAll(self):
        ps=self.dao.selectAll()
        for i in ps:
            print(i)


    def editProduct(self):
        print('제품수정')
        num = int(input('검색할 제품 번호: '))
        ps=self.dao.select(num)
        if ps == None:
            print('없는 제품, 수정 취소')
        else:
            ps.price= int(input('new price: '))
            ps.amount = int(input('new amount : '))


    def delProduct(self):
        print('제품삭제')
        num=int(input('삭제할 제품 번호: '))
        flag=self.dao.delete(num)
        if flag:
            print('삭제 완료')
        else:
            print('없는 번호, 삭제 취소')

class Menu:
    def __init__(self):
        self.service=Service()

    def run(self):
        while True:
            m=int(input('1.추가 2.검색 3.수정 4.삭제 5.전체목록 6.종료'))
            if m==1:
                self.service.addProduct()
            elif m==2:
                self.service.printProduct()
            elif m==3:
                self.service.editProduct()
            elif m==4:
                self.service.delProduct()
            elif m==5:
                self.service.printAll()
            elif m==6:
                break

def main():
    m=Menu()
    m.run()

main()







