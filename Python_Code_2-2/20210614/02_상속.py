'''
학사관리

>>사람    이라는 클래스로 뽑아내기
-번호
-이름
-정보출력

학생
    -학번
    -이름
    -학과
    -수강과목
    -정보출력


교수
    -번호
    -이름
    -학과
    -강의과목
    -정보출력


교직원
    -번호
    -이름
    -부서
    -직무
    -정보출력

'''

# class Person:
#     def __init__(self):
#         self.number=0
#         self.name=''
#         self.type='' #학생인지 교직원인지 알려주는 타입
#
#     def printInfo(self):
#         print('number: ', self.number)
#         print('name: ', self.name)
#         print('type: ', self.type)
#
# class Student(Person):
#     def __init__(self,number,name,dept):
#         super().__init__()
#         self.number= number
#         self.name=name
#         self.dept=dept
#         self.type ='학생'
#         self.subj=[]
#
#     def 수강신청(self,sub):
#         self.subj.append(sub)
#
#     def print수강과목(self):
#         print('수강과목')
#         for i in self.subj:
#             print(i)
#
# class Prof(Person):
#     def __init__(self,number,name,dept):
#         super().__init__()
#         self.number= number
#         self.name=name
#         self.dept=dept
#         self.type ='교수'
#         self.담당과목=[]
#
#     def 담당과목추가(self, sub):
#         self.담당과목.append(sub)
#
#     def print담당과목(self):
#         print('담당과목')
#         for i in self.담당과목:
#             print(i)
#
#
# class Staff(Person):
#     def __init__(self, number, name, dept):
#         super().__init__()
#         self.number = number
#         self.name = name
#         self.dept = dept
#         self.type = '교직원'
#         self.job = ''
#
#     def setJob(self, job):
#         self.job=job
#
#     def printJob(self):
#         print('담당직무: ', self.job)
#
# def main():
#     s1= Student(1,'aaa','컴퓨터공학')
#     s1.수강신청('전산학개론')
#     s1.수강신청('컴퓨터비전')
#     s1.printInfo()
#     s1.print수강과목()
#
#     p1=Prof(2,'bbb','전자공학')
#     p1.담당과목추가('마케팅원론')
#     p1.담당과목추가('고급회계')
#     p1.printInfo()
#     p1.print담당과목()
#
#     st1=Staff(3,'ccc','경리부')
#     st1.setJob('경리업무')
#     st1.printInfo()
#     st1.printJob()
#
# main()


