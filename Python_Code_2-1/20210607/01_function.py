# 피카추 게임
def 밥먹음(hp_val):
    print('피카추 밥먹음')
    hp_val += 5
    return hp_val


def 잠잠(hp_val):
    print('피카추 잠잠')
    hp_val += 10
    return hp_val


def 놀기(hp_val, exp_val, lv_val):
    print('피카추 논다')
    hp_val -= 8
    flag = hp_val > 0
    if flag:
        exp_val += 5
        if exp_val >= 20:  # 경험치가 20 채워졌나?
            lv_val += 1  # 채워졌으면 레벨 1증가
            exp_val -= 20  # 경험치 20감소
            print('레벨 1 증가하였음')
    return hp_val, flag, exp_val, lv_val  # 파이썬은 여러개의 값을 반환할 수 있음. 튜플로 반환


def 운동하기(hp_val, exp_val, lv_val):
    print('피카추 운동함')
    hp_val -= 15
    flag = hp_val > 0
    if flag:
        exp_val += 10
        if exp_val >= 20:  # 경험치가 20 채워졌나?
            lv_val += 1  # 채워졌으면 레벨 1증가
            exp_val -= 20  # 경험치 20감소
            print('레벨 1 증가하였음')
    return hp_val, flag, exp_val, lv_val  # 파이썬은 여러개의 값을 반환할 수 있음. 튜플로 반환


def printInfo(hp_val, exp_val, lv_val):
    print('캐릭터 상태')
    print('hp:', hp_val)
    print('exp:', exp_val)
    print('lv:', lv_val)


def main():
    hp = 30  # 함수 안에서 선언. 지역변수
    exp = 0
    lv = 1
    flag = True
    while flag:
        menu = input('1.밥먹기 2.잠자기 3.운동하기 4.놀기 5.상태확인 6.종료')
        if menu == '1':
            hp = 밥먹음(hp)
        elif menu == '2':
            hp = 잠잠(hp)
        elif menu == '3':
            hp, flag, exp, lv = 운동하기(hp, exp, lv)  # 캐릭터 죽으면 루프를 빠져나감
        elif menu == '4':
            hp, flag, exp, lv = 놀기(hp, exp, lv)  # 캐릭터 죽으면 루프를 빠져나감
        elif menu == '5':
            printInfo(hp, exp, lv)
        elif menu == '6':
            print('게임 종료')
            break
        if not flag:
            print('캐릭터 사망')


main()