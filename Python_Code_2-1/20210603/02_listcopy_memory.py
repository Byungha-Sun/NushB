import copy
#얕은 복사
a=[1,2,3]
b=a #참조값 복사
print(a)
print(b)

a[2]=30
print(a)
print(b)

##########
#얕은 복사2 (상수값을 쓸때는 문제가 없음)
a=[1,2,3]
b=copy.copy(a)
print(a,b)

a[2]=30
print(a,b)

#########

a=[1,2,[4,5,6]]
b=copy.copy(a)
print(a,b)

a[2][0]=40
print(a,b)

########
