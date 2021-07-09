#과제. 1~100 사이의 소수(약수가 1과 자신밖에 없는 수)를 출력

#조건에 의한 반복
score=-1
while score>100 or score<0:
    score= int(input('score(0-100) : '))

if score>=60:
    print('합격')
else:
    print('불합격')
