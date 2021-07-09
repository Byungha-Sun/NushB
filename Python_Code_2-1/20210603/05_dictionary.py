'''
딕셔너리
키와 값을 묶어서 저장
키는 중복허용안함.
키의 타입은 변경불가한값, 값의 타입은 제약이 없음
요소 추가, 변경, 삭제 가능
'''

d1= {'name':'aaa', 'age':12, 'flag':True}
print(d1)
print(type(d1))

d2= {
    1:'aaa',
    2:'bbbb',
    3:'ccc'
}
print(d2)
print(type(d2))

#요소접근
print(d1['name'])
print(d1['age'])
print(d1['flag'])

#요소추가
d1['tel']='1234'
print(d1)

#수정
d1['name']='bbb'
print(d1)

#전체항목 불러오기
items=d1.items()
print(items)
print(type(items))
for i in items:
    print(i)


#요소 삭제
del d1['name']
print(d1)

#딕셔너리 함수
d1['name']='aaa'
print(d1.get('name')) #get(키): 키로 검색된 value 값을 반환
keys=d1.keys()
print(keys)

vals=d1.values()
print(vals)

for k in keys:
    val=d1[k]
    print(k,':',val)

d1.clear()
print(d1)
