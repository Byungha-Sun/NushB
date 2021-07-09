#재귀함수
#자신을 호출하는 함수
#반복동작을 짧게 구현할 수 있는 장점이 있지만 스택 사용량이 확 늘어나서 스택 오버플로우 문제를 발생시킬 가능성이 있음
#대부분 재귀는 루프로 대체 가능하기 때문에 루프로 대체하는 것이 좋다

#5! = 5*4*3*2*1

# def fact(num):
#     if num==1:
#         return  1
#     else:
#         return num * fact(num-1)
#
# def fact2(num):
#     res=1
#     for i in range(1,num+1):
#         res *=i
#     return res
#
# def main():
#     res= fact(4)
#     print('4!:', res)
#
#     res=fact2(4)
#     print('4!: ', res)

# main()

#재귀함수를 이용하여 피보나치 수열을 숫자 100개 출력하시오

#1. 재귀함수 사용
#2. 재귀 안쓰고 루프로
#3. 리스트 사용

#재귀함수 사용
# def fibo1(num):
#     if num<=2:
#         return 1
#     else:
#         return fibo1(num-1)+fibo1(num-2)
#
# def main():
#     for i in range(1,101):
#         print(fibo1(i))

#loop 사용
def fibo2(num):
    i,j,k=1,1,0
    for x in range(1,num+1):
        if x <3:
            print(1,end='\t')
        else:
            k=i+j
            print(k,end='\t')
            i=j
            j=k
    print()



#리스트 사용
def fibo3(num):
    li=[1,1]
    i=2
    while len(li)!=num:
        li.append(li[i-2]+li[i-1])
        i+=1
    print(li)

def main():
    fibo2(4)
    fibo3(4)

main()

