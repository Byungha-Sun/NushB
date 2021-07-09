'''
2주차복습
eugene kim
•
오전 10:32

함수복습1.py
텍스트
수업 댓글

2주차복습
nums = []
x = 1

#숫자를 nums 리스트에 저장
def addNum1():
    print('addNum1() 호출됨')
    #x = 10  #지역변수
    global x    #내가 전역변수 x에 값을 할당할거야. 그니까 지역변수 x 만들지마
    x=10#전역변수 10으로 변경

    num = int(input('num:'))
    #nums = 'aaa'#새 지역변수(str 타입)
    nums.append(num)  #전역 객체를 사용하여 메서드 호출. global 필요없음

def addNum2(num): #함수 호출할때 값 하나를 괄호에 넣어서 호출해라
    print('addNum2() 호출됨')
    nums.append(num)

def printNums():
    print('printNums() 호출됨')
    print('숫자 개수:', len(nums))
    for i in nums:
        print(i, end=', ')
    print()

#탐색함수: 탐색한 결과 리턴
# 파라메터 받을 수도 있고 / 함수 안에서 직접 키보드로 입력 받을 수도 있다
#0번방부터 마지막방까지 요소를 하나씩 꺼내 찾을 값과 비교. 같은 값 있으면 루프 빠져나옴
def search1(num): #검색할 값을 파라메터로 받음
    for idx, i in enumerate(nums):#i는 요소
        if i==num:
            return idx

def search2(num):
    for i in range(0, len(nums)):#i는 인덱스
        if nums[i] == num:
            return i

def search3():
    num = int(input('찾고 싶은 num:'))
    for i in range(0, len(nums)):#i는 인덱스
        if nums[i] == num:
            return i

def search4():
    num = int(input('찾고 싶은 num:'))
    idx = search2(num)
    printIdx(idx)

def printIdx(idx):
    if idx==None:
        print('not found')
    else:
        print(idx, '위치에 있음')

#삭제함수. 2개 (파람있음. 파람없음)

def main():
    addNum1()
    addNum1()
    addNum2(3)
    addNum2(4)
    printNums()
    idx = search1(1)
    printIdx(idx)
    idx = search2(2)
    printIdx(idx)
    idx = search3()
    printIdx(idx)
    search4()

'''

#삭제함수 2개.(파람있는거 , 파람없는거)

# def delete():
#     num=int(input('삭제할 번호: '))
#     if num not in list:
#         print('Not Found')
#     else:
#         list.remove(num)
#         print(list)
#
# def delete2(num):
#     if num not in list:
#         print('Not Found')
#     else:
#         list.remove(num)
#         print(list)
#
# def main():
#     delete()
#     delete2(25)
#
# main()
#
# def delNum2():
#     num=int(input('삭제할 숫자:'))
#     try:
#         list.remove(num)
#     except:
#         print('없는 숫자. 삭제 취소')
#


