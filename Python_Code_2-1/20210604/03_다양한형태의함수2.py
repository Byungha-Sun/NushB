def printList(arr):
    for i in arr:
        print(i,end=', ')
    print()

# if __name__= '__main__':
#     a = [1, 2, 3, 4, 5]
#     printList(a)
#리스트 요소의 총합 반환 함수
def printListsum(arr):
    sum2=sum(arr)
    print('리스트의 총합은 : ', sum2)

#리스트의 최소값 반환 함수
def printListmin(arr):
    min1=min(arr)
    print('최소값은 : ', min1)

#리스트의 최대값 반환 함수:
def printListmax(arr):
    max2=max(arr)
    print('최대값은 : ', max2)

def main():
    a = [1,2,3,4,5]
    printList(a)
    printListsum(a)
    printListmin(a)
    printListmax(a)

    b=[9,8,7,6,5,4]
    printList(b)
    printListsum(b)
    printListmin(b)
    printListmax(b)
main()