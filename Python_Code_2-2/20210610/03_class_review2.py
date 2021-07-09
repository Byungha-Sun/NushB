#숫자 리스트를 다루는 클래스
#기능제공
class Number:
    def __init__(self,arr):
        self.arr=arr  #멤버 변수는 클래스 내에서 전역변수. 클래스 안의 모든 메서드가 사용 가능

    def listSum(self):
        s=0
        for i in self.arr:
            s+=i
        return s
    def listAvg(self):
        s=self.listSum()
        return s/len(self.arr)

def main():
    n1= Number([1,2,3,4,5])
    print(n1.listSum())
    print(n1.listAvg())

main()

