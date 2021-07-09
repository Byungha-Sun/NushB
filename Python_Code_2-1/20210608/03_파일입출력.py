#파일입출력
'''
1. 파일오픈
file = open('파일경로','[모드:기본값은 읽기모드 (r) ]')
open('a.txt', 'r')

모드 종류: r(읽기모드, 파일 없으면 에러), w(쓰기모드, 파일 없으면 새로 생성. 있으면 파일 내용 지우고 새로씀), a(이어쓰기),
          t(텍스트), b(바이너리)
          r+(읽고쓰기), w+(읽고쓰기), a+(읽고쓰기)

2. 읽고/쓰기 작업
읽기
    read(size):size 크기만큼 파일에서 읽어서 반환
    read():파일 전체 읽어서 반환
    readline():한줄읽어서 반환
쓰기
    write(출력값): 파일에 출력값을 씀.
    writelines(리스트, 튜플...): 리스트나 튜플에 들어있는 값들을 파일에 출력

3. 파일 사용이 끝나면 파일 닫음
file. close()


<경로표현>
1. 절대경로
C:\\Users\\Administrator\\PycharmProjects\\pythonProject\\day_07\\files

2. 상대경로
현재 프로그램을 기준으로 해당 파일을 찾아감
./ 현재 디렉토리
../ 상위 디렉토리
디렉토리명 => 하위 디렉토리

#20210607밑에 있는 names function 파일 찾아가기
../../day_06/10_names function.py

../files/a.txt

'''

def read1():
    print('=======read1========')
    file=open('./files/a.txt','r') #파일 읽기 모드로 오픈
    while True:
        s= file.read(5) #5바이트씩 읽기
        if s=='': #더이상 읽은것이 없을 때 멈춤
            break
        else:
            print(s,end='')
    print()
    file.close()

def read2():
    print('=======read2========')
    file = open('./files/a.txt', 'r')
    s = file.read() #한번에 전체 읽기
    print(s)
    file.close()

def read3():
    print('=======read3========')
    file = open('./files/a.txt', 'r')
    while True:
        s=file.readline() #한줄씩 읽기 > 엔터 기준으로 읽음
        if s=='':
            break
        else:
            print(s, end='')
    file.close()

def main():
    read1()
    read2()
    read3()

main()




