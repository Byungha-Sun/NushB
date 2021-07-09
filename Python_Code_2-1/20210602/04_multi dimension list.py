# a=[[1,2,3],[4,5,6]]
# print(a)
#
# print(a[0])
# print(a[1])
#
# for i in a:
#     for j in i:
#         print(j,end=',')
#     print()
#
#
# for i in range(0,len(a)):
#     for j in range(0,len(a[i])):
#         print(a[i][j],end=',')
#     print()
#
# for i in range(0,len(a)):
#     for j in range(0,len(a[i])):
#         a[i][j]*=10
#         print(a[i][j],end=',')
#     print()
#
#요소를 입력받아 저장
# a=[]
# for i in range(0, len(a)):
#     for j in range(0,len(a[i])):
#         a[i][j]=int(input('num:'))
# print(a)


#성적처리 프로그램
# 3명의 번호, 국 영 수 입력받아 각 학생의 총점, 평균 계산해서 결과 출력
cl=['번호','국어','영어','수학']
# a1=[]
# a2=[]
# a3=[]
# num=0
# for i in range(1,4):
#     for j in cl:
#         for k in range(0,3):
#             a[k][(print('학생의',j,'입력 : ')


score=[[0]*6,[0]*6,[0]*6]
cl=['번호','국어','영어','수학']
for i in range(0,len(score)):
    for j in range(0,len(score[i])-2):
        score[i][j]=int(input(cl[j]))

for k in range(0,len(score)):
    score[k][4]=(score[k][1]+score[k][2]+score[k][3])

for m in range(0,len(score)):
    score[m][5]=(score[m][4])/3

print('번호',' ','국어',' ','영어',' ','수학',' ','총점',' ','평균')
for n in range(0,len(score)):
    for q in range(0,len(score[n])):
        print(score[n][q], end='     ')
    print()

score = [[0,0,0,0,0,0]]

