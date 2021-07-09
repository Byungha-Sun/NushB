#클래스 =>캡슐화: 데이터 타입 정의 => int,str,float...
'''
코드 표현하려는 사물, 사람, 개념등이 하나의 값으로 표현이 불가능.

샘플링: 학생 1: 이름, 학번

타입정의 => 클래스 정의 =>이 시점에서는 메모리 할당 받지 않음
만든 타입으로 변수생성(객체) => 메모리 할당
--------------------
생성한 변수(객체)에 값을 할당하거나 읽음
생성한 변수(객체)의 메서드 호출
'''

# 성적처리 모듈화
'''
1. 성적입력: 이름,번호,국,영,수
2. 성적처리: 국,영,수로 총점,평균 계산
3. 성적출력: 이름,번호,국,영,수,총점,평균 출력
'''

class Student:
    def __init__(self):
        self.name=''
        self.num=0
        self.kor=0
        self.eng=0
        self.math=0
        self.total=0
        self.avg=0

    def setData(self,name,num,kor,eng,math):
        self.name=name
        self.num=num
        self.kor=kor
        self.eng=eng
        self.math=math

    def calc(self):
        self.total=self.kor+self.eng+self.math
        self.avg=self.total/3

    def printData(self):
        print('name:',self.name)
        print('num:', self.num)
        print('kor:', self.kor)
        print('eng:', self.eng)
        print('math:', self.math)
        print('total:', self.total)
        print('avg:', self.avg)

def main():
    #클래스 타입의 변수는 먼저 생성해야 사용가능
    s1=Student() #객체생성
    s1.name='aaa'
    s1.num=1
    s1.kor=45
    s1.eng=56
    s1.math=67
    s1.calc()
    s1.printData()

    s2=Student()
    s2.setData('bbb',2,87,57,86)
    s2.calc()
    s2.printData()

main()

