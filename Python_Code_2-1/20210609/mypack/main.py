import calculation as calc #패키지 파일에 있는 모든 함수 불러올 수 있음
from calculation import add #패키지 파일에서 add함수 하나만 불러옴
import file_control as f


def main():
    # res=calc.add(1,2)
    res=add(1,2)
    print(res)

    res=calc.sub(1,2)
    print(res)

    base_path= '../../day_07/files/'
    s=f.file_read(base_path+'a.txt')
    print('a file content:', s)

    f.file_write(base_path+'k.txt', s)
    s=f.file_read(base_path+'k.txt')
    print('k file content: ', s)


    # f.file_write(base_path+'k.txt',s)
    #


main()


