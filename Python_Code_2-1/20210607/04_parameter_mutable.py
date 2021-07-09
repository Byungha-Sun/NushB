#함수의 파라메터로 mutable한 값 전달의 예
#mutable : 변경되는 값. 리스트, 셋, dictionary

def f1(arr):
    print('f1 안에서 번경전: ', arr)
    arr[0]=100
    print('f1 안에서 번경후: ',arr)

def main():
    x=[1,2,3,4,5]
    print('main 안에서 번경전: ', x)
    f1(x)
    print('main 안에서 번경후: ',x)

main()


