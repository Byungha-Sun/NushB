
#VO
class Product:
    def __init__(self,pd_num=0,pd_name='',pd_price=0,pd_amount=0):
        self.pd_num=pd_num
        self.pd_name=pd_name
        self.pd_price=pd_price
        self.pd_amount=pd_amount

    def __str__(self):
        return 'product number :'+str(self.pd_num)+' / name :'+self.pd_name+' / product price : '+str(self.pd_price) + ' / product amount: '+ str(self.pd_amount)


#DAO

class productService:
    def __init__(self):
        self.products=[]
        self.pd_num=1

    def addProduct(self):
        n=input('name: ')
        p=int(input('price: '))
        a=int(input('amount: '))
        pd=Product(self.pd_num,n,p,a)
        self.products.append(pd)
        self.pd_num+=1
        print(pd)


    def getProduct(self,pd_num):
        for i in self.products:
            if i.pd_num==pd_num:
                return i

    def searchProduct(self):
        num=int(input('찾을 제품 번호 입력: '))
        pd=self.getProduct(num)
        if pd==None:
            print('없는 제품')
        else:
            print(pd)

    def editProduct(self):
        num = int(input('수정할 제품 번호 입력: '))
        pd=self.getProduct(num)
        if pd==None:
            print('없는 제품')
        else:
            pd.pd_price=int(input('new price: '))
            pd.pd_amount=int(input('new amount: '))

    def delProduct(self):
        num = int(input('삭제할 제품 번호 입력: '))
        pd = self.getProduct(num)
        if pd == None:
            print('없는 제품')
        else:
            self.products.remove(pd)

    def printAll(self):
        for i in self.products:
            print(i)

class Menu:
    def __init__(self):
        self.service=productService()

    def run(self):
        while True:
            menu=int(input('1.제품등록 2.검색 3.수정 4.삭제 5.전체출력 6.종료 : '))
            if menu==1:
                self.service.addProduct()
            elif menu==2:
                self.service.searchProduct()
            elif menu==3:
                self.service.editProduct()
            elif menu==4:
                self.service.delProduct()
            elif menu==5:
                self.service.printAll()
            elif menu==6:
                break

def main():
    m=Menu()
    m.run()

main()



