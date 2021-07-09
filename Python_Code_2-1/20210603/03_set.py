'''
셋: 집합
요소 중복 허용 안됨
순서 없음
셋 자체는 변경 가능(요소를 추가/삭제 가능)
'''

s={1,2,3}
print(s,type(s))

#요소 순서 없기 때문에 인덱스 없음 s[1] X
s={1,2,3,2,3} #중복된 값이 있으면 에러 없이 저장 안함
for i in s:
    print(i)

s={'aaa',1,False}
print(s)

#s={1,2,[3,4,5]}  #변경가능한 요소(리스트)를 가질수 없음

#셋에 요소 추가
s.add('bbb') #요소 한개 추가
print(s)

a=[5,6,7]
s.update(a) #요소 여러개 추가
print(s)

#요소 삭제
s.remove('aaa') #없는 요소 삭제시 에러
s.discard(1)   #없는 요소 삭제시 무시
print(s)

x=s.pop()
print(x,'가 삭제됨')
print(s)

s.clear() #모든요소 삭제, 리스트에서도 동일
print(s)

###############
#합집합
s1={1,2,3}
s2={3,4,5}

s3=s1|s2
print(s3)
s4=s1.union(s2)
print(s4)

#교집합
s3=s1&s2
print(s3)

s4=s1.intersection(s2)
print(s4)

#차집합
s3=s1-s2
print(s3)

s4=s2-s1
print(s4)