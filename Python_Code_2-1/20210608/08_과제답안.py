import os

def init(path): #초기화 함수
    if not os.path.isdir(path): #지정한 디렉토리 있나 확인하여 없으면
        os.mkdir(path)  #새로 생성

def selectFile(path): #파일 선택 함수.
    flist=os.listdir(path) #메모 디렉토리의 파일 목록 읽어옴 [a.txt, b.txt, c.txt]
    if len(flist)==0:
        print('파일이 없다')
        return
    print('메모 파일 목록')
    for i in range(0,len(flist)):
        print(i,'. '+flist[i])
    while True:
        idx=int(input('선택할 파일의 번호를 입력하시오'))
        if 0<=idx<=len(flist)-1:
            break
    return flist[idx]

def readFile(path):
    fname=selectFile(path)
    if fname==None:
        return
    print('선택한 파일명: ', fname)

    f=open(path+fname,'r',encoding='utf-8')
    s=f.read()
    print(s)
    f.close()

def nameCheck(path,fname):
    flist=os.listdir(path)
    mode= 'w'
    if fname in flist:
        x=int(input('1.덮어쓰기 2.이어쓰기 3.새파일명'))


def main():
    memo_path = 'memo'
    init(memo_path)
    readFile(memo_path)

main()


