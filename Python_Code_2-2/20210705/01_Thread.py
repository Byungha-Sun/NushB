import threading, time

flag=False

 #공유자원: 여러개의 쓰레드가 공유해서 사용하는 데이터나 자원
def f1(flag):
    while True:
        s = input('메시지 입력: ')

        if s == '/end':
            ('채팅 종료')
            flag(True)
            break
        print('메시지: ', s)
    print('th1 종료')


def f2(flag):
    s = ['aaa', 'bbb', 'ccc', 'ddd', 'eee', 'fff', 'ggg', 'hhh', 'iii', 'jjj']
    cnt=0
    while True:
        if flag():
            break
        print('server msg:',s[cnt%10])
        cnt+=1
        time.sleep(3)
    print('th2 종료료')



def main():

    th1 = threading.Thread(target=f1, args=(lambda : flag,))
    th1.start()

    th2 = threading.Thread(target=f2, args=(lambda : flag,))
    th2.start()
