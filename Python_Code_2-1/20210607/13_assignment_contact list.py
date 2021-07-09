##함수이용하여 주소록 만들기
#한사람정보(이름,전화번호,주소)
#1. 등록(이름중복안됨)
#2. 검색(이름으로) => 정보출력. 없다
#3. 수정(이름으로) => 전화,주소 수정
#4. 삭제(이름으로)
#5. 전체출력
#6. 종료

flag=True
contacts=[]
def 등록():
    name = input('등록할 이름: ')
    #이름 중복 체크
    res=검색(name)
    if res==None:
        tel = input("전화번호('-'제외 숫자만 입력): ")
        addr=input('주소: ')
        global contacts
        contacts.append([name,tel,addr])
        print(contacts)
    else:
        print('중복된 이름')
        global flag
        flag=False

def 검색(s_name):
    for idx, i in enumerate(contacts):
        if s_name==contacts[idx][0]:
            return  idx


def 검색출력():
    name= input('출력할 이름 검색: ')
    idx= 검색(name)
    if idx == None:
        print('없는 이름')
    else:
        print(contacts[idx])


def 수정():
    name=input('수정하고 싶은 정보의 이름: ')
    res=검색(name)
    tel_corr=input("새로운 전화번호('-'제외 숫자만 입력): ")
    addr_corr=input('새로운 주소: ')
    global contacts
    contacts[res][1]=tel_corr
    contacts[res][2]=addr_corr
    print('수정 완료', contacts[res])

def 삭제():
    name = input('삭제하고 싶은 정보의 이름: ')
    res=검색(name)
    global contacts
    del contacts[res]
    print('삭제 완료')

def 전체출력():
    print('연락처')
    for i in contacts:
        print(i)

def 종료():
    global flag
    flag=False
    return flag


def main():
    while flag:
        menu = int(input('1.등록 2.검색출력 3.수정 4.삭제 5.전체출력 6.종료'))
        if menu==1:
            등록()
        elif menu==2:
            검색출력()
        elif menu==3:
            수정()
        elif menu==4:
            삭제()
        elif menu==5:
            전체출력()
        elif menu==6:
            종료()

main()




