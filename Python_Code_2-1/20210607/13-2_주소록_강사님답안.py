#이름, 전화, 주소
#members=[[이름, 전화, 주소],[이름, 전화, 주소],[이름, 전화, 주소]]
members = []
titles = ['name:', 'tel:', 'address:']

#등록함수
def addMember():
    m = [0,0,0]
    print('새 멤버 등록')
    for i in range(0, len(m)):
        if i==0:#이름 입력일때
            while True:
                m[i] = input(titles[i])
                res = getByName(m[i])
                if res==None:
                    break
        else:#전화, 주소 입력
            m[i] = input(titles[i])

    members.append(m)

def getByName(name):
    for idx, i in enumerate(members):
        if name==i[0]:
            return idx, i #튜플로 반환(idx, i) => res[0]:idx, res[1]:i

def printMember():
    print('멤버 검색')
    name = input('검색할 이름:')
    res = getByName(name)
    if res == None:
        print('not found name')
    else:
        i = res[1]
        cnt = 0
        for j in i:
            print(titles[cnt], j)
            cnt+=1
        print('-------------')

def printAll():
    print('모든 멤버')
    for i in members:#i는 한명 리스트 ['aaa', '111','asdf']
        cnt=0
        for j in i:
            print(titles[cnt], j)
            cnt+=1
        print('-------------')

def editMember():
    print('멤버 정보 수정')
    name = input('수정할 이름:')
    res = getByName(name)
    if res == None:
        print('not found name')
    else:
        i = res[1]
        i[1]=input('new tel:')
        i[2]=input('new address:')

def delMember():
    print('멤버 삭제')
    name = input('삭제할 이름:')
    res = getByName(name)
    if res == None:
        print('not found name')
    else:
        del members[res[0]]

def main():
    while True:
        menu = int(input('1.등록 2.검색 3.수정 4.삭제 5.전체출력 6.종료'))
        if menu == 1:
            addMember()
        elif menu == 2:
            printMember()
        elif menu == 3:
            editMember()
        elif menu ==4:
            delMember()
        elif menu == 5:
            printAll()
        elif menu == 6:
            break

main()