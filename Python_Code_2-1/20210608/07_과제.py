'''

프로그램이 시작되면 memo라는 디렉토리가 있는지 확인 > 있으면 그대로 사용, 없으면 새로 생성

메모장
1. 쓰기
    >쓰기메뉴 선택시 > 파일명을 입력받음 > 중복: 덮어쓸거냐:기존내용 지우고 작성
                                             이어쓸거냐: 기존 내용 살려서 뒤에 이어씀 => 키보드로 내용입력('/exit': 입력멈춤) 파일에 씀 > exit 하면, 파일닫고 종료
                                       새이름: 새 파일 생성

2. 읽기
    memo 디렉토리의 파일 목록 출력 > 읽을 파일 선택을 받음 > 그 파일을 읽기 모드로 오픈해서 파일 내용 읽어와서 출력

3. 삭제
    memo 디렉토리의 파일 목록 출력 > 삭제할 파일 선택을 받음 > 선택한 파일 삭제

4. 종료
'''
import os

flag=True

def check_memo():
    print('현재 디렉토리 : ',os.getcwd())
    if os.path.isdir('memo'):
        print('memo 디렉토리 있음')
    else:
        print('memo 디렉토리 없음')
        os.mkdir('memo')

    os.chdir('memo')
    print('현재 디렉토리: ',os.getcwd() )

def write_memo():
    file_name=input('파일명을 입력하세요: ')
    file_list=os.listdir()
    if file_name in file_list:
        choice=int(input('파일명 기존에 존재, 1. 덮어쓴다 2. 이어쓴다 : '))
        if choice==1:
            file=open(file_name,'w',encoding='utf-8')
            while True:
                s=input('입력(멈추려면 /exit): ')
                if s=='/exit':
                    break
                else:
                    file.write(s+'\n')
            file.close()
            return False

        else:
            file=open(file_name,'a',encoding='utf-8')
            while True:
                s=input('입력(멈추려면 /exit): ')
                if s=='/exit':
                    break
                else:
                    file.write(s+'\n')
            file.close()
            return False

    else:
        file = open(file_name, 'w', encoding='utf-8')
        while True:
            s = input('입력(멈추려면 /exit): ')
            if s == '/exit':
                break
            else:
                file.write(s + '\n')
        file.close()
        return False

def read_memo():
    file_list=os.listdir()
    cnt=1
    for i in file_list:
        print(cnt,'.',i)
        cnt+=1
    chosen_file=int(input('파일 번호 선택: '))
    file=open(file_list[chosen_file-1],'r',encoding='utf-8')
    s=file.read()
    print(s)
    file.close()

def remove_memo():
    file_list=os.listdir()
    cnt = 1
    for i in file_list:
        print(cnt,'.',i)
        cnt+=1
    chosen_file=int(input('파일 번호 선택: '))
    os.remove(file_list[chosen_file-1])
    print(file_list[chosen_file-1],'삭제')

def exit():
    global flag
    flag=False
    return flag

def main():
    check_memo()
    while flag:
        menu = int(input('1.쓰기 2.읽기 3.삭제 4.종료 : '))
        if menu==1:
            write_memo()
        elif menu==2:
            read_memo()
        elif menu==3:
            remove_memo()
        elif menu==4:
            exit()

main()








