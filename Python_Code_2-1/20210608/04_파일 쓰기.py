# def write1():
#     file = open('./files/b.txt', 'w',encoding='utf-8')
#     file.write('hello file')
#     file.close()
#
# def write2():
#     file = open('./files/b.txt', 'w',encoding='utf-8')
#     while True:
#         s=input('메시지 입력(멈추려면 /stop):')
#         if s=='/stop':
#             break
#         else:
#             file.write(s+'\n')
#     file.close()

def copy(src,dest): #파일복사 src=원본파일 dest= 파일경로
    f1=open(src,'r',encoding='utf-8')
    f2=open(dest,'w',encoding='utf-8')
    data=f1.read()
    f2.write(data)
    f1.close()
    f2.close()

def write3():
    f=open('./files/a.txt','a',encoding='utf-8')
    f.write('가나다라마바사')
    f.close()

def write4():
    s=['aaa\n','bbb\n','ccc\n']
    f=open('./files/e.txt','w',encoding='utf-8')
    f.writelines(s)
    f.close

def with_open():
    with open('./files/e.txt','r') as f: #파일오픈 with 블록. open()동일. open()이 반환하는 파일 객체를 as뒤 변수에 저장. 파일 닫기 생략.
        while True:
            s=f.readline()
            if s=='':
                break
            else:
                print(s)

def main():
    #write1()
    # write2()
    #copy('./files/a.txt','./files/d.txt')
    # write3()
    # write4()
    with_open()

main()

