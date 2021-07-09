# 번호, 이름, 국,영,수,총,평

data={}
num=1 #번호 자동할당
titles=['번호','이름','국어','영어','수학','총점','평균']

for i in range(0,3):
    s1={}
    total= 0
    for j in range(1,5):
        val= input(titles[j])
        if j!=1: #이름이 아니면
            val=int(val)
            total += val
        s1[titles[j]]=val
    s1[titles[j+1]]=total
    s1[titles[j+2]]=total/3
    data[num]=s1
    num+=1

#예쁘게 출력하는 코드  >왜 예쁘게 출력 안되지?
for i in titles:
    print(i, end='\t')
print()

keys= data.keys() #keys:[1,2,3]
for i in keys:
    dic= data[i]
    for j in titles:
        if j=='번호':
            print(i, end='\t')
        else:
            print(dic[j], end='\t')
    print()

