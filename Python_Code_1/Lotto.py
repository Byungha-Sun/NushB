def lotto(num):
    from random import shuffle
    from time import sleep

    for i in range(num):
        balls=[x+1 for x in range(45)]
        ret=[]

        for j in range(6):
            shuffle(balls)
            number = balls.pop()
            ret.append(number)
            ret.sort()
        print('로또번호 [%s]: ' % (i + 1), end='')
        print(ret)
        sleep(0.8)

lotto(5)