'''
main()
밥먹기,잠자기,운동하기,놀기
생명체크,레벨체크
메뉴 돌리기
main에서 메뉴 돌리는 함수 호출
'''

hp=30
exp=0
lv=1
res=True

def eat():
    print('[밥먹는다]')  # hp 5 증가
    global hp
    hp += 5

def sleep():
    print('[잠자기]')
    global hp
    hp += 10

def play():
    print('[놀기]')
    global hp
    hp -=5
    if hp<=0:
        print('!!!피카추 사망!!!')
        global res
        res = False
        return res

    global exp
    exp+=7
    if exp/20>=1:
        print('***레벨업***')
        exp-=20
        global lv
        lv+=1

def workout():
    print('[운동하기]')
    global hp
    hp -=15
    if hp<=0:
        print('!!!피카추 사망!!!')
        global res
        res=False
        return res

    global exp
    exp+=15
    if exp/20>=1:
        print('***레벨업***')
        exp-=20
        global lv
        lv+=1

def current():
    print('현재 hp:', hp)
    print('현재 exp:', exp)
    print('현재 lv:', lv)
    print()


def main():
    while res==True:
        menu=int(input('''1. 밥먹기 \n2. 잠자기\n3. 놀기\n4. 운동하기\n5. 종료\n\t입력: '''))
        if menu==1:
            eat()
        elif menu==2:
            sleep()
        elif menu==3:
            play()
        elif menu==4:
            workout()
        elif menu==5:
            break
        else:
            print('숫자 다시 입력')
        current()

main()


