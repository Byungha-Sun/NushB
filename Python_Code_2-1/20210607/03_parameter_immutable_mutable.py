#함수의 파라메터로 immutable한 값 전달의 예
#immutable(값 변경 안되는 요소. 상수). int,str,float,bool,(tuple)
def f1(num,name):
    print('f1에서 변경전')
    print('num:',num)
    print('name:',name)
    num=123
    name='asf'
    print('f1에서 변경후')
    print('num:', num)
    print('name:', name)

def main():
    num=10
    name='aaa'
    print('main에서 변경전')
    print('num:', num)
    print('name:', name)
    f1(num,name)
    print('main에서 변경후')
    print('num:', num)
    print('name:', name)

main()
