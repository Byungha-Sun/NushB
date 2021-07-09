def f1(*x): #가변인자, 튜플로 받아옴
    print('함수시작')
    for i in x:
        print(i)
    print('함수끝')

def main():
    f1('aaa','bbb')
    f1('ccc','ddd','eee','fff')

main()

#가변인자를 이용하여 덧셈함수
#add(1,2)
#add(1,2,3,4,5)

def add(*x):
    print('덧셈시작')
    sum1=sum(x)
    print(sum1)

add(1,2,3,4)

def add(*nums):
    s=0
    for i in nums:
        s+=i
    return s
