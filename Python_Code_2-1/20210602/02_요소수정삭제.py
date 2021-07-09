# a=[1,2,3,4,5]
# print(a)
#
# a[2]=30
# print(a)
#
# #삭제 > 꽤 중요
#
# del a[2]
# print(a)
# del a[2]
# print(a)
#
# a=[1,2,3,4,5,6,67,75,23,6236,3,6263]
# print(a)
#
# a.remove(6236) #값을 찾아서 삭제. 없는 값이면 에러
# print(a)
#
# print(a.index(67))
# list.sort(a)
# print(a)

# a=[]
# for i in range(0,10):
#     num=a.append(int(input('숫자 입력: ')))
# print(a)
#
# #1. max값 찾기
# b=[]
# b.append(a[0])
# for j in range(0,len(a)):
#     if b[0]<a[j]:
#         b[0]=a[j]
# print('max : ',b)

#1-1. 최대값과 위치 - 강사님 풀이
a=[]
for i in range(0,10):
    a.append(int(input('num: ')))

max = a[0]
loc= -1
for idx, i in enumerate(a):
    if max < i :
        max=i
        loc=idx
print(max,loc)

#
# #2. min값 찾기
#
# b=[]
# b.append(a[0])
# for j in range(0,len(a)):
#     if b[0]>a[j]:
#         b[0]=a[j]
# print('min : ', b)
#
# #3. 찾고싶은 값 입력 받아서 그 값의 위치를 출력. 없으면 없다고 출력
# findnum=int(input('찾고 싶은 값 : '))
# for i in range(0,len(a)):
#     if findnum == a[i]:
#         print(a.index(findnum))
#     elif findnum != a[i]:
#         continue
#     else:
#         print('없음')

s_num =int(input('검색할 숫자: '))
flag= True
for idx, i in enumerate(a):
    if s_num == i:
        print(idx, '방에 있음')
        flag=False
        break
if flag:
    print('없음')

