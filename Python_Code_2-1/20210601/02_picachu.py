'''
피카추
hp(에너지상태) 0이면 죽음. 30
exp(경험치) 0
lv(경험치 20마다 1렙 증가) 1
'''

hp=30
exp=0
lv=1
while True:
    menu=int(input('1.밥먹기 2.잠자기 3.놀기 4.운동하기. 5.종료  입력: '))
    if menu==1:
        print('밥먹는다') #hp 5 증가
        hp+=5


    elif menu==2:
        print('잠잔다')#hp 10 증가
        hp+=10

    elif menu==3:
        print('논다')   #hp5감소. exp 7증가. hp감소(죽었나?) exp증가(레벨업 체크)
        hp-=5
        if hp<=0:
            print('피카추 사망')
            break
        exp += 7
        if exp/20>=1:
            lv+=1
            exp-=20
            print('레벨업','현재 레벨: ',lv)

    elif menu==4:
        print('운동한다')  #hp 15감소. exp15증가
        hp-=15
        if hp<=0:
            print('피카추 사망')
            break
        exp += 15
        if exp/20>=1:
            lv+=1
            exp-=20
            print('레벨업','현재 레벨: ',lv)

    elif menu==5:
        print('종료')
        break
    print('현재 hp: ', hp)
    print('현재 exp: ', exp)
    print('현재 lv: ', lv)