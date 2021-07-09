#메서드 재정의 : 부모로부터 상속받은 메서드를 현재 클래스에 맞게 수정하여 사용.

class Point2D:
    def __init__(self,x,y): #부모클래서 생성자가 파라미터가 있따면 자식 클래스 생성자에서도 넣어주어야 함
        self.x=x
        self.y=y

    def printPoint(self):
        print('x:', self.x, 'y:', self.y, end='')


class Point3D(Point2D):
    def __init__(self,x,y,z):
        super().__init__(x,y) #부모클래스 생성자 호출
        self.z=z

    #메서드 재정의. 부모가 준 메서드 자기 한테 맞게 고쳐씀
    def printPoint(self):
        super().printPoint() #super(). : 부모객체 반환. 재정의한 메서드의 옛버전을 사용하고 싶다면 super().메서드()
        print(' z:', self.z)


def main():
    p1= Point2D(1,2)
    p1.printPoint()
    print()

    p2=Point3D(4,5,6)
    p2.printPoint()


main()
