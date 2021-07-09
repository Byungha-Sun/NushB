'''
파일의 읽고 쓰기 위치 제어
tell() : 현재 위치 반환
seek(off,whence): whence를 기준으로 off만큼 떨어진 위치로 이동. whence는 0(맨앞), 1(현재위치), 2(맨뒤)

ex)
abcdefghi

ab 읽었을때,
현재 위치: 2 (c)

seek(5,0) > f
seek(5,1) > h
seek(-1,1) > b
seek(-1,2) > g

'''

def writeFile():
    f=open('./files/f.txt','w')
    s='abcdefghijklmnopqrstuv'
    f.write(s)
    f.close()

def readline():
    f=open('./files/f.txt','rb')
    s=f.read(3)
    print(s)
    print('현재위치:',f.tell())

    f.seek(5,1)
    s=f.read(1)
    print('현재위치에서 5이동: ',s)
    print('현재위치: ',f.tell())

    f.seek(-2, 1)
    s = f.read(1)
    print('현재위치에서 -2이동: ', s)

    f.seek(10, 0)
    s = f.read(1)
    print('맨앞에서 10이동: ', s)

    f.seek(-1, 2)
    s = f.read(1)
    print('맨뒤에서 -1이동: ', s)

    f.close()

def main():
    writeFile()
    readline()

main()