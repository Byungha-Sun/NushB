#정적메서드 및 정적변수 활용예. => 객체 생성없이 클래스에서 제공하는 메서드(기능)를 사용하는 클래스
#API 기능 제공

#정적 클래스
class Math:
    #파이썬에서 상수 정의 방법
    __pi=3.14 #변수앞에 __붙이면 private멤버변수 (클래스 밖에서는 안보임).
    PI = __pi

    def circle(r):
        return r*r*Math.PI

    def rect(w, h):
        return w*h


def main():
    print('pi: ', Math.PI)
    w=Math.circle(5)
    print('원의 넓이: ',w)
    w=Math.rect(5,10)
    print('사각형의 넓이: ',w)

main()


