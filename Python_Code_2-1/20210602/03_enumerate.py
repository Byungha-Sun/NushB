a=[9,8,7,6,5]

#enumerate(): 반복자, 리스트에서 요소를 하나씩 순서대로 추출하는 것을 반복
#반복적으로 방번호와 요소를 추출해서 반환

for idx, i in enumerate(a):
    print('a[',idx,']','=',i)
