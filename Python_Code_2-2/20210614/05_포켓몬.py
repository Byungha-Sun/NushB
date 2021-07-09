class PocektMon: #상속이 목적이고 이 클래스로 객체생성 안할거임
    def __init__(self):
        self.name=''
        self.hp=0
        self.exp=0
        self.lv=1

    def 밥먹기(self):
        print(self.name,' 밥먹는다') #피카추: hp5증가. 꼬부기: hp8증가

    def 잠자기(self):
        print(self.name,' 잠잔다')

    def 운동하기(self):
        print(self.name,' 운동한다')

    def 놀기(self):
        print(self.name,' 논다')

    def 레벨체크(self):
        print(self.name,' 레벨체크')

    def 상태정보(self):
        print(self.name,' 상태정보')
        print('hp: ', self.hp)
        print('hp: ', self.exp)
        print('hp: ', self.lv)


class 피카추(PocektMon):
    def __init__(self):
        super().__init__()
        self.name= '피카추'
        self.hp= 30

    def 밥먹기(self):
        super().밥먹기()
        self.hp+=5

    def 잠자기(self):
        super().잠자기()
        self.hp+=10

    def 운동하기(self):
        super().운동하기()
        self.hp -=10
        flag= self.hp>0
        if flag:
            self.exp+=8
            self.레벨체크()
        return flag

    def 놀기(self):
        super().놀기()
        self.hp -= 7
        flag = self.hp > 0
        if flag:
            self.exp += 5
            self.레벨체크()
        return flag

    def 레벨체크(self):
        super().레벨체크()
        if self.exp>=20:
            self.lv+=1
            print(self.name, '레벨 1 증가')
            print('현재 레벨 : ', self.lv)
            self.exp-=20


class 파이리(PocektMon):
    def __init__(self):
        super().__init__()
        self.name = '파이리'
        self.hp = 20

    def 밥먹기(self):
        super().밥먹기()
        self.hp += 7

    def 잠자기(self):
        super().잠자기()
        self.hp += 12

    def 운동하기(self):
        super().운동하기()
        self.hp -= 13
        flag = self.hp > 0
        if flag:
            self.exp += 10
            self.레벨체크()
        return flag

    def 놀기(self):
        super().놀기()
        self.hp -= 10
        flag = self.hp > 0
        if flag:
            self.exp += 9
            self.레벨체크()
        return flag

    def 레벨체크(self):
        super().레벨체크()
        if self.exp >= 30:
            self.lv += 1
            print(self.name, '레벨 1 증가')
            print('현재 레벨 : ', self.lv)
            self.exp -= 30


class 꼬부기(PocektMon):
    def __init__(self):
        super().__init__()
        self.name = '꼬부기'
        self.hp = 40

    def 밥먹기(self):
        super().밥먹기()
        self.hp += 3

    def 잠자기(self):
        super().잠자기()
        self.hp += 7

    def 운동하기(self):
        super().운동하기()
        self.hp -= 12
        flag = self.hp > 0
        if flag:
            self.exp += 10
            self.레벨체크()
        return flag

    def 놀기(self):
        super().놀기()
        self.hp -= 9
        flag = self.hp > 0
        if flag:
            self.exp += 8
            self.레벨체크()
        return flag

    def 레벨체크(self):
        super().레벨체크()
        if self.exp >= 23:
            self.lv += 1
            print(self.name, '레벨 1 증가')
            print('현재 레벨 : ', self.lv)
            self.exp -= 23





class Menu():
    def __init__(self, char):
        self.char=char

    def run(self):
        flag=True
        while flag:
            menu=int(input('메뉴 선택: 1. 밥먹기 2.잠자기 3.운동하기 4.놀기 5.상태확인 6. 종료 : '))
            if menu=='1':
                self.char.밥먹기()
            elif menu=='2':
                self.char.잠자기()
            elif menu=='3':
                flag = self.char.운동하기()
            elif menu == '4':
                flag = self.char.놀기()
            elif menu =='5':
                self.char.상태정보()
            elif menu =='6':
                flag=False



def main():
    print('포켓몬 육성 게임 시작')
    char=input('캐릭터 선택: \n1.피카추(기본) 2.파이리 3.꼬부기 : ')
    ch=None
    if char=='2':
        ch=파이리()
    elif char=='2':
        ch=꼬부기()
    else:
        ch=피카추()
        
    ch.상태정보()
    mm=Menu(ch)
    mm.run()

main()







