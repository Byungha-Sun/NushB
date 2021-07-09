
#과제
#성적처리 프로그램 클래스로 변환
# class Student:
#     멤버변수:name,num,kor,eng,math,total,avg //따로 변수로,리스트,클래스 포함관계    기능: 총점계산/평균계산/정보출력

#s1
#s2
#s3

class Score:
    def __init__(self,name,num,kor,eng,math):
        self.name=name
        self.num=num
        self.kor=kor
        self.eng=eng
        self.math=math

    def printScore(self):
        print('name','num','kor','eng','math','total','average')
        print(self.name,self.num,self.kor,self.eng,self.math,self.kor+self.eng+self.math,(self.kor+self.eng+self.math)/3)

def main():
    s1=Score('aaa',1,95,85,53)
    s1.printScore()

main()


