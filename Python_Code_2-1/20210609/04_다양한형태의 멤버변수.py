# class Point:
#     def __init__(self,x=0,y=0):
#         self.x=x
#         self.y=y
#     def printPoint(self):
#         print('좌표:(',self.x,' , ', self.y,')')
#
# class Test:
#     def __init__(self):
#         self.num=0          #정수
#         self.s=''           #문자열
#         self.arr=[]         #리스트
#         self.point = None   #객체. 포함관계/   관계(포함관계=has a, 상속관계=is a)
#
#
#     def printdata(self):
#         print('num:', self.num)
#         print('s: ', self.s)
#         print('arr: ', self.arr)
#         self.point.printPoint()
#
# def main():
#     t1=Test()
#     t1.num=10
#     t1.s='hello class'
#     t1.arr.append(1)
#     t1.arr.append(2)
#     t1.point.x=20  ##객체 생성 안됐기에 오류!
#     t1.point.y=30  ##객체 생성 안됐기에 오류!
#     t1.arr.append(3)
#     # t1.point=Point(3,4)
#     t1.printdata()
#
# main()



###재설명


class Point:
    def __init__(self,x=0,y=0):
        self.x=x
        self.y=y
    def printPoint(self):
        print('좌표:(',self.x,' , ', self.y,')')

class Test:
    def __init__(self):
        self.p=Point() #None 상수  *********>>> None 대신 Point()를 써야함!
        self.num=0  #int값

def main():
    t1= Test()  #Test 객체 생성 => 메모리 할당. 생성자를 호출해야 객체 메모리를 할당받는다
    t1.num=10
    t1.p.x=10
    t1.p.y=20
    t1.p.printPoint()

main()

