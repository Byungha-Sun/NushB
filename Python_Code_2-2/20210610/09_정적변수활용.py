# 문제
# Test 클래스 만들고
# 객체가 생성되는 것을 카운팅하시오.
# ex)객체가 생성될때마다 몇번째 객체이다

class Test:
    x=0  #객체들이 공유해야 하는 값을 담기 위함
    def __init__(self):
        Test.x+=1
        print(Test.x,'번째 객체 생성')

def main():
    for i in range(0,5):
        Test()

main()

'''
1. 힙(heap): malloc(크기), new, 생성자 호출 -> 할당 받음. 주소로 접근 -> 변수
	   리스트, 객체 저장되는 메모리
2. 스택(stack): 함수, 메서드 호출되면 할당받는 메모리. 변수 선언으로 할당 -> 변수명
3. static: 클래스 변수 저장. 프로그램이 시작해서부터 종료할때까지 존재.
'''