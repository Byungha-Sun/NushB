#1. a라는 이름의 리스트를 생성. 숫자 1,2,3,4,5 로 초기화해서 생성하시오.
a=[1,2,3,4,5]

#2. a의 요소를 하나씩 출력
for i in a:
    print(i)

#3. a의 인덱스가 2인 요소의 값을 13으로 변경하시오
a[2]=13
print(a)

#4. a의 요소 중 짝수만 출력
for i in range(0,len(a)):
    if a[i]%2 ==0:
        print(a[i])
    else:
        continue

#5. a의 인덱스가 2인 요소를 삭제하시오
del a[2]
print(a)

#6. 이름이 b인 2줄 3칸 리스트를 생성.
b=[[0,0,0],[0,0,0]]
print(b)

#7. 0번줄의 2번방 요소를 10으로 변경하고 출력
b[0][2]=10
print(b)

#8. b의 요소를 0번줄은 [1,2,3], 1번줄은 [4,5,6]로 요소를 변경하시오
k=1
for i in range(0,len(b)):
    for j in range(0,len(b[i])):
        b[i][j]=k
        k+=1
print(b)

#9. b의 모든 요소 출력
for k in range(0,len(b)):
    for l in range(0,len(b[k])):
        print(b[k][l],end=' ')
    print()

