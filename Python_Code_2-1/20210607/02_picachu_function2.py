hp=30
exp=0
lv=1

def 밥먹기():
    global hp #hp는 전역변수다.
    print('피카추 밥먹음')
    hp+=5

def 잠자기():
    global hp
    print('피카추 잠')
    hp+=10

def 놀기():
    global hp,exp
    print('피카추 놈')
    hp-=8
    flag=hp>0
    if flag:
        exp+= 5
        레벨체크()
    return flag

def 운동하기():
    global hp,exp
    print('피카추 운동')
    hp-=15
    flag=hp>0
    if flag:
        exp+= 10
        레벨체크()
    return flag

def 상태확인():
    print('피카추 상태확인')
    print('hp: ',hp)
    print('exp: ',exp)
    print('lv: ',lv)

def 레벨체크():
    global exp,lv
    if exp>=20:
        lv+=1
        exp-=20
        print('레벨 1 증가함')

def main():
    flag=True
    while flag:
        menu = int(input('1.밥먹기 2.잠자기 3.놀기 4.운동하기 5.상태확인 6. 종료  :'))
        if menu==1:
            밥먹기()
        elif menu==2:
            잠자기()
        elif menu==3:
            flag= 놀기()
        elif menu==4:
            flag= 운동하기()
        elif menu==5:
            상태확인()
        elif menu==6:
            break
        if not flag:
            print('캐릭터 사망')



main()
